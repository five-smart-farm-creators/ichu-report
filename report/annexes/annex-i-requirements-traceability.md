# Anexo I. Cobertura y trazabilidad de requisitos

Este anexo conserva el análisis complementario de la [tabla de épicas e historias](../30-requirements-specification.md#31-épicas-e-historias-de-usuario): roles, criterios de especificación, relación con el diseño, cobertura y evidencia de investigación.

## Roles y criterios de especificación

**Roles considerados en la especificación**

Los dos segmentos objetivo agrupan a los usuarios por su relación con el negocio. Dentro del Segmento 1 conviven dos roles operativos que ejecutan tareas distintas sobre la misma unidad productiva, y que las entrevistas identificaron con claridad:

| Rol | Segmento | Sustento en la investigación |
|---|---|---|
| **Administrador ganadero** | Segmento 1 | Propietario o gestor de la unidad productiva. Decide la compra, evalúa costos y consulta indicadores. Corresponde a Próspero Contreras y Meikoll Morell. |
| **Operario de campo** | Segmento 1 | Personal que ejecuta las faenas en el potrero. No decide la compra, pero es quien registra los eventos y busca a los animales. Aparece en la entrevista de Meikoll, que señala la "falta de hábito para registrar las intervenciones inmediatamente después del trabajo de campo", y en la de Grober, responsable de "asistencia técnica en sanidad, manejo, alimentación y registros". |
| **Médico veterinario** | Segmento 2 | Profesional que diagnostica y prescribe. Corresponde a Darwin Carbajal, Eliseo Ramírez y Dionisio Rodríguez. |
| **Visitante** | No aplica | Rol base para el sitio web estático, sin cuenta en la plataforma. |
| **Fabricante o integrador de dispositivos** | No aplica | Fabricante o integrador del collar y del controlador; necesita contratos de captura, transmisión y confirmación para integrar el programa embebido. |
| **Nodo de borde portátil** | No aplica | Sistema que recibe lecturas por BLE, las conserva y evalúa localmente y consume la API central al recuperar conectividad. |
| **Aplicación web** | No aplica | Cliente de la API central para consultas del hato, indicadores y contratación. Actúa con la autorización del usuario. |
| **Aplicación móvil** | No aplica | Cliente de la API central y del nodo de borde para consultas, alertas y registros de campo, con permisos y operación sin Internet. |
| **Servicio central de ICHU** | No aplica | Sistema que consume proveedores externos y expone servicios a los clientes autorizados. |

Los actores técnicos describen al consumidor o sistema responsable de una capacidad; no constituyen nuevos segmentos de mercado. Las rutas HTTP y los contratos de la sección 3.1 son requisitos propuestos, no evidencias de servicios ya implementados. El flujo obligatorio del collar es **collar inteligente → BLE → nodo de borde portátil → API central**. El adaptador BLE del nodo de borde entrega los paquetes al servicio de borde local; el collar no invoca rutas HTTP ni se conecta directamente a la nube.

El operario de campo no constituye un tercer segmento objetivo. Es un rol operativo dentro del Segmento 1, cuya adopción del producto depende de la decisión de compra del administrador, por lo que no se le construye un arquetipo propio.

**Criterios de especificación**

Los criterios de aceptación siguen la estructura Dado-Cuando-Entonces y se redactan en tiempo presente y tercera persona. Cada criterio cumple tres condiciones:

- **Es independiente de la interfaz.** No se menciona ningún control, vista, color ni gesto de interacción, de modo que el criterio conserva su validez ante cualquier cambio en la propuesta visual.
- **Es comprobable.** Cada cláusula `Entonces` nombra la entidad del dominio afectada, los datos que quedan registrados, el estado al que transita el objeto o el umbral que se evalúa.
- **Aporta información adicional.** Cada escenario incorpora una condición verificable distinta de la descripción de la historia, e incluye un escenario alternativo o de error cuando el flujo lo admite.

## Relación de las épicas con el diseño

Los requisitos se organizan en doce épicas. La siguiente relación con los contextos de software del capítulo IV facilita la trazabilidad hacia el diseño propuesto; estos contextos no organizan el glosario del negocio de la sección 2.5.

| Épica | Contexto de software asociado | Producto digital principal |
|---|---|---|
| EP-01 Gestión de cuenta y acceso | `Identity & Access Management`, `Profiles` | Web y móvil |
| EP-02 Registro e información del ganado | `Cattle Information` | Web y móvil |
| EP-03 Gestión de dispositivos IoT | `IoT Assets` | Aplicación web |
| EP-04 Monitoreo y telemetría del ganado | `Operations & Monitoring` | Web y móvil |
| EP-05 Alertas preventivas y seguridad | `Operations & Monitoring` | Móvil y web |
| EP-06 Operación de campo sin conexión | `Operations & Monitoring` | Aplicación móvil |
| EP-07 Historial y atención veterinaria | `Cattle Information`, `Operations & Monitoring` | Web y móvil |
| EP-08 Planificación del calendario ganadero | `Planning` | Web y móvil |
| EP-09 Análisis para la toma de decisiones | `Dashboard & Analytics` | Aplicación web |
| EP-10 Página de presentación y suscripciones | `Subscription Plans` | Página de presentación |
| EP-11 Plataforma IoT e integración de servicios | Transversal (técnico) | Aplicación embebida, API local y API REST |
| EP-12 Control del abrevadero | `Operations & Monitoring` | Aplicación embebida, web y móvil |

## Calidad, cobertura y trazabilidad

**Criterios de calidad aplicados a las historias de usuario**

- Cada historia tiene un identificador único y pertenece a una sola épica.
- Cada historia representa una necesidad del negocio o una capacidad técnica concreta, trazable a un hallazgo de los capítulos I y II.
- Los criterios de aceptación describen comportamientos comprobables: nombran la entidad del dominio afectada, los datos que quedan registrados y el estado resultante.
- Ningún criterio de aceptación hace referencia a controles, pantallas, colores ni gestos de interacción.
- Las historias que admiten un flujo alternativo incluyen al menos un escenario de error o de excepción.
- Las historias técnicas identifican al consumidor o sistema responsable. Los contratos HTTP especifican método, ruta, autorización y respuesta; los contratos embebidos o BLE especifican datos, confirmación y fallos sin inventar una ruta HTTP en el collar.
- Las historias informativas y de contacto de la página de presentación forman parte de la primera iteración; la contratación integrada de US-34 requiere servicios y se planifica después de TB1.
- Las historias de internacionalización (US-37) y accesibilidad (US-38) cubren los requisitos de i18n y a11y exigidos para la página de presentación y las aplicaciones web.

**Cobertura por arquetipo de usuario**

Cada arquetipo de usuario cuenta con al menos 21 historias de usuario redactadas desde su rol. Ambos segmentos objetivo reciben así una especificación de requisitos equivalente en profundidad, sin que ninguno quede representado como un usuario secundario de la plataforma.

| Rol en la redacción | Arquetipo de usuario asociado | Segmento | Historias de usuario |
|---|---|---|---|
| Administrador ganadero | Cesar Flores | Segmento 1 | 23 |
| Médico veterinario | Leonardo Rosales | Segmento 2 | 22 |
| Operario de campo | No aplica, es un rol operativo | Segmento 1 | 5 |
| Visitante | No aplica, es el rol base del sitio web estático | No aplica | 7 |
| Usuario registrado | No aplica, es un rol transversal de acceso | No aplica | 1 |
| Ganadero o médico veterinario | Ambos segmentos, recorrido inicial de la interfaz (US-58) | Segmentos 1 y 2 | 1 |
| Actores técnicos | fabricante o integrador de dispositivos, nodo de borde portátil, aplicación web, aplicación móvil y servicio central de ICHU | No aplica | 19 |

**Cobertura por producto digital**

La cobertura es compartida: una historia puede habilitar más de un producto. Las 59 historias de usuario describen necesidades de personas; las 19 historias técnicas especifican contratos de dispositivos, nodo de borde, nube y clientes. No se suman las filas siguientes para obtener el total.

| Producto digital | Historias de usuario relacionadas | Historias técnicas habilitadoras |
|---|---|---|
| Página de presentación | US-32 a US-38, US-59 | Ninguna API propia para la primera versión; TS-10 habilita la contratación integrada de US-34 en una iteración posterior. |
| Aplicación web | US-01 a US-19, US-23 a US-31, US-39 a US-54, US-57, US-58 | US-58 no requiere servicio central; TS-08, TS-10, TS-14 y TS-19 habilitan la integración funcional posterior. |
| Aplicación móvil | US-07, US-13, US-16, US-19 a US-22, US-27, US-40, US-47, US-54 a US-56 | TS-09, TS-14, TS-16, TS-17, TS-18 |
| API REST central | Soporta acceso, suscripción, monitoreo, atención e indicadores | TS-06 a TS-12, TS-14, TS-15, TS-18, TS-19 |
| API local / nodo de borde portátil | US-13, US-16, US-17, US-19, US-20, US-54, US-56 | TS-04, TS-05, TS-06, TS-14, TS-15, TS-16, TS-17 |
| Aplicaciones embebidas | Habilitan captura del collar y control local del abrevadero | TS-01, TS-02, TS-03, TS-13 |

**Dependencias técnicas añadidas por la revisión**

| Necesidad | Contratos y dependencias |
|---|---|
| Primera experiencia web | US-58 ofrece recorridos con datos de ejemplo y validación local; no completa US-01, US-02, US-03, US-04, US-06 ni US-07 como capacidades integradas. |
| Contacto para demostración | US-59 prepara el mensaje en el canal publicado y deja el envío a la persona; no requiere TS-10 ni registra una contratación. |
| Contratar desde el sitio público | US-35 → US-34 → US-01 / US-02 → TS-10. Una solicitud pendiente no acredita cobro ni suscripción activa. |
| Alertas sin Internet | US-10 y US-15 configuran asignaciones y geocercas; TS-15 las descarga; TS-01 / TS-04 / TS-05 capturan, reciben y evalúan; TS-16 permite consultar y atender alertas localmente. |
| Monitoreo en móvil durante el pastoreo | TS-17 sirve datos locales; US-13 y US-20 indican origen y antigüedad. No se presupone cobertura en la nube. |
| Registros de campo sin Internet | US-21 / US-22 → TS-18. La cola de eventos móviles es distinta de la cola de telemetría del nodo de borde de TS-06. |
| Indicadores web | US-29 / US-31 → TS-19, sobre datos sincronizados y autorizados; la ausencia de datos se distingue de un valor cero. |

**Trazabilidad con los hallazgos de la investigación**

La tabla remite al registro y análisis de entrevistas del Capítulo II ([https://tinyurl.com/2aem72rp](https://tinyurl.com/2aem72rp)). Distingue hallazgos documentados de requisitos propuestos: mencionar un indicador o una integración no demuestra que el prototipo ya lo mida o implemente.

| Hallazgo de la investigación | Historias que lo atienden |
|---|---|
| Registro fragmentado entre Excel y cuadernos, sin ficha clínica por animal (Próspero, Meikoll, Grober) | US-06, US-07, US-21, US-23 |
| Cuestionario del Segmento 1: 2 de 2 respuestas califican la cobertura como regular; entrevistas describen conectividad irregular | US-22, TS-03, TS-04, TS-05, TS-06, TS-15, TS-16, TS-17, TS-18 |
| Abigeato calificado como problema frecuente y costoso; microchip que falló por falta de señal (Meikoll) | US-15, US-17, US-20 |
| Celo silencioso detectado con dos o tres días de retraso (Darwin) | US-18 |
| Mal de altura en terneros, que se manifiesta primero como reducción del movimiento (Grober) | US-13, US-16, TS-01 |
| Darwin, Eliseo y Dionisio mencionan temperatura, actividad o rumia como información útil; la disponibilidad de cada indicador depende de mediciones validadas | TS-01, TS-08, US-14, US-30 |
| Alertas rojas automáticas ante caída de constantes vitales (Darwin, Eliseo, Dionisio) | US-16, US-19, TS-09, TS-11 |
| Darwin menciona evidencia ecográfica para ASCRIGAR; Eliseo y Dionisio solicitan integración con ecógrafos. Adjuntar evidencia no implementa por sí solo una integración externa | US-25 |
| Reportes exportables a Excel o PDF para sustituir el llenado manual (Eliseo, Dionisio) | US-31 |
| Campañas sanitarias según el calendario andino: carbúnculo, desparasitación (Próspero, Meikoll) | US-26, US-27, US-28 |
| Preferencia de pago declarada en el cuestionario; disposición de contratación pendiente de validación | US-34, US-35, TS-10 |
| Control de costos y rentabilidad por cabeza (Próspero, Meikoll, Grober) | US-29, US-31 |
| Verificación manual de pastos y agua durante el recorrido diario del predio (mapa de empatía de Cesar Flores) | US-54, US-55, US-56, TS-13, TS-14 |
| Caída del consumo y de la rumia como signo previo a un cuadro clínico (Darwin, Eliseo, Dionisio) | US-57 |
| Riesgo de intoxicación por dosificación repetida y de fallo de preñez por vacunación omitida | US-41, US-43, US-51 |
| Darwin describe seguimiento de constantes tras el tratamiento; los plazos de cada caso deben ser configurados y validados por el profesional, no asumidos como una regla universal | US-40, US-42 |
| Uso de exámenes de laboratorio en casos complejos (Eliseo, Dionisio) | US-44 |
| Mejoramiento genético a partir de días abiertos, índice de fertilidad y registros multigeneracionales (Grober) | US-45 |
| Módulos nutricionales que identifiquen deficiencias en la dieta (Eliseo, Dionisio) | US-46 |
| Justificación de tratamientos ante el dueño de la estancia mediante reportes (Eliseo) | US-47, US-48 |
| Análisis epidemiológico por lote y decisión de cuarentena (Darwin) | US-49, US-52 |
| Atención de múltiples establos con visitas programadas y de emergencia (Darwin, Eliseo, Dionisio) | US-39, US-50, US-53 |
