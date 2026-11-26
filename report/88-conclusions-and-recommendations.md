# Conclusiones

## Conclusiones y recomendaciones

### 1. Resultado frente al Problem Statement

El *Problem Statement* de **ICHU** plantea que la ganadería de pastoreo extensivo depende de inspecciones visuales discontinuas y de registros manuales en cuadernos u hojas de cálculo, lo que dificulta seguir a cada animal, detectar a tiempo una anomalía de salud y decidir cuando la cobertura de red en el campo es intermitente o nula.

La investigación del Capítulo II respaldó la relevancia del problema en ambos segmentos: los ganaderos describieron registros dispersos y conectividad irregular, y los veterinarios pidieron datos biométricos continuos y antecedentes por animal. La investigación comprende seis entrevistas y cuestionarios con dos ganaderos y tres profesionales; describe esa muestra y no todo el mercado.

Al cierre del proyecto, ICHU responde al problema con una solución IoT completa y desplegada:

* El **collar** (ESP32-S3) mide temperatura, actividad, posición, pulso, índice de metano y batería, y envía una lectura cada 10 s al Edge por Wi-Fi, con una cola de 60 lecturas que sobrevive a los reinicios.
* El **Portable Edge Gateway** (Flask, Peewee y SQLite) guarda las lecturas, evalúa umbrales por etapa y severidad y geocercas sin Internet, y sincroniza con la nube cuando hay conexión.
* El **panel de alertas** (ESP32) avisa en el predio con LEDs, zumbador y pantalla, también sin Internet.
* La **API central** (ASP.NET Core en Render) integra siete bounded contexts, calcula indicadores, tendencias y curvas epidemiológicas, y cobra las suscripciones con Stripe.
* La **aplicación web** (Firebase Hosting), la **aplicación móvil** (Android e iOS) y la **Landing Page** (GitHub Pages) completan la experiencia para ganaderos y veterinarios.

### 2. Assumptions frente a lo observado

La validación con usuarios (6.3.2) reunió a tres ganaderos y dos veterinarios, que revisaron la Landing Page y la aplicación web desplegada:

* Los ganaderos reconocieron el valor de centralizar información hoy repartida en archivos de Excel y Word, valoraron el monitoreo de salud, los filtros, las alertas y la exportación, y uno de ellos propuso migrar sus registros de forma gradual. Esto respalda el supuesto de usuario sobre el ganadero como usuario principal y los feature assumptions E3 y E5.
* Los veterinarios usaron la ficha, el historial clínico y el monitoreo por periodo para preparar una visita, y pidieron ver primero la observación más reciente y programar el siguiente control. Esto respalda el supuesto de usuario sobre el veterinario como usuario clave y los feature assumptions E6 y E8.
* El interés por las geocercas (E9) apareció en la entrevista a Jorge Chumpitaz, que preguntó cómo se conectaría la ubicación con los collares.

Los supuestos de negocio (suscripciones, retención, CAC) y los de resultado (reducción de mortalidad y del tiempo de inspección) siguen como objetivos por medir en un piloto: la muestra de validación no permite confirmarlos. Lo mismo ocurre con la autonomía de la batería (E1), que además se ve limitada por el consumo del sensor de metano del prototipo.

### 3. Hypothesis Statements y criterios de éxito

| Hipótesis | Lo construido | Estado al cierre |
|---|---|---|
| H1. Biometric and GPS Tracking | Collar con temperatura, actividad, GPS, pulso y metano, verificado en Wokwi CI | Funciona en simulación; falta medir precisión y autonomía en hardware real. |
| H2. Real-Time Alerts | Alertas en el Edge, panel del predio y notificaciones en el teléfono | El recorrido completo funciona en simulación y con la API desplegada; falta medir el tiempo de respuesta en campo. |
| H3. Analytics Dashboard | Indicadores, tendencias, curva epidemiológica y reporte ejecutivo | Validada de forma cualitativa con ganaderos y veterinarios. |
| H4. Offline Operation | Edge sin Internet y registros de campo guardados en el teléfono | Implementada; falta probarla en un predio sin cobertura. |
| H5. Individual Herd Records | Ficha, lotes, etapas y bajas del animal | Validada de forma cualitativa. |
| H6. Veterinary Clinical History | Intervenciones clínicas e historial por animal | Validada de forma cualitativa con dos veterinarios. |
| H7. Health Campaigns and Withdrawal Periods | Campañas, aplicaciones y periodos de retiro | Implementada; sin validación con usuarios. |
| H8. Livestock Calendar and Reminders | Calendario de actividades | Parcial: falta enviar el recordatorio (US-27). |
| H9. Geofencing and Lost-Animal Search | Geocercas, alertas de salida y última posición | Implementada; con interés expresado en la validación. |
| H10. Device Status and Maintenance | Inventario de collares, batería y asignaciones | Implementada; sin validación con usuarios. |
| H11. Authorized Herd Advisory | Solicitudes de acceso, asesorías y revocación | Implementada; sin validación con usuarios. |

Las hipótesis tienen hoy una solución que las hace comprobables, pero sus resultados de negocio (renovación del 92 %, 150 suscripciones, uso cinco días por semana) solo se pueden confirmar con un piloto que mida a lo largo del tiempo.

### 4. Recomendaciones y roadmap

1. **Piloto en un predio real:** instalar collares, Edge y panel con un ganadero de la validación para medir la precisión de los sensores, la autonomía de la batería, el alcance del Wi-Fi y el tiempo entre una lectura y el aviso.
2. **Completar el Sprint 3:** implementar el modo de bajo consumo del collar (TS-02), la detección de un posible celo (US-18) y el envío de recordatorios (US-27).
3. **Validar la aplicación móvil:** repetir la validación con tareas en el APK y sumar una entrevista con un tercer veterinario.
4. **Llevar las alertas al teléfono sin la aplicación abierta:** sumar notificaciones push desde la nube y, más adelante, la lectura directa del Edge por la red local (TS-16 y TS-17).
5. **Medir los resultados de negocio:** registrar en el piloto la línea base de mortalidad y de tiempo de inspección, y seguir conversión y renovación de suscripciones.

### Conclusiones de TB1 (historial)

#### Conclusiones

En TB1, el diseño de la experiencia de ICHU pasó de las decisiones de estilo y arquitectura de información a representaciones concretas de la Landing Page y de la Web Application. El Capítulo V reúne wireframes, mockups, wireflows y user flows vinculados con las necesidades y las historias de usuario; el prototipo web y la Landing Page pueden explorarse en sus despliegues documentados en el Capítulo VI. Esta continuidad facilita revisar cómo la propuesta visual orienta las tareas principales de ganaderos y veterinarios.

En TB1, el Capítulo VI documentó la configuración, las interfaces y los despliegues de la Landing Page y la Web Application. En ese corte, la aplicación web usaba datos ficticios en memoria, sin autenticación real, API ni persistencia; la Landing Page era estática y su formulario derivaba la solicitud a WhatsApp. La entrega TB1 no incluía una aplicación móvil nativa. La actualización posterior de Sprint 2 se resume por separado abajo y no cambia retroactivamente el alcance de TB1.

#### Recomendaciones

1. Validar las tareas principales de ganaderos y veterinarios con participantes de ambos segmentos. Registrar errores, tiempos, comprensión de alertas y dificultades de navegación, y relacionar los resultados con las hipótesis de producto.
2. Ampliar las comprobaciones del frontend con recorridos reproducibles de extremo a extremo, revisión de accesibilidad por teclado y tecnología de asistencia, y pruebas de idioma y diseño adaptable. Separar los resultados de la Landing Page estática de los de la Web Application.
3. Convertir la planificación simulada del Sprint 1 en un backlog de ejecución con fechas, responsables confirmados, criterios de aceptación y estados verificables. Documentar la revisión y los cambios de alcance a partir del trabajo efectivamente realizado.
4. En incrementos posteriores, integrar gradualmente autenticación, persistencia y servicios reales con las interfaces, preservando la separación de responsabilidades y la operación de borde definida en la arquitectura. Registrar las decisiones y pruebas de integración antes de presentar capacidades como implementadas.
5. Incorporar en los anexos las evidencias audiovisuales de TB1 cuando estén disponibles, junto con sus enlaces de acceso y la identificación de la entrega.

## Video About-the-Team

### Propósito y contenido requerido

El video presenta la startup, el problema investigado, los artefactos de requisitos y diseño, la organización del trabajo colaborativo y las conclusiones del equipo.

Ver video About-the-Team en SharePoint ([https://upcedupe-my.sharepoint.com/:v:/g/personal/u201817507_upc_edu_pe/IQBA-ACfpHmEQqEMz-LT9aY2AZB9_M63aISNQf-1CuEgzNI?e=VdgtfC&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D](https://upcedupe-my.sharepoint.com/:v:/g/personal/u201817507_upc_edu_pe/IQBA-ACfpHmEQqEMz-LT9aY2AZB9_M63aISNQf-1CuEgzNI?e=VdgtfC&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D))

### Pauta de secuencias

| Secuencia | Inicio sugerido | Contenido |
|---|---:|---|
| Presentación del equipo | 00:00:00 | Startup, producto ICHU, integrantes y roles |
| Proceso de investigación | 00:01:00 | Entrevistas, cuestionarios, Needfinding y hallazgos |
| Requisitos y diseño | 00:03:00 | User Stories, Impact Mapping, Bounded Contexts y arquitectura |
| Trabajo colaborativo | 00:05:00 | GitFlow, revisión de artefactos y organización del repositorio |
| Testimonios individuales | 00:07:00 | Actividades, Student Outcome y competencias de cada integrante |
| Cierre y próximos pasos | 00:13:00 | Roadmap, validaciones y aprendizajes del equipo |
