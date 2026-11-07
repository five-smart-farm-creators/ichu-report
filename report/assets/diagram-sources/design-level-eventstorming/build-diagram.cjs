/**
 * Rebuild the English Design-Level EventStorming board and its PNG export.
 * Requires Node.js and sharp. Run this file from any working directory.
 * The nineteen flows mirror the model table in section 4.1.1.
 */
const fs = require('node:fs');
const path = require('node:path');
const sharp = require('sharp');

// Columns: command, actor, domain event, policy, read model, aggregate.
const groups = [
  ['Cattle Information', [
    ['Register animal', 'Livestock administrator', 'Animal registered', 'None', 'Current herd, ear tags in use', 'Cattle'],
    ['Deregister animal', 'Livestock administrator', 'Animal deregistered', 'Release the assigned collar and exclude the animal from indicators', 'Animal record, assigned collar', 'Cattle'],
  ]],
  ['IoT Devices & Telemetry', [
    ['Assign collar to animal', 'Livestock administrator', 'Collar linked to animal', 'Check plan limit', 'Collar inventory, plan limit', 'IoTDevice'],
    ['Transmit reading', 'Cattle Band', 'Biometric reading captured', 'Evaluate thresholds for the production stage', 'Current thresholds', 'TelemetryReading'],
    ['Synchronize reading batch', 'Edge Gateway', 'Readings synchronized', 'Re-evaluate rules not applied at the edge', 'Synchronization status', 'TelemetryReading'],
  ]],
  ['Monitoring & Alerts', [
    ['None (automatic)', 'System', 'Temperature threshold exceeded', 'Generate an alert if no alert of the same type is open', 'Open alerts for the animal', 'MonitoringAlert'],
    ['None (automatic)', 'System', 'Animal outside grazing zone', 'Generate a security alert with distance to the boundary', 'Lot geofence', 'MonitoringAlert'],
    ['None (automatic)', 'System', 'Reproductive pattern detected', 'Record a possible estrus indicator', 'Animal baseline', 'MonitoringAlert'],
    ['Respond to alert', 'Livestock administrator', 'Alert addressed', 'Record response time and add the finding to the history', 'Alert details and associated telemetry', 'MonitoringAlert'],
  ]],
  ['Field Operations & Clinical Care', [
    ['Record field event', 'Field operator', 'Health event recorded', 'Queue for synchronization when coverage is unavailable', 'Downloaded animal record', 'LivestockOperation'],
    ['Record clinical intervention', 'Veterinarian', 'Intervention recorded', 'Start the withdrawal period for the administered product', 'Clinical history and active withdrawal periods', 'LivestockOperation'],
    ['None (automatic)', 'System', 'Treatment response deadline reached', 'Alert the veterinarian if vital signs do not return to range', 'Post-intervention progress', 'MonitoringAlert'],
  ]],
  ['Health Campaigns', [
    ['Schedule health campaign', 'Livestock administrator', 'Campaign scheduled', 'Detect overlap with withdrawal periods', 'Farm calendar, active withdrawal periods', 'HealthCampaign'],
    ['None (automatic)', 'System', 'Reminder time reached', 'Issue campaign reminder', 'Scheduled campaigns and application progress', 'HealthCampaign'],
    ['Record application', 'Field operator', 'Application recorded', 'Close campaign when all animals have received the application', 'Campaign progress', 'HealthCampaign'],
  ]],
  ['Subscriptions & Veterinary Advisory', [
    ['Subscribe to plan', 'Livestock administrator', 'Subscription activated', 'Enable plan features and device limit', 'Available plans and coverage', 'Subscription'],
    ['Request access to a herd', 'Veterinarian', 'Advisory access requested', 'Notify the administrator for a decision', 'Applicant professional profile', 'HerdAdvisory'],
    ['Grant access', 'Livestock administrator', 'Advisory access granted', 'Enable access restricted to the authorized herd', 'Pending requests', 'HerdAdvisory'],
  ]],
  ['Water Trough Control', [
    ['None (automatic)', 'System', 'Water temperature out of range', 'Activate heating and alert if the temperature does not return to range', 'Configured water trough temperature range', 'MonitoringAlert'],
  ]],
];

const palette = { actor: '#fff094', command: '#a5c7f3', event: '#ffc28d', policy: '#cec0ef', read: '#a4ddb6', aggregate: '#f4aaa9' };
const escape = value => value.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;').replaceAll('"', '&quot;');
function lines(value, max = 22) {
  const output = [];
  for (const word of value.split(' ')) {
    if (!output.length || output.at(-1).length + word.length + 1 > max) output.push(word);
    else output[output.length - 1] += ' ' + word;
  }
  return output;
}
function text(value, x, y, size = 24, weight = 400, width = 22) {
  return `<text x="${x}" y="${y}" font-size="${size}" font-weight="${weight}">${lines(value, width).map((line, i) => `<tspan x="${x}" dy="${i ? size * 1.23 : 0}">${escape(line)}</tspan>`).join('')}</text>`;
}
function note(value, kind, x, y) {
  const label = lines(value, 22);
  if (label.length > 6) throw new Error(`Note exceeds available height: ${value}`);
  return `<g><rect x="${x}" y="${y}" width="260" height="204" rx="3" fill="${palette[kind]}" stroke="#ffffff" stroke-width="2"/>${text(value, x + 15, y + 34, 22)}</g>`;
}

const width = 5350;
const height = 2540;
const nodes = [0, 1, 2, 3, 4, 5].map(i => 66 + i * 292);
const parts = [
  `<svg xmlns="http://www.w3.org/2000/svg" xml:lang="en" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}" role="img" aria-labelledby="title description">`,
  '<title id="title">SmartFarm | Design-Level EventStorming</title>',
  '<desc id="description">Nineteen flows across seven domain areas. Each row identifies an actor, command, domain event, policy, read model and aggregate. Arrows connect the actor to a command, a command to its event, an event to its policy and a policy to its resulting read model. Dashed arrows associate events with aggregates.</desc>',
  '<defs><marker id="arrow" markerWidth="9" markerHeight="9" refX="8" refY="4.5" orient="auto"><path d="M0 0L9 4.5L0 9Z" fill="#58615a"/></marker></defs>',
  '<rect width="100%" height="100%" fill="#ffffff"/>',
  '<g font-family="Arial, sans-serif" fill="#202b24">',
  text('SmartFarm | Design-Level EventStorming', 66, 84, 56, 700, 100),
];
const legend = [['actor', 'Actor'], ['command', 'Command'], ['event', 'Domain Event'], ['policy', 'Policy'], ['read', 'Read Model'], ['aggregate', 'Aggregate']];
legend.forEach(([kind, label], i) => {
  const x = 66 + i * 350;
  parts.push(`<rect x="${x}" y="120" width="36" height="36" fill="${palette[kind]}"/>`, text(label, x + 51, 147, 26, 400, 30));
});

// Keep each group intact; no connector crosses a note or an adjacent group.
const positions = [[0, 220], [1, 220], [2, 220], [0, 1320], [1, 1320], [2, 1320], [0, 2200]];
groups.forEach(([name, rows], groupIndex) => {
  const [column, top] = positions[groupIndex];
  const left = column * 1760;
  parts.push(`<g transform="translate(${left},${top})">`, text(name, 66, 0, 36, 700, 58));
  const headers = ['Actor', 'Command', 'Domain Event', 'Policy', 'Read Model', 'Aggregate'];
  headers.forEach((header, index) => parts.push(text(header, nodes[index], 44, 22, 700, 24)));
  rows.forEach(([command, actor, event, policy, read, aggregate], rowIndex) => {
    const y = 65 + rowIndex * 240;
    const values = [actor, command, event, policy, read, aggregate];
    const kinds = ['actor', 'command', 'event', 'policy', 'read', 'aggregate'];
    for (let index = 0; index < 4; index++) {
      // Automatic events have no user command; retain that fact in the blue note.
      parts.push(`<path d="M${nodes[index] + 260} ${y + 103}H${nodes[index + 1] - 5}" fill="none" stroke="#58615a" stroke-width="2" marker-end="url(#arrow)"/>`);
    }
    parts.push(`<path d="M${nodes[2] + 130} ${y + 204}V${y + 220}H${nodes[5] + 130}V${y + 207}" fill="none" stroke="#7f8982" stroke-width="2" stroke-dasharray="7 5" marker-end="url(#arrow)"/>`);
    values.forEach((value, index) => parts.push(note(value, kinds[index], nodes[index], y)));
  });
  parts.push('</g>');
});
parts.push('</g></svg>');
const svg = parts.join('\n');
const svgPath = path.join(__dirname, 'design-level-eventstorming.svg');
const pngPath = path.resolve(__dirname, '../../images/diagrams/design-level-eventstorming.png');
fs.writeFileSync(svgPath, svg + '\n');
sharp(Buffer.from(svg)).png().toFile(pngPath).then(() => {
  console.log(JSON.stringify({ svgPath, pngPath, width, height, flows: groups.reduce((count, [, rows]) => count + rows.length, 0) }));
}).catch(error => { console.error(error); process.exitCode = 1; });
