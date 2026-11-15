# Capítulo VI: Product Implementation, Validation & Deployment

Este capítulo registra la configuración del software y las evidencias disponibles del Sprint 1. El alcance desarrollado y documentado aquí comprende dos interfaces: la Landing Page de ICHU y el frontend web de la plataforma. No se implementó un backend; por ello, las pantallas, cifras de ejemplo y respuestas visuales descritas no acreditan persistencia de datos ni servicios conectados.

## 6.1. Software Configuration Management

### 6.1.1. Software Development Environment Configuration

La Landing Page de ICHU se desarrolla como un sitio estático con **HTML, CSS y JavaScript**, sin framework ni proceso de compilación. El código está organizado en páginas HTML, una hoja de estilos compartida (`css/styles.css`) y dos módulos JavaScript: `js/i18n.js`, para idioma, y `js/main.js`, para navegación e interacciones. Los recursos gráficos y de video se mantienen en carpetas propias.

Para una revisión local, el README del repositorio permite abrir `index.html` directamente en un navegador o iniciar un servidor estático con `npx serve .` o `python -m http.server 8080`. El README también menciona una comprobación con jsdom para identificar IDs duplicados, recursos faltantes, anclas rotas y estilos inline; sin embargo, en la copia del proyecto revisada no se encontró el script ni un `package.json` que permita ejecutarla. Por tanto, esa comprobación no es reproducible con el material disponible y no se presenta como una prueba ejecutada.

El frontend web de la plataforma es un segundo artefacto, desarrollado con Angular y TypeScript, con componentes de Angular Material. Su repositorio de código ([https://tinyurl.com/26pp9tjq](https://tinyurl.com/26pp9tjq)) incluye el manifiesto de dependencias y los comandos del proyecto. En la revisión del manifiesto se observaron Angular y Angular Material 22.2.2, TypeScript 6.0.3 y Playwright 1.64.0; las versiones corresponden al estado del repositorio consultado y no implican que exista un backend conectado. Las capturas disponibles muestran la interfaz de inicio de sesión y un dashboard con datos de muestra.

| Elemento | Configuración documentada |
|---|---|
| Landing Page — lenguajes y ejecución | HTML, CSS y JavaScript; navegador web, con servidor estático opcional |
| Landing Page — organización | Páginas HTML, `css/styles.css`, `js/i18n.js` y `js/main.js`; no utiliza framework ni proceso de compilación |
| Web Application — tecnologías verificadas | Angular 22.2.2, TypeScript 6.0.3 y Angular Material 22.2.2, según el manifiesto del repositorio ([https://tinyurl.com/26pp9tjq](https://tinyurl.com/26pp9tjq)) |
| Web Application — comandos del manifiesto | `npm start`, `npm run build`, `npm run typecheck` y `npm run test:e2e`; este último ejecuta Playwright |
| Backend | No implementado en el alcance documentado; la interfaz web presenta datos de ejemplo |
| Landing Page — validación automatizada | El README menciona jsdom, pero no se encontró el script ni su configuración en la copia revisada; no es reproducible desde esa copia |

Fuente: README del repositorio LandingPageSmartFarm, [https://tinyurl.com/27vbhfce](https://tinyurl.com/27vbhfce)

### 6.1.2. Source Code Management

El código de la Landing Page y el informe se mantienen en repositorios Git separados: [https://tinyurl.com/27vbhfce](https://tinyurl.com/27vbhfce) y [https://tinyurl.com/2dhmo9ou](https://tinyurl.com/2dhmo9ou). Esta separación permite revisar la evolución del producto web y la documentación de manera independiente.

Para el repositorio del informe, la guía de contribución define `main` para entregas publicadas, `develop` para integración y ramas `feature/<alcance>` o `fix/<alcance>` para cambios de trabajo. Las contribuciones se integran mediante Pull Request con revisión de otro integrante, y los commits siguen Conventional Commits. El Capítulo VI se trabaja en la rama `feature/chapter-VI`, publicada en GitHub y aún no integrada en `main`.

La captura del deployment de Vercel registra el frontend web en la rama `main`, en el commit `1d6994c`, integrado desde el Pull Request #10 de `feature/app-integration`. El código fuente se mantiene en el repositorio WebFrontend-SmartFarm ([https://tinyurl.com/26pp9tjq](https://tinyurl.com/26pp9tjq)). Las convenciones de ramas y commits de ese repositorio no se infieren de las reglas de `Report-SmartFarm`.

| Práctica | Convención del repositorio del informe |
|---|---|
| Ramas de trabajo | `feature/<alcance>` o `fix/<alcance>`, creadas desde `develop` |
| Integración | Pull Request hacia la rama correspondiente y revisión por otro integrante |
| Mensajes de commit | Conventional Commits, en minúsculas, con alcance opcional |
| Rama de entrega | `main` |

Fuente: archivo CONTRIBUTING.md del repositorio Report-SmartFarm. La convención anterior describe el repositorio del informe; cualquier diferencia en el flujo del repositorio de la Landing Page debe confirmarse con su configuración y responsables.

### 6.1.3. Source Code Style Guide & Conventions

Las convenciones identificables en la documentación del proyecto son:

- Mantener la estructura semántica de cada página en HTML y centralizar los estilos compartidos en `css/styles.css`.
- Mantener separadas las traducciones (`js/i18n.js`) y las interacciones de interfaz (`js/main.js`).
- Definir la paleta mediante variables CSS y reutilizar esos tokens para los temas claro y oscuro.
- Incluir nombres accesibles, etiquetas ARIA y alternativas textuales donde correspondan; el README señala navegación por teclado y soporte para movimiento reducido.
- Mantener imágenes optimizadas en WebP, declarar sus dimensiones y usar carga diferida cuando corresponda.

Estas convenciones resumen la guía del repositorio de la Landing Page. No se afirma que se haya ejecutado una auditoría automatizada de accesibilidad o estilo para este informe.

### 6.1.4. Software Deployment Configuration

La Landing Page se publicó como sitio estático en un preview administrado desde FPM Desk. Según la información proporcionada por el equipo, el servidor es privado, pertenece a FPM y fue creado por Flor de María Contreras. La consola muestra el proyecto `LandingPageSmartFarm`, el repositorio de GitHub conectado, la rama `main`, la receta `Static HTML` y el estado del preview como **Público**. El flujo separa el preview de Producción, que aparece como una etapa opcional; por ello, esta evidencia acredita un preview publicado, no una promoción a producción.

URL completa del preview: [https://smartfarm-ichu-preview.fpm.it.com/](https://smartfarm-ichu-preview.fpm.it.com/)

El frontend de la aplicación web se despliega por separado en Vercel, que distingue entornos locales, de preview y de producción [11]; sus evidencias del entorno de producción y de la interfaz publicada se presentan en la sección 6.2.1.8.

La consola registra seis ejecuciones de despliegue. En la captura, la más reciente figura como lista, construida desde el commit `23c4793` de `main` el 9 de septiembre de 2026, con la receta `Static HTML` y una duración de cuatro segundos. La URL respondió con HTTP 200 durante la verificación de este informe el 8 de octubre de 2026.

![Panel FPM Desk con la lista de proyectos y el proyecto LandingPageSmartFarm](assets/images/deployment/fpm-projects.png)

*Figura 6.1. Lista de proyectos en FPM Desk; se identifica LandingPageSmartFarm con un preview disponible.*

![Configuración del preview en FPM Desk](assets/images/deployment/fpm-preview-configuration.png)

*Figura 6.2. Detalle del preview: repositorio GitHub conectado, rama `main`, receta Static HTML, URL completa visible y estado público. El panel indica Producción como una etapa opcional.*

![Historial de ejecuciones de despliegue en FPM Desk](assets/images/deployment/fpm-deployment-history.png)

*Figura 6.3. Historial de seis ejecuciones, con la más reciente en estado «Listo».*

![Landing Page de ICHU abierta desde la URL publicada](assets/images/deployment/published-preview.png)

*Figura 6.4. Portada en español cargada desde el preview público; la barra del navegador muestra smartfarm-ichu-preview.fpm.it.com.*

## 6.2. Landing Page, Services & Applications Implementation

### 6.2.1. Sprint 1

El Capítulo III asigna ocho historias al Sprint 1, con un total estimado de 33 puntos: siete para la Landing Page y una para la primera versión del frontend web. Esta selección es la **línea base del backlog planificado**, no trabajo aceptado ni velocidad validada del equipo. Los recorridos de acceso, perfil y ficha del animal de US-58 utilizan datos de ejemplo y validación local; no completan las historias de autenticación, autorización, persistencia ni contratación real previstas para la integración posterior.

#### 6.2.1.1. Sprint Planning 1

El Sprint 1 se orienta a presentar la propuesta de ICHU y habilitar los primeros recorridos de la plataforma web para ganaderos y médicos veterinarios.

<table>
  <colgroup>
    <col style="width: 34%;"/>
    <col style="width: 66%;"/>
  </colgroup>
  <tbody>
    <tr>
      <th align="left" scope="row" width="34%">Sprint #</th>
      <td>Sprint 1</td>
    </tr>
    <tr>
      <th align="left" colspan="2">Sprint Planning Background</th>
    </tr>
    <tr>
      <td>Date</td>
      <td>2026-10-02</td>
    </tr>
    <tr>
      <td>Time</td>
      <td>08:00 PM (hora de Lima, UTC-5)</td>
    </tr>
    <tr>
      <td>Location</td>
      <td>Lima, Perú.</td>
    </tr>
    <tr>
      <td>Prepared By</td>
      <td>Avalos Cordova, Diego Andres</td>
    </tr>
    <tr>
      <td>Attendees (to planning meeting)</td>
      <td>Arrieta Quispe, Alison Jimena<br/>Sanchez Arenas, Manuel Angel<br/>Contreras Leon, Flor de María<br/>Awad Vargas, Giorgio Marzouk<br/>Avalos Cordova, Diego Andres</td>
    </tr>
    <tr>
      <td>Sprint 0 Review Summary</td>
      <td>No aplica: es el primer Sprint del proyecto y no existe una revisión de un Sprint anterior.</td>
    </tr>
    <tr>
      <td>Sprint 0 Retrospective Summary</td>
      <td>No aplica: es el primer Sprint del proyecto y no existe una retrospectiva de un Sprint anterior.</td>
    </tr>
    <tr>
      <th align="left" colspan="2">Sprint Goal &amp; User Stories</th>
    </tr>
    <tr>
      <td>Sprint 1 Goal</td>
      <td>Publicar la primera versión de la Landing Page y del frontend web para conocer ICHU, comparar planes, solicitar una demostración y recorrer la experiencia inicial con datos de ejemplo.<br/><strong>Métrica de cumplimiento:</strong> ambas interfaces publicadas y navegables, con verificación de los criterios de las ocho historias seleccionadas, sin requerir backend, aplicación móvil nativa ni dispositivos conectados.</td>
    </tr>
    <tr>
      <td>Sprint 1 Velocity</td>
      <td>33 Story Points propuestos para el alcance frontend. La capacidad real se contrasta con los puntos de las historias aceptadas al cierre; no se declara una velocidad observada.</td>
    </tr>
    <tr>
      <td>Sum of Story Points</td>
      <td>33 Story Points distribuidos en ocho historias del Sprint Backlog 1.</td>
    </tr>
  </tbody>
</table>

#### 6.2.1.2. Aspect Leaders and Collaborators

La siguiente distribución es una **planificación transversal simulada** agregada en Jira. Las 21 tareas seleccionadas llevan la etiqueta `simulado` y permanecen en estado **Por hacer**. Los nombres de la tabla son responsables propuestos, no evidencia de asignación ni de trabajo completado. En el proyecto, SF-96 es la única de estas tareas asignada a una cuenta de integrante; las demás siguen sin asignar. Al intentar añadir integrantes, Jira confirmó la incorporación de una cuenta existente y notificó dos solicitudes de acceso pendientes de aprobación administrativa. El aviso no identificó a quiénes corresponden esas solicitudes ni confirmó individualmente el estado de las otras dos cuentas. No se inició un sprint. Este conjunto no equivale al Sprint Backlog 1: la selección de implementación del Sprint 1 es de ocho historias y 33 SP; las tareas de APIs, Edge, integración móvil y hardware quedan fuera de ella.

Consulta del conjunto de tareas en Jira: [https://tinyurl.com/2xs98v8n](https://tinyurl.com/2xs98v8n)

| Responsable propuesto | Tareas simuladas en Jira |
|---|---|
| Contreras Leon, Flor de María | SF-96 — Capítulo V, diseño UI/UX y Landing Page; SF-106 — Dashboard & Analytics, indicadores e informes. |
| Avalos Cordova, Diego Andres | SF-97 — Capítulo VI, frontend, pruebas y despliegue; SF-102 — Operations & Monitoring; SF-109 — Portable Edge Gateway; SF-112 — integración del frontend web/móvil con las APIs. |
| Arrieta Quispe, Alison Jimena | SF-98 — correcciones editoriales; SF-103 — Cattle Information; SF-107 — Identity & Access Management; SF-116 — trazabilidad entre Bounded Contexts, APIs, Jira e informe. |
| Sanchez Arenas, Manuel Angel | SF-99 — correcciones de requisitos y trazabilidad; SF-105 — Planning; SF-113 — contratos OpenAPI/Swagger; SF-114 — pruebas de integración entre frontend, API y Edge. |
| Awad Vargas, Giorgio Marzouk | SF-100 — correcciones de pruebas y despliegue; SF-108 — Subscription Plans; SF-115 — verificación de entornos y despliegues. |
| Romero Meza, Jhimy Pool | SF-101 — correcciones de figuras; SF-104 — IoT Assets; SF-110 — prototipo conceptual del collar IoT; SF-117 — auditoría de criterios y evidencias de entrega. |

Los siete Bounded Contexts de la arquitectura se reflejan como trabajo propuesto del monolito modular; Portable Edge Gateway y los prototipos IoT se registran como tareas transversales, no como implementación del Sprint 1. El diseño conceptual de dispositivos del Capítulo V se conserva como documentación de TB1 y no acredita sensores, Edge ni APIs implementados o conectados.

#### 6.2.1.3. Sprint Backlog 1

La tabla contiene únicamente las ocho historias seleccionadas del Product Backlog del Capítulo III, con el mismo orden y estimación. El resultado esperado se limita a la Landing Page y al primer frontend; no declara las historias como completadas ni acredita integración de servicios.

| Prioridad | Historia | Resultado esperado | Puntos | Sprint asignado |
|---:|---|---|---:|---|
| 1 | US-32 — Conocer la propuesta de ICHU | Presentar la propuesta, los beneficios por segmento y los productos digitales. | 3 | Sprint 1 |
| 2 | US-33 — Acceder al destino correspondiente a mi segmento | Dirigir al registro o acceso del segmento y conservar la selección de plan, sin crear una cuenta ni activar permisos. | 2 | Sprint 1 |
| 3 | US-35 — Comparar los planes y estimar el costo | Comparar planes y calcular una estimación informativa con valores publicados y validación local; sin cobro ni contratación. | 5 | Sprint 1 |
| 4 | US-36 — Consultar los términos y condiciones del servicio | Publicar condiciones de uso, tratamiento de datos y fecha de actualización. | 2 | Sprint 1 |
| 5 | US-59 — Solicitar una demostración desde la Landing Page | Validar los datos en el navegador y preparar la solicitud en el canal de contacto; el usuario decide enviarla. | 3 | Sprint 1 |
| 6 | US-37 — Consultar la experiencia en mi idioma | Presentar el contenido en inglés o español latinoamericano y conservar la preferencia. | 5 | Sprint 1 |
| 7 | US-38 — Acceder a la experiencia con tecnología de asistencia | Permitir el recorrido por teclado y lector de pantalla, con nombres y alternativas textuales accesibles. | 5 | Sprint 1 |
| 8 | US-58 — Explorar la primera versión del frontend web | Ofrecer los recorridos iniciales del frontend web con datos de ejemplo y validación local, sin API ni dispositivos conectados. | 8 | Sprint 1 |
|  | **Total planificado** |  | **33** |  |

Fuente: Product Backlog y alcance por iteración y roadmap, Capítulo III.

#### 6.2.1.4. Development Evidence for Sprint Review

Las capturas siguientes documentan la presentación de la Landing Page en español e inglés, el tema oscuro y una vista móvil simulada. La tercera captura muestra una sección de contenido para ganaderos con una ficha visual de ejemplo; esta ficha forma parte de la presentación de la propuesta y no demuestra que exista una aplicación funcional de gestión del hato.

![Portada de ICHU en español en navegador de escritorio](assets/images/implementation/landing-page-es-desktop.png)

*Figura 6.5. Portada de la Landing Page en español vista en escritorio. Captura de navegador proporcionada por el equipo.*

![Sección de presentación de ICHU en inglés en navegador de escritorio](assets/images/implementation/landing-page-en-desktop.png)

*Figura 6.6. Sección «What is ICHU?» en inglés, abierta desde un archivo local en el navegador. Captura de navegador proporcionada por el equipo.*

![Sección para ganaderos con tema oscuro](assets/images/implementation/landing-page-en-dark-theme.png)

*Figura 6.7. Vista en inglés con tema oscuro y contenido dirigido a ganaderos. La ficha del animal en la imagen es un recurso ilustrativo de la Landing Page, no evidencia de una función conectada a datos.*

![Portada de ICHU adaptada a una vista móvil](assets/images/implementation/landing-page-en-mobile.png)

*Figura 6.8. Portada en inglés en la emulación de un viewport móvil de 360 × 800 píxeles. La captura muestra una vista emulada en navegador, no una prueba en un dispositivo físico.*

La interfaz web de la plataforma también se muestra en el dashboard de la Figura 6.12. Esa captura acredita la presentación del frontend; los indicadores son datos de muestra y no evidencian conexión con un backend.

#### 6.2.1.5. Testing Suite Evidence for Sprint Review

Se realizó una comprobación manual preliminar de renderizado con Chrome DevTools en el preset **iPad Mini**, viewport de 768 × 1024 píxeles, al 75 % y sin limitación de red. La primera captura permite ver la portada, la navegación móvil y el comienzo de la sección siguiente, pero no permite evaluar los controles ni muestra la barra con la URL.

| Caso | Resultado observado | Estado |
|---|---|---|
| Renderizado del preview en viewport iPad Mini (768 × 1024) | La portada carga en Chrome incógnito; la URL del preview se ve en la barra y el contenido se adapta al viewport emulado. | Aprobado, comprobación visual |
| Consola en la primera inspección | Se vio `[Violation] Permissions policy violation: unload is not allowed in this document.`, con fuente `content.d0f3cf01.js`. | Observado una vez; origen no confirmado |
| Consola en la repetición de incógnito | No aparecen errores ni advertencias en la consola de la captura. El mensaje anterior no se reproduce; esto sugiere que pudo provenir de una extensión o estado del navegador, pero no confirma su origen. | Aprobado en esta repetición |
| Cambio de idioma, tema, menú y validación del formulario | Las capturas de desarrollo muestran los estados español, inglés y tema oscuro, pero no registran la activación de esos controles. El menú y el envío del formulario tampoco se probaron. | Estados visuales capturados; comportamiento no verificado |
| Suite automatizada descrita en el README | En la copia revisada no están el script jsdom ni su configuración, así que no fue posible ejecutar ni reproducir esa suite. | Pendiente; no ejecutada |

![Prueba manual preliminar en emulación de iPad Mini con la consola de DevTools abierta](assets/images/tests/landing-preview-ipad-mini-console.png)

*Figura 6.9. La página se renderiza en un viewport móvil emulado; DevTools muestra una violación de Permissions Policy procedente de `content.d0f3cf01.js`, cuyo origen debe confirmarse.*

![Repetición de la prueba en incógnito con viewport iPad Mini y consola limpia](assets/images/tests/landing-preview-ipad-mini-incognito.png)

*Figura 6.10. Repetición de la inspección en Chrome incógnito: la dirección del preview aparece en la barra, la portada se renderiza en el viewport iPad Mini y DevTools no muestra errores ni advertencias.*

#### 6.2.1.6. Execution Evidence for Sprint Review

Las Figuras 6.6 y 6.8 muestran la Landing Page cargada localmente; la primera deja visible la ruta del archivo y la segunda la emulación de un viewport móvil. La Figura 6.4 muestra la portada abierta desde el preview de FPM Desk, cuya URL respondió con HTTP 200 durante la verificación del 8 de octubre de 2026. La Figura 6.12 muestra el dashboard del frontend web de Vercel; su URL también respondió con HTTP 200 en esa fecha. Estas evidencias acreditan renderizado y disponibilidad de las interfaces en ese momento; no demuestran una prueba en teléfono físico, la conexión con servicios backend ni el funcionamiento integral de idioma, tema o formulario.

#### 6.2.1.7. Services Documentation Evidence for Sprint Review

El alcance de este incremento comprende interfaces frontend. La Landing Page es un sitio estático que presenta ICHU; su formulario prepara una solicitud y abre WhatsApp para que la persona la envíe. No procesa ni almacena la solicitud en un backend propio. El frontend web publicado en Vercel presenta un dashboard y otras vistas de gestión, pero la captura disponible indica que no hay conexión meteorológica en vivo y sus cifras se identifican como datos de muestra.

| Interfaz o servicio | Documentación disponible | Límite comprobado |
|---|---|---|
| Landing Page | Páginas estáticas `index.html`, `media.html` y `como-funciona.html`; navegación, alternancia de idioma y tema, contenido informativo y formulario que abre WhatsApp. | Se verifican archivos y pantallas; las capturas no demuestran que se haya probado cada interacción ni que exista procesamiento en servidor. |
| Frontend web de la plataforma | Dashboard con indicadores del hato y navegación a animales, ubicación, monitoreo, alertas e historial clínico. URL publicada: [https://web-frontend-smart-farm.vercel.app/](https://web-frontend-smart-farm.vercel.app/) | La captura muestra datos de ejemplo y señala que no hay conexión meteorológica en vivo. No demuestra persistencia ni consumo de una API. |
| Backend y contratos de servicios | No se implementaron backend ni endpoints API dentro del alcance documentado; no hay contratos OpenAPI/Swagger que adjuntar para este incremento. | No se presentan servicios ni integración backend como implementados o probados. |

El preview de la Landing Page está disponible en [https://smartfarm-ichu-preview.fpm.it.com/](https://smartfarm-ichu-preview.fpm.it.com/). La aplicación frontend de Vercel está disponible en [https://web-frontend-smart-farm.vercel.app/](https://web-frontend-smart-farm.vercel.app/). Las capturas de despliegue correspondientes se encuentran en las Figuras 6.1–6.4 y 6.11–6.12.

#### 6.2.1.8. Software Deployment Evidence for Sprint Review

La aplicación web de ICHU tiene un despliegue de producción separado de la Landing Page alojada en el preview de FPM Desk. La consola de Vercel muestra el deployment como **Ready**, asociado a `main` y al commit `1d6994c` (`Merge pull request #10 from SmartFarm-8733/feature/app-integration`). El dominio de producción mostrado es [https://web-frontend-smart-farm.vercel.app/](https://web-frontend-smart-farm.vercel.app/); durante la verificación de este informe respondió con HTTP 200. La ruta de dashboard capturada en el navegador es [https://tinyurl.com/26dp62g7](https://tinyurl.com/26dp62g7) y también respondió con HTTP 200.

![Deployment de producción del frontend de ICHU en Vercel](assets/images/deployment/vercel-production-deployment.png)

*Figura 6.11. Panel de Vercel: deployment de producción en estado Ready, rama `main`, commit `1d6994c` y dominio `web-frontend-smart-farm.vercel.app`.*

![Dashboard del frontend de ICHU abierto desde Vercel](assets/images/deployment/vercel-dashboard-app.png)

*Figura 6.12. Dashboard del frontend cargado desde la URL de Vercel. Las cifras del hato que aparecen en pantalla son datos de muestra de la interfaz; esta captura no demuestra su persistencia ni conexión con un backend productivo.*

#### 6.2.1.9. Team Collaboration Insights during Sprint

La evidencia disponible muestra coordinación mediante cambios versionados, despliegues y una distribución de tareas propuesta. En el historial del informe, Avalos Cordova, Diego Andres (`diegodev-22`) registró cambios de diseño para la Landing Page y los flujos de la aplicación; Contreras Leon, Flor de María (`FlorDeMa`) incorporó el diseño de dispositivos IoT y el avance de documentación. El historial se consulta en [https://tinyurl.com/2d28emyf](https://tinyurl.com/2d28emyf). La captura de Vercel registra la integración del frontend a `main` desde el Pull Request #10 de `feature/app-integration`.

El plan documentado no fija las fechas oficiales ni la duración del Sprint 1. Por ello, estos commits y el deployment se presentan como evidencia de colaboración del proyecto, sin afirmar que ocurrieron dentro de un Sprint con fechas confirmadas.

La distribución transversal de 21 tareas seleccionadas en Jira es simulada y no equivale a las ocho historias seleccionadas para Sprint 1: las tareas siguen como **Por hacer** y los responsables de la tabla de 6.2.1.2 son propuestos. Por tanto, esa planificación no prueba que las tareas hayan sido completadas por esas personas. Tampoco hay actas o registros que acrediten reuniones diarias, una Sprint Review formal o una retrospectiva; no se reportan como celebradas.

| Evidencia | Aporte a la coordinación | Alcance de lo que demuestra |
|---|---|---|
| Historial Git del informe | Cambios de Diego en wireframes, flujos y visuales de la Landing Page; cambios de Flor en diseño IoT y documentación de capítulos V y VI. | Acredita contribuciones versionadas al informe y sus artefactos; no demuestra por sí sola la implementación del frontend de la plataforma. |
| Deployment Vercel | Pull Request #10 de `feature/app-integration` integrado en `main`, commit `1d6994c`. | Acredita un artefacto frontend publicado; no acredita backend ni integración de datos. |
| Distribución de tareas en Jira | Reparto propuesto de 21 tareas para Flor, Diego y los demás integrantes. | Datos simulados, estado **Por hacer**; no son evidencia de asignación formal o finalización. |
| Registros de ceremonias | No se encontraron actas de planificación, reuniones diarias, revisión ni retrospectiva. | La colaboración se describe solo desde artefactos verificables; no se infieren ceremonias. |

### 6.2.2. Sprint 2

#### 6.2.2.1. Sprint Planning 2

El Sprint 2 tiene como objetivo integrar los recorridos del frontend con los servicios de cuenta, acceso, gestión del hato y suscripción, y habilitar el flujo de telemetría y alertas entre el collar, el Portable Edge Gateway, la API central y las aplicaciones. El equipo confirmó como alcance de esta iteración las **30 historias** agrupadas para Sprint 2 en el Product Backlog del Capítulo III, con una estimación total de **164 Story Points**.

<table>
  <colgroup>
    <col style="width: 34%;"/>
    <col style="width: 66%;"/>
  </colgroup>
  <tbody>
    <tr>
      <th align="left" scope="row" width="34%">Sprint #</th>
      <td>Sprint 2</td>
    </tr>
    <tr>
      <th align="left" colspan="2">Sprint Planning Background</th>
    </tr>
    <tr>
      <td>Date</td>
      <td>2026-11-04</td>
    </tr>
    <tr>
      <td>Time</td>
      <td>10:00 PM (hora de Lima, UTC-5)</td>
    </tr>
    <tr>
      <td>Location</td>
      <td>Virtual.</td>
    </tr>
    <tr>
      <td>Prepared By</td>
      <td>Avalos Cordova, Diego Andres</td>
    </tr>
    <tr>
      <td>Attendees (to planning meeting)</td>
      <td>Awad Vargas, Giorgio Marzouk<br/>Sanchez Arenas, Manuel Angel<br/>Contreras Leon, Flor de María<br/>Arrieta Quispe, Alison Jimena<br/>Avalos Cordova, Diego Andres</td>
    </tr>
    <tr>
      <td>Sprint Period</td>
      <td>Del 4 al 14 de noviembre de 2026.</td>
    </tr>
    <tr>
      <td>Sprint 1 Review Summary</td>
      <td>La evidencia de 6.2.1 muestra la Landing Page y el frontend web con datos de ejemplo y sus despliegues. Las comprobaciones registradas son preliminares y no acreditan autenticación, persistencia ni integración con servicios. No se dispone de un acta de Sprint Review ni de una relación de historias aceptadas.</td>
    </tr>
    <tr>
      <td>Sprint 1 Retrospective Summary</td>
      <td>No se dispone de un acta de retrospectiva. A partir de las limitaciones documentadas, se propone confirmar responsables por entregable, realizar revisiones cruzadas y vincular cada historia seleccionada con sus criterios y evidencias de prueba. Estas acciones quedan sujetas al acuerdo del equipo.</td>
    </tr>
    <tr>
      <th align="left" colspan="2">Sprint Goal &amp; User Stories</th>
    </tr>
    <tr>
      <td>Sprint 2 Goal</td>
      <td>Habilitar un recorrido integrado y autorizado de gestión del hato, desde el registro y acceso hasta la consulta de telemetría y atención de alertas, con captura local y sincronización al recuperar conectividad.<br/><strong>Métrica de cumplimiento propuesta:</strong> verificar los criterios de aceptación del Capítulo III para las 30 historias seleccionadas, con registros persistidos, control de acceso y evidencia del recorrido entre collar, Edge, API y clientes; comprobar los reintentos y la operación sin Internet de las historias correspondientes. La cantidad de historias y puntos aceptados se registrará al cierre.</td>
    </tr>
    <tr>
      <td>Sprint 2 Velocity</td>
      <td>Se calculará a partir de los puntos de las historias aceptadas al cierre. Los 164 SP corresponden al esfuerzo estimado del alcance confirmado; los 33 SP planificados del Sprint 1 no constituyen velocidad observada.</td>
    </tr>
    <tr>
      <td>Sum of Story Points</td>
      <td>164 Story Points estimados, distribuidos en las 30 historias seleccionadas del Sprint Backlog 2.</td>
    </tr>
  </tbody>
</table>

La selección debe respetar las dependencias del Capítulo III: registro, acceso y permisos antes de consumir datos del hato; solicitud y confirmación de suscripción antes de habilitar capacidades del plan; asignaciones y configuración antes de evaluar telemetría; persistencia y confirmación antes de retirar registros pendientes. El enlace del collar al Edge se plantea por Wi-Fi local; BLE permanece como alternativa prevista.

El periodo de la iteración, la distribución de líderes y colaboradores por entregable y el alcance de 30 historias están confirmados. Los 164 SP expresan la estimación del trabajo planificado. La ejecución y la aceptación de las historias se documentarán con sus evidencias de revisión.

Fuente: [Product Backlog del Capítulo III](30-requirements-specification.md#33-product-backlog) y [evidencias del Sprint 1](#621-sprint-1).

#### 6.2.2.2. Aspect Leaders and Collaborators

Para el Sprint 2, el equipo confirmó la siguiente distribución de líderes y colaboradores por entregable. Cada líder coordina el trabajo de su aspecto con el apoyo de los colaboradores indicados.

| Aspecto | Líder | Colaboradores |
|---|---|---|
| Mobile Application | Avalos Cordova, Diego Andres | Arrieta Quispe, Alison Jimena; Sanchez Arenas, Manuel Angel; Awad Vargas, Giorgio Marzouk |
| Project Report | Sanchez Arenas, Manuel Angel | Arrieta Quispe, Alison Jimena; Awad Vargas, Giorgio Marzouk |
| Website | Awad Vargas, Giorgio Marzouk | Arrieta Quispe, Alison Jimena; Sanchez Arenas, Manuel Angel |

El Sprint 1 registraba responsables propuestos por tareas y áreas técnicas; esta distribución organiza la colaboración del Sprint 2 por entregable. Las tareas simuladas SF-96 a SF-117 se conservan como antecedente. La confirmación de estos roles no acredita estados de Jira ni la aceptación de las historias del backlog.

#### 6.2.2.3. Sprint Backlog 2

La tabla reúne las 30 historias seleccionadas y confirmadas para Sprint 2 a partir del Product Backlog del Capítulo III, conservando sus identificadores, títulos, orden de prioridad y estimaciones. Los resultados esperados resumen el alcance; la aceptación debe comprobar todos los criterios de cada historia en 3.1. El reparto de líderes y colaboradores por entregable está confirmado en 6.2.2.2.

| Prioridad | Historia | Resultado esperado | Puntos | Sprint asignado |
|---:|---|---|---:|---|
| 9 | US-01 — Registrar una cuenta de unidad productiva | Crear la cuenta pendiente de verificación y vincular al administrador propietario; rechazar correos duplicados. | 3 | Sprint 2 |
| 10 | US-02 — Acceder a la plataforma | Iniciar sesión con rol y alcance autorizados y aplicar el bloqueo temporal ante intentos fallidos. | 3 | Sprint 2 |
| 11 | US-03 — Completar el perfil profesional | Conservar especialidad, colegiatura y experiencia, con validación de duplicidad de colegiatura. | 3 | Sprint 2 |
| 12 | US-04 — Autorizar a un médico veterinario sobre el hato | Registrar el alcance y la vigencia de la autorización y rechazar consultas tras su vencimiento. | 5 | Sprint 2 |
| 13 | US-06 — Registrar un animal en el hato | Incorporar el animal activo con identificador único y datos productivos, sin duplicar el arete dentro de la unidad. | 5 | Sprint 2 |
| 14 | US-07 — Consultar la ficha de un animal | Consultar identificación, etapa, estado y collar del animal autorizado; indicar cuando no existe dispositivo asociado. | 3 | Sprint 2 |
| 15 | TS-10 — Solicitar y consultar suscripciones desde la aplicación web | Exponer catálogo, estimación y solicitud persistida e idempotente; mantener la solicitud pendiente hasta una confirmación comercial verificada. | 8 | Sprint 2 |
| 16 | US-34 — Iniciar la contratación de un plan | Conservar el plan elegido durante el acceso y registrar la solicitud con estimación y términos vigentes, sin afirmar un cobro ni una activación. | 5 | Sprint 2 |
| 17 | US-10 — Asignar un collar inteligente a un animal | Registrar la asignación y su vigencia para atribuir lecturas, respetando el límite de collares del plan. | 3 | Sprint 2 |
| 18 | US-15 — Definir las zonas de pastoreo permitidas | Guardar la zona y el lote al que aplica, rechazando polígonos abiertos o con lados cruzados. | 5 | Sprint 2 |
| 19 | TS-15 — Actualizar la configuración local del nodo de borde portátil | Obtener y conservar revisiones de reglas y asignaciones para la evaluación local; completar los permisos locales de duración acotada requeridos. | 5 | Sprint 2 |
| 20 | TS-01 — Capturar biometría y ubicación en el collar | Generar lecturas identificables con tiempo de captura, unidades y validez por campo y transmitirlas al Edge por Wi-Fi local sin depender de Internet. | 8 | Sprint 2 |
| 21 | TS-04 — Recibir telemetría del collar en el nodo de borde portátil | Validar y persistir lecturas localmente antes de confirmarlas, reconociendo reintentos idénticos y rechazando conflictos. | 8 | Sprint 2 |
| 22 | TS-03 — Conservar las lecturas no transmitidas en el collar | Mantener la cola y los identificadores durante reintentos, completar su persistencia en memoria no volátil y registrar descartes por capacidad. | 5 | Sprint 2 |
| 23 | TS-05 — Evaluar umbrales y generar alertas en el nodo de borde portátil | Evaluar lecturas y geocercas con configuración vigente, conservar la identidad de las alertas y marcar datos insuficientes como no concluyentes. | 8 | Sprint 2 |
| 24 | TS-07 — Validar y persistir los registros sincronizados del nodo de borde | Validar los registros en la API central y conservar identidad y atribución temporal, con resultados individuales sin duplicados ni sustituciones por conflicto. | 8 | Sprint 2 |
| 25 | TS-06 — Sincronizar el nodo de borde portátil con la API central | Enviar los registros pendientes y confirmar cada resultado; conservar fallos y conflictos para reintento o revisión sin detener la operación local. | 8 | Sprint 2 |
| 26 | TS-08 — Consultar telemetría autorizada desde la aplicación web | Entregar lecturas autorizadas por periodo con unidades, validez y tiempos de captura y recepción, sin inventar mediciones ausentes. | 5 | Sprint 2 |
| 27 | TS-17 — Consultar telemetría local desde la aplicación móvil | Consultar lecturas por la API local del Edge con permisos vigentes y distinguir datos actuales, antiguos o descargados. | 5 | Sprint 2 |
| 28 | US-13 — Consultar la telemetría reciente de un animal | Presentar valores, origen, antigüedad y estado de sincronización; indicar mediciones inválidas o ausentes y la última ubicación conocida. | 3 | Sprint 2 |
| 29 | TS-16 — Consultar y atender alertas locales desde la aplicación móvil | Consultar y atender alertas sin Internet mediante el Edge, con autoría, persistencia, idempotencia y control de versiones y permisos. | 5 | Sprint 2 |
| 30 | TS-09 — Consultar y atender alertas en la nube desde la aplicación móvil | Consultar alertas autorizadas y registrar su atención en la API central sin duplicar operaciones ni sobrescribir versiones vigentes. | 8 | Sprint 2 |
| 31 | TS-11 — Solicitar notificaciones externas desde el servicio central de ICHU | Solicitar y seguir notificaciones con clave estable y reintentos, diferenciando aceptación del proveedor y entrega al destinatario. | 5 | Sprint 2 |
| 32 | US-16 — Recibir una alerta por anomalía de salud | Generar alertas locales sustentadas en lecturas y umbrales válidos, relacionar eventos repetidos y conservar identidad al sincronizar. | 8 | Sprint 2 |
| 33 | US-19 — Atender una alerta | Conservar hallazgo, acción, autor y hora de atención en Edge o nube, con sincronización pendiente y resolución explícita de conflictos. | 3 | Sprint 2 |
| 34 | US-17 — Recibir una alerta por salida del área permitida | Registrar salida y retorno respecto a la geocerca con ubicación, hora y duración; descartar conclusiones cuando la precisión es insuficiente. | 5 | Sprint 2 |
| 35 | US-20 — Localizar un animal extraviado | Consultar la última ubicación registrada, su hora y la distancia al operario, indicando cuando no hay posición disponible. | 5 | Sprint 2 |
| 36 | TS-18 — Sincronizar los registros sin conexión de la aplicación móvil | Descargar fichas autorizadas y sincronizar eventos persistidos con resultados individuales, sin duplicados y conservando rechazos y conflictos. | 8 | Sprint 2 |
| 37 | US-21 — Registrar un evento de salud durante la faena | Conservar animal, tipo de evento, observación, fecha, autor y estado de sincronización, validando los datos obligatorios. | 3 | Sprint 2 |
| 38 | US-22 — Operar sin cobertura y sincronizar al recuperarla | Consultar fichas descargadas y conservar eventos sin Internet con permisos vigentes; sincronizar al recuperar conectividad sin perder conflictos. | 8 | Sprint 2 |
|  | **Total planificado** | **30 historias confirmadas.** | **164** |  |

La persistencia de la cola del collar y las autorizaciones locales acotadas se incluyen como resultados por completar según TS-03 y TS-15; no se consideran resueltas por esta planificación. El alcance no incorpora las historias de Sprint 3 ni del roadmap, y la presencia de una historia en esta tabla no acredita su aceptación.

Fuente: [Product Backlog](30-requirements-specification.md#33-product-backlog) y [criterios de aceptación](30-requirements-specification.md#31-épicas-e-historias-de-usuario) del Capítulo III.

#### 6.2.2.4. Development Evidence for Sprint Review

La tabla reúne los commits de mayor impacto a nivel técnico:

- 40 commits de `ichu-web-service`
- 40 commits de `ichu-web-app`
- 40 commits de `ichu-mobile-app`
- 40 commits de `ichu-website`
- 40 commits de `ichu-edge-service`

| Repository | ID de Commit | Mensaje de Commit | Descripción de Commit | Fecha de Commit |
|---|---|---|---|---|
| ichu-web-service | 7052e84 | feat(monitoring): add methane alerts and critical threshold levels | Añade alertas de metano y niveles de umbral crítico. | 2026-11-14 |
| ichu-web-service | 8ae5aa6 | feat(monitoring): record heart rate and methane index readings | Registra lecturas de frecuencia cardiaca e índice de metano. | 2026-11-14 |
| ichu-web-service | edd29fa | feat: change water monitoring endpoints | Actualiza los endpoints de monitoreo de bebederos. | 2026-11-14 |
| ichu-web-service | bc3adcc | feat: change water monitoring query service | Actualiza el servicio de consultas de monitoreo de agua. | 2026-11-14 |
| ichu-web-service | f94a225 | feat: change iot water monitoring facade | Integra la fachada de monitoreo de agua con IoT Assets. | 2026-11-14 |
| ichu-web-service | 7964a99 | feat: change water reading repository implementation | Implementa el repositorio de lecturas de agua. | 2026-11-14 |
| ichu-web-service | 8201f2b | feat: change water reading database mapping | Configura el mapeo de lecturas de agua a persistencia. | 2026-11-14 |
| ichu-web-service | ccbabcb | feat: change water reading request validation | Valida las solicitudes de registro de lecturas de agua. | 2026-11-14 |
| ichu-web-service | 53660b3 | feat: change water reading domain validation | Añade validaciones de dominio para lecturas de agua. | 2026-11-14 |
| ichu-web-service | 506b1c1 | feat(subscription-plans): expose plan catalog, quotes and subscriptions | Expone el catálogo de planes, cotizaciones y suscripciones. | 2026-11-07 |
| ichu-web-service | 63000ce | feat(subscription-plans): pay subscriptions with stripe checkout | Integra el pago de suscripciones mediante Stripe Checkout. | 2026-11-10 |
| ichu-web-service | 079380c | feat: add subscription plan quotes endpoint | Añade el endpoint de cotización de planes. | 2026-11-12 |
| ichu-web-service | 3fe5a39 | feat(iam): add persistence and Firebase identity adapters | Añade persistencia IAM y adaptadores de identidad Firebase. | 2026-11-05 |
| ichu-web-service | 6745002 | feat(iam): expose REST resources and register module services | Expone recursos REST de IAM y registra sus servicios. | 2026-11-05 |
| ichu-web-service | 4da544b | feat: add veterinary access request endpoints | Añade endpoints para solicitar acceso veterinario a ranchos. | 2026-11-12 |
| ichu-web-service | 658a010 | feat(iam): find a ranch by its access code | Permite localizar ranchos mediante código de acceso. | 2026-11-11 |
| ichu-web-service | 600d67d | feat(iam): issue a unique access code for each ranch | Emite un código de acceso único para cada rancho. | 2026-11-11 |
| ichu-web-service | 2b74959 | feat(cattle-information): add services API and persistence | Añade API y persistencia para información del ganado. | 2026-11-05 |
| ichu-web-service | 2a5d518 | feat(cattle-information): model cattle lifecycle and lot membership | Modela el ciclo de vida de animales y su pertenencia a lotes. | 2026-11-05 |
| ichu-web-service | 9552620 | feat(iot-assets): connect cattle, collar limits and collar release | Vincula animales y collares, aplica límites y libera asignaciones. | 2026-11-07 |
| ichu-web-service | d451ff9 | feat(iot-assets): add edge gateway registry with one-time keys | Registra gateways Edge con claves de uso único. | 2026-11-08 |
| ichu-web-service | 2313f54 | feat: add validated partial cattle update resource | Define un recurso validado para actualizar parcialmente un animal. | 2026-11-13 |
| ichu-web-service | bbf3545 | feat: support atomic partial cattle updates | Implementa actualizaciones parciales atómicas del ganado. | 2026-11-13 |
| ichu-web-service | 0c7342e | feat: expose cattle patch endpoint by unique identifier | Expone el endpoint PATCH de ganado por identificador único. | 2026-11-13 |
| ichu-web-service | 8251d9c | feat(cattle-information): expose animal placements to trusted code | Expone ubicaciones de animales para integraciones autorizadas. | 2026-11-12 |
| ichu-web-service | c67f662 | feat(iot-assets): list open collar assignments for trusted callers | Lista asignaciones de collar abiertas para clientes confiables. | 2026-11-12 |
| ichu-web-service | ada0ae9 | feat(operations-monitoring): publish collar assignments to edge gateways | Publica asignaciones de collar hacia gateways Edge. | 2026-11-12 |
| ichu-web-service | 4b5f8c7 | feat: base controller and planning controllers (activities, calendar, campaigns and periods) added | Añade controladores base para actividades, calendario, campañas y periodos. | 2026-11-06 |
| ichu-web-service | 6a24522 | feat(planning): plan lot nutrition with ration changes | Planifica nutrición por lote y cambios de ración. | 2026-11-12 |
| ichu-web-service | c4c884d | feat(operations-monitoring): record reproductive events and history | Registra eventos reproductivos e historial asociado. | 2026-11-12 |
| ichu-web-service | 4addf07 | feat: expose herd and ranch monitoring reads for analytics | Provee lecturas de monitoreo de hato y rancho para analítica. | 2026-11-08 |
| ichu-web-service | d1018e6 | feat(dashboard-analytics): expose analytics REST endpoints | Expone endpoints REST para analítica del dashboard. | 2026-11-06 |
| ichu-web-service | bbb0d8d | feat(monitoring): authorize ranch operations through the IAM context facade | Autoriza operaciones sobre ranchos mediante la fachada IAM. | 2026-11-06 |
| ichu-web-service | d90693d | feat(monitoring): add EF Core repositories and entity configurations | Añade repositorios Entity Framework Core y configuración de entidades para monitoreo. | 2026-11-05 |
| ichu-web-service | 4dd2bcb | feat(monitoring): add command services | Añade servicios de comandos para operaciones de monitoreo. | 2026-11-05 |
| ichu-web-service | 3b15a51 | feat(monitoring): add query services | Añade servicios de consulta para operaciones de monitoreo. | 2026-11-05 |
| ichu-web-service | be74bfd | feat(monitoring): add REST controllers and service registration | Añade controladores REST y registro del contexto de monitoreo. | 2026-11-05 |
| ichu-web-service | 86a95ee | feat: add cattle and iot schemas and register both modules | Crea esquemas de ganado e IoT y registra ambos módulos. | 2026-11-07 |
| ichu-web-service | 885a8d6 | feat(shared): add the application database context with audit timestamps | Añade el contexto de base de datos compartido con marcas de auditoría. | 2026-11-06 |
| ichu-web-service | de4aca4 | ci: run unit and integration tests against postgresql | Configura CI para ejecutar pruebas unitarias y de integración con PostgreSQL. | 2026-11-09 |
| ichu-web-app | 9997c3f | feat(operations-monitoring): add methane alerts and two-level ranges | Añade alertas de metano con rangos de severidad de dos niveles. | 2026-11-14 |
| ichu-web-app | 79da639 | feat(operations-monitoring): show heart rate and methane index readings | Muestra lecturas de frecuencia cardiaca e índice de metano. | 2026-11-14 |
| ichu-web-app | 163d7c3 | revert(iot-assets): drop the water trough status and history | Revierte la visualización web del estado e historial de bebederos. | 2026-11-14 |
| ichu-web-app | 7997479 | feat(iot-assets): hide water troughs and water controllers from the web | Oculta bebederos y controladores de agua en la aplicación web. | 2026-11-14 |
| ichu-web-app | 8fac6e7 | fix(planning): call the lot, activity and campaign routes now served | Conecta la planificación con las rutas disponibles para lotes, actividades y campañas. | 2026-11-14 |
| ichu-web-app | 88c0cbc | feat(dashboard): read recent alerts, collars and lot temperature | Incorpora alertas recientes, collares y temperatura de lotes al dashboard. | 2026-11-13 |
| ichu-web-app | f80be83 | fix(iam): drop the head-count min attribute that blocked vets | Corrige el mínimo de tamaño de hato que impedía registrar veterinarios. | 2026-11-12 |
| ichu-web-app | 7f5e4d7 | fix(iam): let veterinarians register without ranch details | Permite que veterinarios se registren sin ingresar datos de rancho. | 2026-11-12 |
| ichu-web-app | 52789bd | fix(shared): revalidate the page served for every route | Revalida la página servida para cada ruta del sitio. | 2026-11-12 |
| ichu-web-app | 138f508 | fix(shared): wait for a sleeping api to start | Espera a que la API vuelva a estar disponible antes de iniciar solicitudes. | 2026-11-12 |
| ichu-web-app | 225f0b7 | fix(shared): unwrap leaflet from its production module | Ajusta Leaflet para su carga en el entorno de producción. | 2026-11-12 |
| ichu-web-app | bf8b6ff | build: deploy the web app to firebase hosting | Despliega la aplicación web en Firebase Hosting. | 2026-11-12 |
| ichu-web-app | 96312b0 | ci: build and test the web app on pull requests | Configura CI para compilar y probar la aplicación en Pull Requests. | 2026-11-12 |
| ichu-web-app | 0883f2b | fix(iam): harden session lifecycle and request handling | Refuerza el ciclo de vida de sesión y el manejo de solicitudes. | 2026-11-06 |
| ichu-web-app | 1e94738 | feat(planning): show each lot's nutrition plan and rumination | Muestra el plan nutricional de cada lote y sus datos de rumia. | 2026-11-12 |
| ichu-web-app | 119ac06 | feat(operations-monitoring): follow the reproductive history of females | Presenta el historial reproductivo de las hembras. | 2026-11-12 |
| ichu-web-app | a56e98c | feat(shared): expose animal sex and lot trends through acl facades | Expone sexo del animal y tendencias de lotes mediante fachadas ACL. | 2026-11-12 |
| ichu-web-app | f1ff78d | feat(shared): mark dated events on line charts | Marca eventos con fecha en los gráficos de líneas. | 2026-11-12 |
| ichu-web-app | 2c812d9 | feat(subscription-plans): contract plans per collar and pay with stripe | Permite contratar planes por collar y pagar con Stripe. | 2026-11-12 |
| ichu-web-app | 8c7146e | feat(subscription-plans): add plan, quote and subscription adapters | Añade adaptadores para planes, cotizaciones y suscripciones. | 2026-11-12 |
| ichu-web-app | 756db12 | feat(dashboard-analytics): show herd indicators, trends and reports | Presenta indicadores del hato, tendencias e informes. | 2026-11-11 |
| ichu-web-app | 72fc308 | feat(dashboard-analytics): add indicator, trend and report adapters | Integra adaptadores de indicadores, tendencias e informes. | 2026-11-11 |
| ichu-web-app | da1aa21 | feat(shared): expose lot members and upcoming work through acl facades | Comparte integrantes de lotes y actividades próximas con otros contextos. | 2026-11-11 |
| ichu-web-app | 77a713e | feat(operations-monitoring): keep the clinical history of each animal | Presenta el historial clínico de cada animal. | 2026-11-11 |
| ichu-web-app | b398a8c | feat(planning): plan campaigns, calendar work and withdrawal periods | Planifica campañas, actividades del calendario y periodos de retiro. | 2026-11-11 |
| ichu-web-app | db961e2 | feat(operations-monitoring): monitor the herd, alerts and grazing zones | Permite monitorear el hato, las alertas y las zonas de pastoreo. | 2026-11-11 |
| ichu-web-app | 2eb3560 | feat(operations-monitoring): add telemetry, alert and geofence adapters | Integra adaptadores de telemetría, alertas y geocercas. | 2026-11-11 |
| ichu-web-app | 0877476 | feat(iot-assets): manage devices, water troughs and edge gateways | Permite gestionar dispositivos, bebederos y gateways Edge. | 2026-11-11 |
| ichu-web-app | caf1cf1 | feat(cattle-information): manage the herd inventory, profiles and lots | Permite gestionar inventario, perfiles de animales y lotes. | 2026-11-11 |
| ichu-web-app | bf8ab58 | feat(cattle-information): add cattle and lot api adapters | Añade adaptadores API para animales y lotes. | 2026-11-11 |
| ichu-web-app | 3190a01 | feat(iam): request and decide herd advisories by ranch | Permite solicitar y decidir asesorías vinculadas a ranchos. | 2026-11-11 |
| ichu-web-app | dcad8bd | feat(iam): show ranches, access codes and the professional profile | Muestra ranchos, códigos de acceso y el perfil profesional. | 2026-11-11 |
| ichu-web-app | 736ea75 | feat(iam): find a ranch by its access code | Permite encontrar un rancho mediante su código de acceso. | 2026-11-11 |
| ichu-web-app | d5e5025 | feat(i18n): translate the account and advisory pages | Traduce las páginas de cuenta y asesorías. | 2026-11-11 |
| ichu-web-app | 22ae075 | feat(shared): add localized dates and a confirmation dialog | Añade fechas localizadas y un diálogo de confirmación. | 2026-11-11 |
| ichu-web-app | 5f7b8dc | feat(i18n): translate sign-in, registration and legal pages | Traduce inicio de sesión, registro y páginas legales. | 2026-11-11 |
| ichu-web-app | 0832831 | feat(shared): add the application shell and translated page titles | Añade el shell de la aplicación y títulos de página traducidos. | 2026-11-11 |
| ichu-web-app | 22af0b5 | refactor(iam): sign in with firebase only and scope advisories by ranch | Usa Firebase para autenticar y limita asesorías al rancho activo. | 2026-11-11 |
| ichu-web-app | b7e5041 | feat(i18n): add english and spanish runtime translations | Añade traducciones en tiempo de ejecución en inglés y español. | 2026-11-11 |
| ichu-web-app | 757222b | feat(iam): add Firebase authentication and account API adapters | Añade adaptadores de autenticación Firebase y API de cuenta. | 2026-11-06 |

#### 6.2.2.5. Testing Suite Evidence for Sprint Review

#### 6.2.2.6. Execution Evidence for Sprint Review

#### 6.2.2.7. Services Documentation Evidence for Sprint Review

#### 6.2.2.8. Software Deployment Evidence for Sprint Review

#### 6.2.2.9. Team Collaboration Insights during Sprint

## 6.3. Validation Interviews

### 6.3.1. Diseño de Entrevistas

**Segmento 1:** Medianos y Grandes Ganaderos (Propietarios y Administradores de Estancias)

Este segmento representa al comprador principal y responsable de la gestión del predio. El objetivo es evaluar si comprende la propuesta de ICHU, puede priorizar una alerta, consultar la información de un animal y registrar una observación en campo sin conexión, además de conocer las condiciones bajo las cuales consideraría utilizar el servicio.

#### BLOQUE 1: Datos Demográficos y de Perfil

**Objetivo:** Identificar al participante, su responsabilidad sobre el hato y los dispositivos que utiliza para trabajar.

1. ¿Cuál es su nombre completo, edad y distrito de residencia?
2. ¿Cuántos animales maneja y cuál es su rol en el predio?
3. ¿Su celular es Android o iPhone? En la computadora, ¿qué navegador utiliza habitualmente?

---

#### BLOQUE 2: Comprensión de la Landing Page y Acceso a la Plataforma

**Objetivo:** Evaluar si la propuesta para ganaderos resulta comprensible y si el participante identifica cómo acceder al producto.

1. **Tarea 1 — Landing Page:** Abra el enlace proporcionado, cambie el idioma a español y explore la información dirigida a ganaderos. Con sus propias palabras, ¿qué le ofrece ICHU?
2. Si quisiera entrar ahora a la plataforma, ¿por dónde lo haría?

---

#### BLOQUE 3: Atención de Alertas y Consulta del Animal en la Aplicación Web

**Objetivo:** Evaluar la priorización de alertas, el registro de una atención y la comprensión de los datos individuales del ganado.

1. **Tarea 2 — Atención de una alerta:** Ingrese con la cuenta de prueba proporcionada, cambie el idioma a español y atienda la alerta que considere más urgente de su hato. Deje registrado qué encontró y qué hizo.
2. ¿Por qué eligió esa alerta? Del uno al siete, donde uno es muy difícil y siete es muy fácil, ¿qué tan fácil le resultó la tarea? ¿Qué facilitó o dificultó completarla?
3. **Tarea 3 — Consulta del animal:** El capataz indica que la vaca AR-012 está decaída. Encuéntrela en la plataforma y revise cómo ha cambiado su temperatura. ¿Qué interpreta de la información que ve?
4. ¿Esta herramienta le serviría para reemplazar o complementar su cuaderno o Excel? ¿Qué información o función le faltaría?

---

#### BLOQUE 4: Registro de Campo sin Conexión en la Aplicación Móvil

**Objetivo:** Evaluar si el participante puede registrar una observación sin señal y comprende el estado de ese registro.

1. **Tarea 4 — Registro sin conexión:** Abra la aplicación móvil y, con señal, busque la vaca AR-027 de su fundo. Luego active el modo avión y registre que observó al animal en celo.
2. ¿Cómo sabe si el registro quedó guardado y dónde cree que se encuentra?
3. ¿Qué cree que ocurrirá con ese registro cuando vuelva la señal?

---

#### BLOQUE 5: Valor Percibido y Cierre

**Objetivo:** Conocer la utilidad percibida, las condiciones de adopción y la opinión final del participante.

1. ¿Qué fue lo más útil de la experiencia y qué cambiaría?
2. ¿Consideraría pagar un plan anual por ICHU? ¿Hasta qué monto y bajo qué condiciones? Si no lo contrataría, ¿por qué?
3. En una frase, ¿qué le pareció ICHU? ¿Autoriza que utilicemos esta opinión en el video del producto?

**Segmento 2:** Zootecnistas y Médicos Veterinarios

Este segmento reúne a los profesionales que asesoran fundos desde la perspectiva de la atención clínica. El objetivo es evaluar si comprenden la propuesta de ICHU para su trabajo, pueden consultar las variables de un animal, registrar una intervención y solicitar acceso a una unidad productiva desde la aplicación móvil.

#### BLOQUE 1: Datos Demográficos y Ecosistema de Trabajo

**Objetivo:** Identificar al participante, su experiencia de asesoría y las herramientas que utiliza para registrar sus atenciones.

1. ¿Cuál es su nombre completo, edad y distrito de residencia?
2. ¿Cuántos años lleva ejerciendo y cuántos fundos asesora? ¿Qué responsabilidad tiene en ellos?
3. ¿Su celular es Android o iPhone? ¿Qué navegador utiliza y dónde anota actualmente lo que realiza en cada atención?

---

#### BLOQUE 2: Comprensión de la Landing Page y Acceso Profesional

**Objetivo:** Evaluar si el profesional se reconoce en la propuesta y encuentra cómo iniciar su acceso al servicio.

1. **Tarea 1 — Landing Page:** Abra el enlace proporcionado, cambie el idioma a español y explore la información dirigida a veterinarios. Con sus propias palabras, ¿qué le ofrece ICHU para su trabajo?
2. Si quisiera registrarse ahora, ¿por dónde lo haría?

---

#### BLOQUE 3: Consulta de Parámetros y Registro Clínico en la Aplicación Web

**Objetivo:** Evaluar la selección del fundo, la interpretación de las variables disponibles y el registro de una intervención en el historial del animal.

1. **Tarea 2 — Consulta de parámetros:** Ingrese con la cuenta de prueba proporcionada, cambie el idioma a español, seleccione el Fundo Demo ICHU y revise la temperatura, actividad y rumia de la vaca AR-012 durante los últimos siete días.
2. ¿Qué interpreta de estos datos y qué necesitaría comprobar durante una visita? ¿Qué le genera confianza o desconfianza en la información presentada?
3. **Tarea 3 — Registro clínico:** En el entorno de prueba, registre la intervención que consideraría para este caso, incluyendo producto, dosis y días de retiro de leche.
4. ¿Encontró los campos que necesita para documentar una atención? ¿Qué agregaría o cambiaría?

---

#### BLOQUE 4: Solicitud de Acceso desde la Aplicación Móvil

**Objetivo:** Evaluar si el profesional puede solicitar autorización sobre un fundo y comprende cómo consultar el estado de su solicitud.

1. **Tarea 4 — Solicitud de asesoría:** Un ganadero del fundo Los Andes lo ha contratado y le ha proporcionado un código de acceso de prueba. Desde la aplicación móvil, busque esa unidad productiva y envíe una solicitud de acceso indicando el motivo.
2. ¿Cómo sabe si la solicitud fue enviada?
3. ¿Cómo comprobaría si el ganadero aceptó su solicitud?

---

#### BLOQUE 5: Valor Percibido y Cierre

**Objetivo:** Conocer la utilidad percibida para la asesoría profesional y las condiciones bajo las cuales recomendaría la herramienta.

1. ¿Qué fue lo más útil de la experiencia y qué cambiaría?
2. ¿Recomendaría ICHU a los ganaderos que asesora? ¿Por qué y bajo qué condiciones?
3. En una frase, ¿qué le pareció ICHU? ¿Autoriza que utilicemos esta opinión en el video del producto?

Con esta estructura, cada entrevista comienza con el perfil del participante, continúa con tareas sobre la Landing Page y las aplicaciones, y termina con su valoración de la experiencia. Las respuestas y dificultades se recogen tal como ocurran, sin asumir que las funciones se completarán correctamente ni que la opinión final será favorable.

### 6.3.2. Registro de Entrevistas

### 6.3.3. Evaluaciones según heurísticas

En esta sección se evalúa la experiencia de usuario de las versiones implementadas, considerando usabilidad, arquitectura de información y diseño inclusivo. La siguiente inspección es preliminar y estática: revisa el código de la aplicación móvil y los contratos del servicio web que condicionan sus flujos principales. No se ejecutó la aplicación en un dispositivo ni se realizaron entrevistas para esta inspección. Por ello, las severidades son provisionales y los hallazgos deben contrastarse en las sesiones de validación de 6.3.1 y 6.3.2. El servicio web no tiene interfaz visual; sus endpoints se consideran únicamente cuando afectan la comprensión, priorización o recuperación desde el cliente móvil.

#### ESCALA DE SEVERIDAD:

<table border="1" cellspacing="0" cellpadding="6">
    <thead>
        <tr align="center">
          <td><strong>Nivel</strong></td>
          <td><strong>Descripción</strong></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>Problema superficial: puede ser fácilmente superado por el usuario u ocurre con muy poca frecuencia. No necesita ser arreglado a no ser que exista disponibilidad de tiempo.</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Problema menor: puede ocurrir un poco más frecuentemente o es un poco más difícil de superar para el usuario. Se le debería asignar una prioridad baja resolverlo de cara al siguiente reléase</td>
        </tr>
        <tr>
            <td>3</td>
            <td>Problema mayor: ocurre frecuentemente o los usuarios no son capaces de resolverlos. Es importante que sean corregidos y se les debe asignar una prioridad alta.</td>
        </tr>
        <tr>
            <td>4</td>
            <td>Problema muy grave: un error de gran impacto que impide al usuario continuar con el uso de la herramienta. Es imperativo que sea corregido antes del lanzamiento.</td>
        </tr>
    </tbody>
</table>

#### TABLA RESUMEN:

| # | Problema | Severidad provisional | Heurística / principio | Tarea core relacionada |
|---|---|---:|---|---|
| 1 | La tarjeta de alerta identifica al animal con su UUID interno y no permite abrir directamente su ficha. | 3 | Correspondencia con el mundo real; reconocimiento antes que recuerdo. | Priorizar una alerta e identificar al animal afectado. |
| 2 | Las alertas se muestran por fecha descendente y la aplicación solo permite filtrar por estado; no hay filtro ni agrupación por severidad. | 2 | Flexibilidad y eficiencia de uso; reconocimiento antes que recuerdo. | Encontrar la alerta más urgente entre muchas alertas. |
| 3 | Los registros offline rechazados o en conflicto quedan pendientes sin una acción para corregirlos o resolverlos desde la aplicación. | 3 | Ayuda para reconocer, diagnosticar y recuperarse de errores; control y libertad del usuario. | Sincronizar y resolver registros de campo. |
| 4 | La preparación para trabajar sin conexión exige buscar cada animal por arete exacto mientras hay conexión; no se identifica un flujo de precarga por lote o hato. | 2 | Flexibilidad y eficiencia de uso. | Preparar el teléfono antes de registrar eventos en campo. |
| 5 | Las solicitudes y concesiones de acceso usan UUID de rancho y de veterinario en vez de nombres o búsqueda de personas/ranchos. | 3 | Correspondencia con el mundo real; prevención de errores. | Solicitar o conceder acceso a un rancho. |
| 6 | Revocar un permiso ejecuta la acción de inmediato, sin confirmación ni opción de deshacer en la interfaz. | 2 | Prevención de errores; control y libertad del usuario. | Revocar el acceso de un veterinario. |

#### DESCRIPCIÓN DE PROBLEMAS:

##### PROBLEMA #1: El animal de la alerta solo aparece como identificador técnico

* **Severidad:** 3
* **Heurística violada:** Correspondencia entre el sistema y el mundo real; reconocimiento antes que recuerdo.
* **Tarea relacionada:** Tarea 2 — Atención de una alerta; Tarea 3 — Consulta del animal.
* **Descripción del problema:** La tarjeta principal muestra `cattleId`, que es un UUID, bajo la etiqueta de identificación del animal. No muestra el arete ni un nombre reconocible, y la tarjeta no ofrece una acción directa para abrir la ficha del animal. Para decidir a quién atender, el usuario tendría que recordar o buscar por separado a qué animal corresponde el UUID. Esto añade pasos y puede retrasar la respuesta ante una alerta.
* **Recomendación:** Mostrar el arete como identificador principal, acompañarlo con el nombre o descripción disponible y permitir abrir la ficha del animal y su monitoreo desde la alerta. Conservar el UUID en los detalles técnicos.

##### PROBLEMA #2: La lista no ayuda a priorizar alertas por gravedad

* **Severidad:** 2
* **Heurística violada:** Flexibilidad y eficiencia de uso; reconocimiento antes que recuerdo.
* **Tarea relacionada:** Tarea 2 — Atención de una alerta.
* **Descripción del problema:** El servicio devuelve las alertas de más reciente a más antigua. La aplicación móvil carga 20 por página y permite filtrar por estado, pero no por severidad ni por animal. La gravedad aparece en cada tarjeta, de modo que el usuario puede leerla, pero una alerta crítica más antigua puede quedar en una página posterior entre alertas menos urgentes. La tarea de elegir la alerta más urgente requiere inspeccionar y comparar la lista manualmente.
* **Recomendación:** Dar prioridad visible a las alertas pendientes críticas y permitir filtrar o agrupar por severidad. Mantener la fecha, el estado y la paginación visibles para conservar contexto.

##### PROBLEMA #3: No hay una ruta de recuperación para registros rechazados o en conflicto

* **Severidad:** 3.
* **Heurística violada:** Ayuda para reconocer, diagnosticar y recuperarse de errores; control y libertad del usuario.
* **Tarea relacionada:** Tarea 4 — Registro de campo sin conexión.
* **Descripción del problema:** La sincronización conserva los registros rechazados o en conflicto, pero la lista de pendientes solo presenta un mensaje de estado. El elemento no ofrece acciones para editar, corregir, descartar o volver a crear el registro. El aviso general indica que la sincronización no los modifica, por lo que el usuario puede comprender que existe un problema sin tener una forma de resolverlo desde la aplicación.
* **Recomendación:** Explicar el motivo en términos comprensibles y ofrecer una acción segura de corrección o resolución, conservando la trazabilidad de la operación original y evitando duplicados. Si el registro no puede corregirse, explicar cómo registrar una operación nueva.

##### PROBLEMA #4: La preparación offline requiere precargar animales uno por uno

* **Severidad:** 2.
* **Heurística violada:** Flexibilidad y eficiencia de uso.
* **Tarea relacionada:** Tarea 4 — Registro de campo sin conexión.
* **Descripción del problema:** Para poder seleccionar un animal sin conexión, primero hay que localizarlo por su arete exacto cuando hay red; la aplicación guarda esa opción localmente. Si el animal no está en caché y el teléfono no tiene conectividad, la búsqueda depende del servicio y no puede completarse. El texto de ayuda informa esta condición, pero la preparación se realiza animal por animal y no se encontró un flujo para precargar un lote o todo el hato.
* **Recomendación:** Ofrecer una acción explícita para descargar los animales de un lote o hato antes de salir a campo, mostrar cuántos quedaron disponibles sin conexión y confirmar su vigencia.

##### PROBLEMA #5: Los flujos de acceso dependen de UUID difíciles de reconocer

* **Severidad:** 3.
* **Heurística violada:** Correspondencia con el mundo real; prevención de errores.
* **Tarea relacionada:** Solicitar acceso a un rancho; otorgar o revisar acceso de un veterinario.
* **Descripción del problema:** Para solicitar acceso, el veterinario debe conocer e ingresar el UUID del rancho. Para otorgar acceso directo, el administrador elige un rancho mostrado por UUID e ingresa manualmente el UUID de la cuenta veterinaria. La actividad de permisos también identifica al veterinario por ese UUID. La interfaz valida el formato, pero no ayuda a encontrar ni confirmar que se eligió la persona o el rancho correctos; esto obliga a obtener y comparar identificadores fuera de la aplicación y deja margen para errores de destino.
* **Recomendación:** Permitir buscar por nombre de rancho y por correo/nombre del veterinario, mostrar detalles legibles para confirmar la selección y conservar el UUID en una vista técnica o secundaria.

##### PROBLEMA #6: Revocar acceso no pide confirmación

* **Severidad:** 2.
* **Heurística violada:** Prevención de errores; control y libertad del usuario.
* **Tarea relacionada:** Revocar el acceso de un veterinario.
* **Descripción del problema:** El botón “Revoke access” llama directamente a la operación de revocación. En la interfaz revisada no aparece un diálogo de confirmación ni una acción para deshacer. Un clic por accidente puede retirar el permiso del veterinario y obligar al administrador a concederlo nuevamente.
* **Recomendación:** Solicitar confirmación indicando el veterinario, rancho, alcance y fecha de expiración que se revocarán; comunicar el resultado y facilitar la restauración del acceso autorizado.

## 6.4. Video About-the-Product
