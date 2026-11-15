# Project Report Collaboration Insights

**Repositorio del informe:** [https://tinyurl.com/2dhmo9ou](https://tinyurl.com/2dhmo9ou)

## Organización del trabajo

El informe se elabora de forma colaborativa en un repositorio público dentro de la organización de GitHub del equipo, aplicando GitFlow como flujo de control de versiones y Conventional Commits para los mensajes.

Durante la elaboración de AV1 se utilizaron ramas de trabajo por capítulo y conclusiones; una vez integradas, esas ramas se cerraron. El flujo vigente conserva `main` para entregas publicadas y `develop` para integración. Cada cambio se desarrolla en una rama temporal `feature/<alcance>` o `fix/<alcance>`, creada desde `develop`, y se integra mediante un Pull Request revisado.

| Rama | Contenido |
|---|---|
| `main` | Versión publicada para cada entrega |
| `develop` | Integración de cambios en curso |
| `feature/<alcance>` / `fix/<alcance>` | Ramas temporales para cambios aislados; se eliminan tras integrarse |

## Actividad registrada durante AV1 (7–19 de septiembre de 2026)

| Métrica | Valor |
|---|---|
| Commits de contenido | 111 |
| Merges de integración | 17 |
| Commits totales del historial | 128 |
| Ramas de trabajo utilizadas durante la entrega | 7 |
| Periodo de trabajo | 7 al 19 de septiembre de 2026 |
| Artefactos versionados | 4 capítulos con contenido, 1 archivo de capítulo vacío, 114 imágenes rasterizadas, 8 SVG y 17 archivos fuente de diagramas |

## Evidencias de commits en GitHub

Las siguientes capturas documentan el historial visible de commits de la rama `feature/chapter-II` durante la consolidación del informe. En ellas se observan aportes de Diego Andres Avalos Cordova, Flor de María Contreras Leon, Giorgio Awad, Alison Arrieta y Manuel Angel Sanchez, además de la integración de ramas mediante GitFlow. La evidencia se mantiene alineada con las versiones 0.11.6 a 0.11.10 del Registro de Versiones.

<img src="../assets/images/collaboration/commits/commits-feature-chapter-II-01.png" alt="Historial de commits de feature/chapter-II, captura 1" style="max-width:100%;">

*Figura. Historial de commits de `feature/chapter-II` durante la consolidación del informe (captura 1).*

<img src="../assets/images/collaboration/commits/commits-feature-chapter-II-02.png" alt="Historial de commits de feature/chapter-II, captura 2" style="max-width:100%;">

*Figura. Historial de commits de `feature/chapter-II` durante la consolidación del informe (captura 2).*

<img src="../assets/images/collaboration/commits/commits-feature-chapter-II-03.png" alt="Historial de commits de feature/chapter-II, captura 3" style="max-width:100%;">

*Figura. Historial de commits de `feature/chapter-II` durante la consolidación del informe (captura 3).*

## Interpretación de la actividad colaborativa

El historial de commits evidencia una elaboración distribuida del informe entre las ramas de capítulo. Las capturas muestran aportes de Diego Andres Avalos Cordova, Flor de María Contreras Leon, Giorgio Awad, Alison Arrieta y Manuel Angel Sanchez, junto con integraciones realizadas mediante GitFlow. El Registro de Versiones resume las modificaciones relevantes y mantiene la trazabilidad entre cada aporte, el autor y la sección actualizada.

Durante AV1, la organización inicial por ramas de capítulo permitió distribuir responsabilidades e integrar los aportes mediante GitFlow. Para los siguientes cambios, el repositorio mantiene `main` y `develop` como ramas permanentes y utiliza ramas temporales integradas mediante Pull Request, con la trazabilidad registrada en los commits y en el Registro de Versiones.

## TB1

### Organización del trabajo

Entre el 6 y el 8 de octubre de 2026 se reorganizaron las fuentes del informe en `report/`, se prepararon los apartados de TB1 y se integraron avances de diseño y correcciones de investigación. El trabajo siguió el flujo de ramas temporales y Pull Requests descrito en CONTRIBUTING.md ([https://tinyurl.com/2yusurh6](https://tinyurl.com/2yusurh6)).

La reorganización se incorporó mediante el PR #1 ([https://tinyurl.com/2ys9jf2y](https://tinyurl.com/2ys9jf2y)). Los avances del Capítulo V llegaron a `develop` mediante el PR #6 ([https://tinyurl.com/2d9hv4an](https://tinyurl.com/2d9hv4an)), las correcciones generales mediante el PR #7 ([https://tinyurl.com/29xuo2km](https://tinyurl.com/29xuo2km)) y la revisión del Big Picture EventStorming mediante el PR #8 ([https://tinyurl.com/2yvnp8lu](https://tinyurl.com/2yvnp8lu)).

### Actividad colaborativa

Las siguientes métricas corresponden al historial alcanzable desde `develop` hasta `8eb4f5d` ([https://tinyurl.com/2czhng3z](https://tinyurl.com/2czhng3z)), con corte al 8 de octubre de 2026. Para el periodo TB1 se consideran los commits con fecha desde el 6 de octubre a las 00:00 hasta ese corte, hora de Perú (UTC−5). Se excluyen los commits de esta rama de auditoría; las identidades Git alternativas se consolidan bajo el nombre del integrante.

| Métrica | Valor |
|---|---|
| Commits de contenido (sin merges) en TB1 | 71 |
| Merges de integración en TB1 | 20 |
| Commits totales del periodo TB1 | 91 |
| Commits acumulados del historial | 219 |
| Periodo observado | 6 al 8 de octubre de 2026 |
| Ramas temporales integradas en TB1 | 9 |
| Artefactos del informe al corte | 6 capítulos con contenido; 165 imágenes rasterizadas, 12 SVG y 18 fuentes de diagramas |

| Integrante | Commits sin merge en el periodo | Aporte documentado |
|---|---|---|
| Avalos Cordova, Diego Andres | 36 | Reorganización del informe y desarrollo de las secciones de diseño web 5.1–5.5. |
| Romero Meza, Jhimy Pool | 12 | Ampliación del vocabulario del dominio, términos por contexto y revisión de claridad del informe. |
| Awad Vargas, Giorgio Marzouk | 8 | Revisión de User Stories, Technical Stories, dependencias, prioridades y backlog. |
| Contreras Leon, Flor de María | 7 | Evidencias de diseño IoT, configuración, planificación y despliegue documentado del Sprint 1. |
| Arrieta Quispe, Alison Jimena | 6 | Correcciones de C4 y Big Picture EventStorming y actualización de sus referencias. |
| Sanchez Arenas, Manuel Angel | 2 | Revisión de supuestos, análisis de entrevistas, enlaces y trazabilidad de historias. |

La cantidad de commits refleja actividad versionada y no mide por sí sola el esfuerzo ni la participación total. Los merges se contabilizan por separado; el historial incluye una integración atribuida a una cuenta automatizada. Los aportes de otros integrantes fuera de este periodo y las tareas sin commit propio no se deducen de esta tabla.

Al corte, el Capítulo V incluye guías de estilo, arquitectura de información, wireframes, mockups, wireflows, user flows y el prototipo de la Web Application. El Capítulo VI presenta la configuración de la Landing Page y la Web Application, evidencias de interfaz y despliegues. El alcance documentado no incluye backend; las tareas de Jira se identifican como simuladas y no como un Sprint ejecutado.

### Evidencias de colaboración y commits

| Evidencia | Cambios que respalda |
|---|---|
| Reorganización del informe, 1511611 ([https://tinyurl.com/2267b4wd](https://tinyurl.com/2267b4wd)) | Nueva estructura de capítulos, secciones iniciales, anexos y recursos. |
| Fotografías del equipo, 5330abc ([https://tinyurl.com/23xlojqe](https://tinyurl.com/23xlojqe)) | Actualización de los perfiles de integrantes. |
| PR #6: Capítulo V ([https://tinyurl.com/2d9hv4an](https://tinyurl.com/2d9hv4an)) | Guías visuales y arquitectura de información. |
| PR #7: correcciones generales ([https://tinyurl.com/29xuo2km](https://tinyurl.com/29xuo2km)) | Lean UX, investigación, requisitos y referencias. |
| PR #8: Big Picture EventStorming ([https://tinyurl.com/2yvnp8lu](https://tinyurl.com/2yvnp8lu)) | Modelo As-Is y capturas de FigJam. |

Las capturas de commits de la sección AV1 se conservan como evidencia histórica de esa entrega. Para TB1, las filas de contribución en Student Outcome ([https://tinyurl.com/2ycsp3br](https://tinyurl.com/2ycsp3br)) y el Registro de Versiones ([https://tinyurl.com/2aohjlzu](https://tinyurl.com/2aohjlzu)) enlazan los aportes con sus commits y Pull Requests.

### Corrección de requisitos a partir de la revisión del profesor

El 8 de octubre se creó `fix/user-and-technical-stories` a partir del estado actualizado del informe, conservando `develop` como base de integración. Giorgio Awad registró las correcciones en commits separados por alcance; la autoría corresponde a la identidad Git configurada `GiorgioAwad`. Los seis commits de contenido siguientes y el commit documental que registra estas evidencias permiten revisar qué cambió en cada aporte.

| Alcance | Commit | Cambio verificable |
|---|---|---|
| Contratación | 6f8fc2d ([https://tinyurl.com/26z8ox9a](https://tinyurl.com/26z8ox9a)) | Reformulación de US-33, US-34 y US-35 hacia registro, comparación de costos e inicio de suscripción; actualización de sus referencias en los Capítulos IV y V. |
| Collar y Edge | 0904aed ([https://tinyurl.com/2ywbwhpl](https://tinyurl.com/2ywbwhpl)) | Revisión de TS-01 a TS-06 con actores Device Maker y Portable Edge Gateway, captura identificable, recepción BLE, confirmación durable, configuración e idempotencia. |
| Cloud y abrevadero | 49e4a82 ([https://tinyurl.com/2a69t7c2](https://tinyurl.com/2a69t7c2)) | Revisión de TS-07 a TS-14 con consumidores concretos, autorización, estados de suscripción, notificaciones, contexto meteorológico y sincronización del abrevadero desde Edge. |
| Clientes y operación offline | 5c0e3e6 ([https://tinyurl.com/2xrlym4w](https://tinyurl.com/2xrlym4w)) | Incorporación de TS-15 a TS-19 para configuración Edge, alertas y telemetría locales, sincronización móvil e indicadores Web; ajuste de US-13, US-16, US-19 y US-22. |
| Impact Mapping y backlog | a10d064 ([https://tinyurl.com/28ywpnxz](https://tinyurl.com/28ywpnxz)) | Reformulación de BG-03 como reducción propuesta del CAC, mortalidad como hipótesis de beneficio del usuario y actualización del backlog a 57 US, 19 TS y 352 SP propuestos, con prioridades y dependencias revisadas. |
| Consistencia entre capítulos | eb24b01 ([https://tinyurl.com/29nsjjlk](https://tinyurl.com/29nsjjlk)) | Revisión de la evidencia de investigación, distinción de bajas por muerte en US-09 y corrección del texto arquitectónico y de las prioridades competitivas relacionadas con las historias. |

Se verificaron identificadores únicos, criterios Given–When–Then, correspondencia de títulos con el backlog, prioridades relacionadas del Capítulo II, enlaces locales y sumas por sprint. El resultado contiene 76 historias y 352 SP como propuesta para Sprint Planning; no acredita implementación ni cierre de sprints. Las capturas y tableros de Jira y UXPressia y los diagramas de arquitectura de AV1 requieren sincronización con esta especificación. El cambio se integró en `develop` mediante el PR #12, registrado en el merge `9cae532` ([https://tinyurl.com/2y6l5g8z](https://tinyurl.com/2y6l5g8z)).

## AV2

### Corte y criterio de atribución

Esta actualización considera únicamente el historial integrado en `feature/second-progress-update` hasta [f4e78d5](https://github.com/five-smart-farm-creators/ichu-report/commit/f4e78d5), merge del [PR #44](https://github.com/five-smart-farm-creators/ichu-report/pull/44), al 15 de noviembre de 2026. Se seleccionan los commits cuya fecha de autor es posterior al 8 de octubre de 2026, interpretada en hora de Lima (UTC-5). La actividad del periodo comienza el 19 de octubre. Las entradas de AV1 y TB1 conservan sus cortes históricos; esta medición incluye correcciones posteriores a TB1 y preparación de AV2, no solo trabajo realizado dentro del periodo del Sprint 2.

Se consolida la identidad del autor mediante `.mailmap`. Los commits con más de un padre se cuentan como merges, separados de los cambios de contenido; no se atribuye el contenido integrado a la persona que hizo el merge. Se excluyen otras ramas pendientes y los commits de esta actualización documental. Las cantidades describen actividad en el repositorio del informe y no miden esfuerzo, aceptación de historias ni participación en otros repositorios.

| Métrica | Valor |
|---|---:|
| Commits de contenido, sin merges | 73 |
| Merges de integración | 26 |
| Total de commits del periodo | 99 |
| Commits acumulados en el historial al corte | 333 |

### Aportes por integrante

| Integrante | Commits de contenido | Merges | Cambios verificables y evidencias |
|---|---:|---:|---|
| Avalos Cordova, Diego Andres | 22 | 14 | Estructura AV2, carátula, Sprint 1, User Task Matrix y EventStorming; guías del repositorio y alineación de requisitos, arquitectura, diseño, anexos e índice. Conservación de exportaciones históricas. [7650c94](https://github.com/five-smart-farm-creators/ichu-report/commit/7650c94), [586aa74](https://github.com/five-smart-farm-creators/ichu-report/commit/586aa74), [7c91fe6](https://github.com/five-smart-farm-creators/ichu-report/commit/7c91fe6), [3f01452](https://github.com/five-smart-farm-creators/ichu-report/commit/3f01452), [9f2c776](https://github.com/five-smart-farm-creators/ichu-report/commit/9f2c776), [0d438d7](https://github.com/five-smart-farm-creators/ichu-report/commit/0d438d7). |
| Awad Vargas, Giorgio Marzouk | 17 | 1 | Vocabulario del negocio, historias y trazabilidad, distinción entre negocio actual y diseño propuesto, guion de validación y planificación del Sprint 2. [7f3afb4](https://github.com/five-smart-farm-creators/ichu-report/commit/7f3afb4), [b36ff9d](https://github.com/five-smart-farm-creators/ichu-report/commit/b36ff9d), [a216172](https://github.com/five-smart-farm-creators/ichu-report/commit/a216172), [03ca151](https://github.com/five-smart-farm-creators/ichu-report/commit/03ca151), [bd53607](https://github.com/five-smart-farm-creators/ichu-report/commit/bd53607). |
| Contreras Leon, Flor de María | 17 | 9 | Especificaciones y límites IoT, enlace Wi-Fi collar–Edge y coherencia entre capítulos; convenciones GitFlow, validación de commits e identidades. [f4fcb34](https://github.com/five-smart-farm-creators/ichu-report/commit/f4fcb34), [93abc99](https://github.com/five-smart-farm-creators/ichu-report/commit/93abc99), [bdc1de6](https://github.com/five-smart-farm-creators/ichu-report/commit/bdc1de6), [87e32f0](https://github.com/five-smart-farm-creators/ichu-report/commit/87e32f0), [0c5e95d](https://github.com/five-smart-farm-creators/ichu-report/commit/0c5e95d), [73c8955](https://github.com/five-smart-farm-creators/ichu-report/commit/73c8955). |
| Arrieta Quispe, Alison Jimena | 15 | 2 | Revisión del modelo C4: relaciones, tecnologías, nombres, iconos, base de datos móvil y captura de contenedores. [98a8197](https://github.com/five-smart-farm-creators/ichu-report/commit/98a8197), [6a44c6f](https://github.com/five-smart-farm-creators/ichu-report/commit/6a44c6f), [0664064](https://github.com/five-smart-farm-creators/ichu-report/commit/0664064), [482eab8](https://github.com/five-smart-farm-creators/ichu-report/commit/482eab8), [6391627](https://github.com/five-smart-farm-creators/ichu-report/commit/6391627). |
| Sanchez Arenas, Manuel Angel | 2 | 0 | Ampliación de los resúmenes de entrevistas y de las hipótesis Lean UX. [4d4b25c](https://github.com/five-smart-farm-creators/ichu-report/commit/4d4b25c), [dade8ce](https://github.com/five-smart-farm-creators/ichu-report/commit/dade8ce). |
| Romero Meza, Jhimy Pool | 0 | 0 | No aparecen nuevos commits de su autoría en este periodo del historial integrado. Sus aportes de AV1 y TB1 se conservan como antecedentes. No se deduce su participación fuera de este repositorio. |
| **Total** | **73** | **26** | **99 commits del periodo.** |

El [Registro de Versiones](02-version-history.md) agrupa los 73 commits de contenido por autor, fecha y propósito. [Student Outcome](05-student-outcome.md) relaciona esas evidencias con los dos criterios de trabajo en equipo del curso.

### Integración y revisión

| Integración | Aporte incorporado |
|---|---|
| PR [#25](https://github.com/five-smart-farm-creators/ichu-report/pull/25) y [#26](https://github.com/five-smart-farm-creators/ichu-report/pull/26) | Resúmenes de entrevistas e hipótesis Lean UX de Manuel. |
| PR [#27](https://github.com/five-smart-farm-creators/ichu-report/pull/27), [#28](https://github.com/five-smart-farm-creators/ichu-report/pull/28) y [#29](https://github.com/five-smart-farm-creators/ichu-report/pull/29) | Correcciones de Giorgio a EventStorming, vocabulario e historias. |
| PR [#24](https://github.com/five-smart-farm-creators/ichu-report/pull/24), [#30](https://github.com/five-smart-farm-creators/ichu-report/pull/30) y [#32](https://github.com/five-smart-farm-creators/ichu-report/pull/32) | Revisiones C4 de Alison. |
| PR [#33](https://github.com/five-smart-farm-creators/ichu-report/pull/33), [#34](https://github.com/five-smart-farm-creators/ichu-report/pull/34) y [#36](https://github.com/five-smart-farm-creators/ichu-report/pull/36) | Convenciones de contribución y sus validaciones, trabajadas por Flor. |
| PR [#38](https://github.com/five-smart-farm-creators/ichu-report/pull/38), [#40](https://github.com/five-smart-farm-creators/ichu-report/pull/40) y [#42](https://github.com/five-smart-farm-creators/ichu-report/pull/42) | Especificaciones IoT, alineación collar–Edge y límites de alerta documentados por Flor. |
| PR [#41](https://github.com/five-smart-farm-creators/ichu-report/pull/41) | Diseño de entrevistas de validación de Giorgio para los dos segmentos. |
| PR [#43](https://github.com/five-smart-farm-creators/ichu-report/pull/43) | Revisión de alcance de Diego: backlog de 72 historias y 334 SP, arquitectura, diseño y referencias. |
| PR [#44](https://github.com/five-smart-farm-creators/ichu-report/pull/44) | Planificación de Giorgio para Sprint 2: 30 historias confirmadas y 164 SP estimados. |

### Organización del Sprint 2

La planificación de [6.2.2.1](../60-product-implementation-validation-and-deployment.md#6221-sprint-planning-2) registra una reunión virtual el 4 de noviembre de 2026 a las 10:00 PM (Lima), preparada por Diego, con Giorgio, Manuel, Flor, Alison y Diego como asistentes. El periodo del sprint es del 4 al 14 de noviembre. El reparto confirmado en [6.2.2.2](../60-product-implementation-validation-and-deployment.md#6222-aspect-leaders-and-collaborators) es:

| Entregable | Líder | Colaboradores |
|---|---|---|
| Mobile Application | Diego Avalos | Alison Arrieta, Manuel Sanchez y Giorgio Awad |
| Project Report | Manuel Sanchez | Alison Arrieta y Giorgio Awad |
| Website | Giorgio Awad | Alison Arrieta y Manuel Sanchez |

El rol de líder o colaborador es una asignación por entregable y se presenta separado de la autoría de los commits. Los 30 elementos del Sprint Backlog 2 suman 164 SP estimados; esa suma no constituye velocidad observada ni prueba de historias completadas. El historial respalda cambios de planificación, diseño y documentación. Las entrevistas de validación ejecutadas, las pruebas del producto y la aceptación del incremento necesitan evidencia propia.

Como aprendizaje del periodo, las revisiones muestran la necesidad de comprobar la correspondencia entre alcance, backlog, modelos y anexos antes de integrar. La conservación de imágenes y exportaciones originales en [9f2c776](https://github.com/five-smart-farm-creators/ichu-report/commit/9f2c776), [0d438d7](https://github.com/five-smart-farm-creators/ichu-report/commit/0d438d7) también exige distinguir las fuentes actualizadas de las capturas históricas que aún requieren sincronización.

<div style="break-after: page; page-break-after: always;"></div>
