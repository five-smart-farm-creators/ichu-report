# Capítulo II: Requirements Elicitation & Analysis

## 2.1. Competidores.

### 2.1.1. Análisis competitivo.

**Competitive Analysis Landscape**

| Sección | Criterio | ICHU IoT (nuestra startup)<br>![Logo de ICHU IoT](assets/images/logo-ichu-small.png) | Competidor 1: Allflex SenseHub<br>![Logo de Allflex SenseHub](assets/images/logo-allflex-small.png) | Competidor 2: Digitanimal<br>![Logo de Digitanimal](assets/images/logo-digitanimal-small.png) | Competidor 3: Moocall<br>![Logo de Moocall](assets/images/logo-moocall-small.png) |
|---|---|---|---|---|---|
| **¿Por qué llevar a cabo este análisis?** | Objetivo del análisis | Comparar ICHU con sus principales competidores para identificar fortalezas, debilidades, oportunidades y amenazas, y determinar una ventaja competitiva clara y sostenible en el mercado de monitoreo inteligente de ganado. | | | |
| **Perfil** | Overview | Solución digital basada en collares inteligentes IoT con conectividad LoRaWAN y celular híbrida, integrada a una plataforma web y móvil nativa para el monitoreo biométrico y localización en tiempo real de ganado en pastoreo extensivo. | Líder global en identificación animal y monitoreo inteligente de ganado lechero y de carne, perteneciente al grupo MSD Animal Health, con infraestructura propietaria robusta. | Empresa de base tecnológica española que ofrece collares GPS y sensores para el monitoreo de la ubicación, temperatura y comportamiento de animales en pastoreo extensivo. | Compañía irlandesa especializada en dispositivos IoT acoplados a la cola del animal para la detección temprana del parto y collares para el monitoreo de celo. |
| **Perfil** | Ventaja competitiva: ¿qué valor ofrece a los clientes? | Conectividad híbrida adaptable (LoRaWAN/Red Celular) con modo offline para sincronización retrasada; algoritmos locales de bajo consumo; costo accesible sin necesidad de costosas antenas propietarias locales en cada rancho ganadero. | Monitoreo biométrico de altísima precisión (rumia, estrés por calor, celo) respaldado por décadas de investigación veterinaria y validación clínica a nivel industrial. | Alta durabilidad y resistencia del dispositivo GPS, geocofencing de gran precisión geográfica y mapeo visual avanzado de rutas de pastoreo sin antenas locales intermedias. | Especialización extrema y 100% enfocada en el parto y celo con alertas directas por SMS independientes de red local, con alta tasa de éxito preventivo en ganado gestante. |
| **Perfil de Marketing** | Mercado objetivo | Medianos y grandes productores ganaderos en América Latina con ganado de carne y doble propósito bajo esquemas de pastoreo extensivo o semi-intensivo. | Megaproductores de ganado lechero y de carne de alta producción bajo confinamiento o pastoreo intensivo que pueden costear alta infraestructura. | Ganaderos de montaña o pastoreo extensivo en Europa y América Latina que sufren pérdidas frecuentes por extravío o depredadores. | Criadores de ganado vacuno enfocados en la reproducción y mejora genética, con rodeos medianos que requieren monitoreo crítico en época de parición. |
| **Perfil de Marketing** | Estrategias de marketing | Demostraciones prácticas en asociaciones ganaderas locales, marketing digital enfocado en el ahorro de mano de obra y reducción de tasas de mortalidad animal, alianzas con veterinarias locales. | Venta consultiva directa corporativa, presencia imponente en ferias internacionales agropecuarias, marketing científico con publicaciones respaldadas por veterinarios. | Marketing de contenidos enfocado en la prevención del robo de ganado (abigeato), campañas digitales basadas en casos de éxito de recuperación de animales extraviados. | Publicidad de nicho en revistas y foros especializados en inseminación y cría, demostraciones de "antes y después" del parto, y distribución mediante veterinarias aliadas. |
| **Perfil de Producto** | Productos & Servicios | Collar inteligente con acelerómetro y sensor de temperatura; aplicación móvil nativa (Android/iOS); plataforma web de gestión analítica; API RESTful para servicios veterinarios. | Collares y aretes inteligentes SenseHub, antenas receptoras propietarias fijas de largo alcance, software SaaS de escritorio y aplicación móvil de alertas en tiempo real. | Collares de localización GPS con sensores de temperatura, plataforma web de visualización cartográfica, y aplicaciones para dispositivos móviles de rastreo y geocofencing. | Sensor Moocall Calving (acoplado a la cola), collar Moocall HEAT, servicio SaaS de envío de alertas por mensajes de texto integrados y aplicación para teléfonos inteligentes. |
| **Perfil de Producto** | Precios & Costos | Dispositivos de bajo costo de adquisición única; plan de suscripción mensual flexible por escala de ganado (Premium y Básico) adaptado al volumen real del ganadero. | Costo de adquisición de hardware muy elevado; tarifas de instalación de antenas propietarias muy costosas; contrato de licenciamiento SaaS anual rígido y de alto valor. | Costo moderado por dispositivo collar; suscripción mensual obligatoria por la conectividad celular/NB-IoT integrada en cada collar de forma independiente. | Costo único por el sensor de parto; cuota de servicio anual fija obligatoria para cubrir el costo de las alertas de telefonía celular global por SMS. |
| **Perfil de Producto** | Canales de distribución (Web y/o Móvil) | Plataforma web (Landing Page) con e-commerce integrado; distribuidores regionales de insumos agropecuarios; y tiendas oficiales de aplicaciones móviles nativas. | Red global de distribuidores autorizados exclusivos de MSD Animal Health y representantes de ventas técnicas directas en zonas ganaderas industriales. | Sitio web con tienda en línea directa; envíos internacionales; alianzas de distribución con operadores de redes de telecomunicaciones IoT (como Telefónica) y conectividad satelital NB-NTN. | Tienda en línea oficial, marketplaces especializados (Amazon, agro-tiendas), y cooperativas ganaderas autorizadas con presencia física internacional. |
| **Análisis SWOT** | Fortalezas | Conectividad híbrida LoRaWAN/celular de bajo consumo, soporte nativo de modo sin conexión (offline) para guardado local en zonas remotas, arquitectura de software basada en microservicios ágiles que facilita la integración rápida mediante API RESTful con laboratorios y veterinarias. | Respaldo de una multinacional farmacéutica veterinaria, algoritmos de rumia probados científicamente a nivel mundial, red de soporte técnico in situ de alta presencia. | Dispositivos muy resistentes con excelente diseño industrial hermético, fuerte presencia de marca en el mercado ganadero de habla hispana. | Solución sumamente específica y validada para la reducción de mortalidad de terneros durante el parto, sin necesidad de configuraciones de red complejas por parte del usuario. |
| **Análisis SWOT** | Debilidades | Marca nueva en el mercado sin posicionamiento previo, presupuesto de marketing inicialmente limitado, dependencia de la capacidad de ensamblaje inicial para los lotes de collares físicos. | Costo de inversión restrictivo para productores pequeños y medianos, obligatoriedad de instalar antenas fijas receptoras en el terreno (inviable para grandes pastizales extensivos sin energía eléctrica). | Fuerte dependencia de la conectividad de redes de telecomunicaciones de terceros para la transmisión de datos, falta de integración directa y amigable con servicios locales de atención de salud animal del sector. | Alcance funcional muy limitado (no sirve para geolocalización, control de pastoreo diario, ni detección generalizada de enfermedades comunes del ganado). |
| **Análisis SWOT** | Oportunidades | Creciente necesidad de digitalización en el sector ganadero latinoamericano para mitigar el robo de ganado (abigeato); alta disponibilidad de redes de comunicación IoT abiertas de largo alcance (LoRaWAN). | Migración de medianos ganaderos hacia ganaderías intensivas de alta eficiencia donde el retorno de inversión se percibe más rápido. | Expansión de redes de conectividad celular de banda estrecha (NB-IoT) en América Latina que podrían reducir el consumo de sus baterías. | Alianzas con proveedores de semen y genética bovina para empaquetar el dispositivo en programas de reproducción bovina de alta gama. |
| **Análisis SWOT** | Amenazas | Fluctuación de precios de los componentes electrónicos para la fabricación de los collares; posibilidad de ingreso rápido de competidores chinos de bajo costo con hardware genérico sin valor analítico. | Desintermediación del mercado por soluciones de software de código abierto e integraciones de sensores genéricos. | Lanzamiento de collares inteligentes de bajo costo por parte de startups locales latinoamericanas con mejor soporte al cliente y tarifas flexibles. | Obsolescencia del dispositivo de cola si los collares biométricos de la competencia logran predecir el parto con la misma o mayor precisión a menor costo general. |

### 2.1.2. Estrategias y tácticas frente a competidores.

Para posicionar a ICHU IoT con éxito, nuestra startup implementará un conjunto de estrategias y tácticas comerciales y de ingeniería de software orientadas a contrarrestar las fortalezas de los competidores establecidos y capitalizar sus debilidades en el contexto ganadero latinoamericano:

#### Estrategia 1: Reducción de Barreras Económicas y Tecnológicas de Infraestructura

- **Táctica Comercial:** Reducir la dependencia de antenas fijas propietarias en el rancho ganadero. El collar transmite sus lecturas localmente al componente Edge disponible en el predio; el Edge las sincroniza con la plataforma central cuando recupera conectividad. Esta arquitectura busca reducir la infraestructura fija requerida, sujeto a validación en el piloto.
- **Táctica de Ingeniería:** Conservar temporalmente la telemetría cuando no haya conectividad y entregarla al Edge cuando el collar pueda comunicarse con él. El Edge mantiene los registros pendientes y los sincroniza de forma asíncrona con la plataforma central cuando exista conexión.

#### Estrategia 2: Optimización Energética de los Dispositivos Físicos

- **Táctica Comercial:** Promocionar una vida útil de la batería del collar de hasta 3 años, reduciendo drásticamente las horas de mano de obra asociadas al cambio de baterías y manipulación estresante del ganado (superando la debilidad de Digitanimal).
- **Táctica de Ingeniería:** Implementar en los dispositivos embebidos un algoritmo inteligente de transmisión dinámica. Si el ganado se encuentra en reposo (determinado por el acelerómetro local), el módulo GPS/transmisor entra en modo de ultra bajo consumo (Deep Sleep), transmitiendo únicamente cuando se detecten patrones de actividad inusual, geocofencing cruzado o anomalías térmicas en el animal.

#### Estrategia 3: Flexibilidad de Suscripción y Monetización Adaptativa

- **Táctica Comercial:** Ofrecer un modelo de negocio SaaS con planes escalables basados en el tamaño real de la unidad ganadera (por cabeza de ganado), permitiendo a los medianos productores adoptar la tecnología de forma incremental. Esto contrasta directamente con los planes de pago anuales rígidos e inaccesibles de Allflex y Digitanimal.
- **Táctica de Ingeniería:** Implementar en nuestro backend de servicios web un módulo dinámico de suscripciones y facturación asimilado por el microservicio correspondiente, permitiendo habilitar o deshabilitar de forma automática características del software (como reportes avanzados o alertas SMS críticas) basándose en el plan activo del usuario.

#### Estrategia 4: Integración del Ecosistema de Salud mediante API RESTful de Desarrollo Interno

- **Táctica Comercial:** Posicionar a ICHU IoT no solo como un rastreador o un sensor aislado, sino como una plataforma abierta que conecta al ganadero con su médico veterinario de confianza. El veterinario podrá visualizar análisis clínicos e históricos de salud de manera remota para prescribir tratamientos oportunos, reduciendo las visitas físicas improductivas.
- **Táctica de Ingeniería:** Diseñar y documentar rigurosamente los endpoints de nuestro RESTful API con OpenAPI/Swagger, permitiendo que sistemas externos de laboratorios o software de gestión de terceros se integren de forma segura mediante protocolos estandarizados, expandiendo el valor del ecosistema sin comprometer la seguridad de la información.

**Vinculación de estrategias con funcionalidades y Product Backlog**

La prioridad corresponde al orden y sprint registrados en el Product Backlog del Capítulo III; los puntos indicados son Story Points y expresan esfuerzo estimado, no prioridad. Cuando el backlog no contiene una historia que implemente una táctica completa, se indica como brecha y no como capacidad comprometida.

| Ventaja competitiva buscada | Funcionalidad que la habilita | Historia asociada en el backlog | Prioridad registrada |
|---|---|---|---|
| Reducir la dependencia de infraestructura fija y tolerar zonas sin cobertura | Conservar lecturas pendientes en el collar; recibirlas en Edge; sincronizar desde Edge hacia la API central al recuperar conectividad; operar sin cobertura | TS-03, TS-04, TS-06 y US-22 | TS-03: orden 20, 5 SP, Sprint 2; TS-04: orden 19, 8 SP, Sprint 2; TS-06: orden 23, 8 SP, Sprint 2; US-22: orden 36, 8 SP, Sprint 2 |
| Extender el tiempo de operación del collar entre cambios de batería | Ajustar muestreo y suspensión del dispositivo según su actividad | TS-01 y TS-02 | TS-01: orden 18, 8 SP, Sprint 2; TS-02: orden 37, 5 SP, Sprint 3; La autonomía de hasta tres años es una meta técnica por validar, no un resultado medido. |
| Facilitar la adopción progresiva mediante planes ajustados al tamaño del hato | Comparar cobertura y costos e iniciar el registro y la solicitud de suscripción | US-35, US-34, TS-10 | US-35: orden 6, 5 SP, Sprint 1; US-34: orden 8, 5 SP, Sprint 1; TS-10: orden 5, 8 SP, Sprint 1. El cobro requiere confirmación comercial y no se presume implementado. |
| Diferenciar el servicio mediante alertas sanitarias y acceso clínico compartido | Consultar telemetría e historial, recibir y atender alertas, y autorizar al veterinario sobre el hato | US-04, US-13, US-14, US-16 y US-19 | US-04: orden 10, 5 SP, Sprint 1; US-13: orden 26, 3 SP, Sprint 2; US-14: orden 49, 5 SP, Sprint 3; US-16: orden 30, 8 SP, Sprint 2; US-19: orden 31, 3 SP, Sprint 2 |
| Ampliar el ecosistema con integraciones veterinarias y de terceros | API externa documentada y conexiones con laboratorios, ecógrafos o software nutricional | No se identifica una HU de integración externa en el backlog actual. US-04 y US-14 cubren autorización y consulta clínica, pero no implementan por sí solas dicha interoperabilidad. | Pendiente de priorización y definición como historia específica. |

## 2.2. Entrevistas.

### 2.2.1. Diseño de entrevistas.

A continuación, se presenta la relación de preguntas principales y complementarias estructuradas para cada uno de los dos segmentos objetivo identificados. El cuestionario recopila tanto la información demográfica y de perfil requerida para construir los User Personas (arquetipos) como la información operativa y de dolor para mapear los requisitos de software del sistema.

**Segmento 1:** Medianos y Grandes Ganaderos (Propietarios y Administradores de Estancias)

Este segmento representa al comprador principal (Buyer Persona) y tomador de decisiones financieras de la estancia. El objetivo es identificar la viabilidad de la plataforma web administrativa, el modelo de suscripción SaaS y los indicadores clave (KPIs) de productividad que desean ver en pantalla.

#### BLOQUE 1: Datos Demográficos y de Perfil (Información Complementaria)

**Objetivo:** Construir el arquetipo recolectando características demográficas, ocupación, biografía y canales digitales de interacción.

1. ¿Cuál es su nombre, edad, nivel de instrucción y en qué distrito/región se encuentra su estancia ganadera?
2. ¿Cuál es su ocupación o rol principal en el día a día en torno al ganado?
3. ¿Qué dispositivos digitales prefiere utilizar en su rutina diaria (computadora de escritorio, laptop, tablet, teléfono inteligente)?

---

#### BLOQUE 2: Comportamiento, Infraestructura y Frustraciones

**Objetivo:** Entender el contexto operativo actual del rancho, sus cuellos de botella tecnológicos y sus principales puntos de dolor.

1. ¿Cuántas cabezas de ganado maneja actualmente en su unidad productiva y bajo qué régimen (pastoreo extensivo, estabulado o semi-intensivo)?
2. ¿Qué herramientas o sistemas de software utiliza actualmente para llevar el control del inventario de animales, partos, muertes e historial médico?
3. ¿Cómo es el estado de la conectividad a internet (red celular 3G/4G/5G, internet satelital, etc.) en la casa del rancho y en las zonas de pastoreo?
4. ¿Cuál ha sido la pérdida económica más significativa que ha tenido en el último año debido a enfermedades no detectadas a tiempo o muerte súbita de animales?
5. ¿Cómo le afecta el robo de ganado (abigeato) o el extravío de animales en términos de costos de búsqueda y pérdida patrimonial?
6. Al contratar consultorías veterinarias externas, ¿cuáles son los principales problemas de comunicación o falta de datos históricos que experimenta?

---

#### BLOQUE 3: Validación de la Propuesta de Software (ICHU)

**Objetivo:** Validar el modelo de negocio, el hardware y los indicadores clave (KPIs) del proyecto.

1. Si existiera una plataforma web que centralizara el historial de salud, ubicación y alertas térmicas de cada animal sin que usted tenga que estar físicamente en el corral, ¿cómo cambiaría su proceso de toma de decisiones?
2. ¿Qué información cuantitativa (gráficos de temperatura, horas de actividad, alertas de celo) consideraría indispensable visualizar en un tablero de control ejecutivo?
3. ¿Bajo qué condiciones o modelo de suscripción (ej. un pago mensual por cabeza de ganado monitoreada) consideraría rentable implementar esta solución de software en su negocio?

---

#### BLOQUE 4: Captura de Funcionalidades

**Objetivo:** Obtener los requisitos técnicos y módulos específicos que deben programarse en el sistema.

##### 1. Funcionalidades de Sanidad y Trazabilidad (El Historial del Animal)

1. En su trabajo diario controlando la salud del ganado, ¿qué datos médicos necesita registrar sí o sí en el sistema? (Ej. tipo de vacuna, fecha, dosis, nombre del veterinario).
2. Si el software tuviera un perfil individual por cada vaca, ¿qué información específica le gustaría encontrar al abrir ese perfil?
3. ¿Le gustaría que el sistema le envíe notificaciones automáticas? De ser así, ¿de qué tipo? (Ej. recordatorios de revacunación, alertas de parto, periodos de cuarentena).

##### 2. Funcionalidades de Inventario y Movimientos (Control de Stock)

1. Para llevar el control de cuántas cabezas de ganado tiene, ¿qué funciones específicas le pediría a la plataforma? ¿Le sirve poder agruparlos por lotes, por edad, por raza o por potrero?
2. Cuando ocurre un nacimiento o una muerte en el campo, ¿qué campos obligatorios le gustaría que el capataz llene en la aplicación para que usted tenga la información completa?
3. ¿Necesita que el software le permita registrar el movimiento de animales de un potrero a otro? ¿Qué datos le gustaría ver en esa función? (Ej. días de descanso del pasto, carga animal).

##### 3. Funcionalidades Financieras y de Insumos (El Negocio)

**Objetivo:** Capturar las herramientas de administración económica que espera encontrar.

1. En la parte administrativa de su trabajo, ¿qué funcionalidades le gustaría tener para controlar sus gastos? ¿Necesita un módulo para registrar la compra de alimento y medicinas?
2. ¿Le interesaría que el sistema descuente automáticamente el stock de su inventario cada vez que se aplica una medicina a un animal?
3. Como administrador, ¿qué reportes exactos necesita exportar a fin de mes? (Ej. un reporte en Excel de mortalidad mensual, gráficos de ganancia de peso, costos operativos por cabeza).

##### 4. Usabilidad en el Campo (La Interfaz de Trabajo)

**Objetivo:** Capturar cómo debe ser la herramienta física para que no entorpezca su trabajo en el corral.

1. Cuando usted o su equipo están en la manga (corral) trabajando directamente con el animal, ¿qué botones o funciones necesitan que estén más a la mano en la pantalla del celular para no perder tiempo?
2. Sabiendo que muchas veces no hay internet en el potrero, ¿qué acciones específicas necesita poder guardar en la aplicación sin conexión (modo offline) para que se actualicen cuando regrese a la casa?

**Segmento 2:** Zootecnistas y Médicos Veterinarios

Este segmento proporciona el sustento técnico-científico del dominio de salud. El objetivo es validar qué variables cuantitativas de telemetría biométrica (temperatura, acelerometría) requiere el veterinario para predecir anomalías de salud y cómo la API RESTful de ICHU debe estructurar los historiales clínicos para consumo de sistemas externos.

#### BLOQUE 1: Sobre Él/Ella y su Ecosistema de Trabajo (Rompehielos y Perfil)

**Objetivo:** Entender quién es el usuario, cómo se mueve en su día a día y qué nivel de adopción tecnológica tiene.

1. Para empezar, me encantaría conocer un poco sobre usted y su trayectoria: **¿cómo decidió especializarse en esta área y cuántos años lleva ejerciendo en la asesoría ganadera?**
2. En una semana típica de trabajo, **¿cómo distribuye su tiempo entre el trabajo de escritorio, el laboratorio y las visitas físicas a los establos o estancias?**
3. Cuando está en el corral trabajando directamente con los animales, **¿qué dispositivo tecnológico utiliza más**, y cuál prefiere usar cuando llega a su oficina para analizar datos o redactar informes médicos?
4. **¿En qué fuentes, canales o comunidades (foros, asociaciones, WhatsApp) se apoya** cuando necesita discutir un caso clínico complejo o investigar sobre nuevas herramientas para su profesión?

---

#### BLOQUE 2: Casos Clínicos y Captura de Parámetros Biométricos (El Algoritmo)

**Objetivo:** Que el veterinario indique los números, variables y reglas médicas que el sistema y el hardware deben medir y procesar.

1. Pensando en las enfermedades infecciosas más críticas de esta zona (como Anaplasmosis, Piroplasmosis o el Complejo Respiratorio), **¿a partir de qué grado exacto de temperatura corporal, o tras cuántas horas de alteración continua, usted determina que un bovino entra en una fase de riesgo inminente?**
2. Descríbame un caso clínico reciente donde un trastorno digestivo o metabólico haya pasado desapercibido por el personal. **Si usted hubiera tenido un registro exacto de la caída en las horas de rumia o inactividad del animal, ¿cómo habría cambiado su intervención?**
3. Desde el punto de vista reproductivo, para detectar un celo silencioso con precisión, **¿qué combinación exacta de datos biométricos (por ejemplo, cruzar picos de actividad física con variaciones de temperatura) le daría la certeza clínica para indicar una inseminación?**
4. Después de aplicar un protocolo de antibióticos fuerte para un cuadro grave, **¿qué parámetros vitales necesita monitorear obligatoriamente en las siguientes 12, 24 o 48 horas para confirmar que el fármaco está funcionando?**

---

#### BLOQUE 3: Captura de Funcionalidades para el Software (La Interfaz)

**Objetivo:** Descubrir los módulos, botones, reportes y alertas que el equipo de desarrollo debe programar en la aplicación web y móvil.

1. Si tuviera nuestra aplicación móvil abierta mientras evalúa a un paciente en la manga, **¿qué datos médicos específicos necesita poder registrar rápidamente en el historial digital de ese animal con un par de clics?** (Ej. diagnóstico, dosis, fármaco, tiempo de retiro de leche/carne).
2. Imagínese que abre la plataforma web en su computadora un lunes por la mañana. Para hacer un análisis epidemiológico rápido de todo un lote, **¿qué gráficos, filtros de búsqueda o cruces de variables necesita ver obligatoriamente en la pantalla principal?**
3. Pensando en la prevención de mortalidad, **¿qué tipo de alertas automáticas le gustaría que el sistema le envíe directamente a su celular como una "Alerta Roja"?** (Ej. notificaciones de partos distócicos, caídas abruptas de temperatura).
4. A la hora de entregar resultados o justificar sus tratamientos ante el dueño de la estancia, **¿qué tipo de reportes automatizados le gustaría que el software genere para que usted pueda exportarlos o imprimirlos directamente?**
5. Para evitar que usted haga un doble trabajo de registro (interoperabilidad), **¿con qué otros sistemas de laboratorios, software de nutrición o entidades estatales de sanidad necesitaría que nuestra plataforma se conecte en el futuro?**

---

Con esta estructura, la entrevista se aborda en tres fases: primero el perfil del profesional, luego la calibración de los parámetros clínicos para los sensores del sistema y, finalmente, la captura de las funcionalidades que el software debe implementar.

### 2.2.2. Registro de entrevistas.

**Video editado de las entrevistas:** Abrir video en SharePoint ([https://tinyurl.com/22n54ovz](https://tinyurl.com/22n54ovz))

**Criterio de asignación por segmento**

Los entrevistados se clasifican según el rol que desempeñan frente a la unidad productiva, y no según su formación profesional. Por esa razón, Meikoll Morell y Grober Barrientos figuran en el Segmento 1 pese a contar con formación en zootecnia y medicina veterinaria: en ambos casos, la entrevista aborda su responsabilidad sobre la gestión, el inventario y la economía del predio en el que trabajan, que es la perspectiva propia de ese segmento. El Segmento 2 reúne a los profesionales que prestan asesoría clínica a establos que no administran.

**Alcance de la evidencia de las entrevistas**

Los resúmenes siguientes registran actividades, problemas, dispositivos y necesidades cuando estos aparecen documentados en la entrevista o en el cuestionario del segmento. Las marcas, influencias de compra y canales preferidos no están consignados de forma sistemática en los resúmenes disponibles; por tanto, no se atribuyen a todos los integrantes del arquetipo. Los datos de una sola persona se identifican por su nombre y no se presentan como rasgos comunes del segmento. Los videos enlazados permiten consultar el contexto y la formulación original de cada respuesta.

#### Segmento 1: Medianos y Grandes Ganaderos

##### Entrevista 1

> **Entrevistado:** Grober Barrientos Talaverano
> **Cargo/Rol:** Médico veterinario zootecnista, encargado de la asistencia técnica en sanidad, manejo, alimentación y registros
> **Ubicación:** Fundo Agropecuario Yavi Yavi, Cusco, Perú
> **Duración:** 00:06:00
> **Entrevistador:** Flor Contreras

![Entrevista a Grober Barrientos Talaverano](assets/images/entrevista-segmento1-grober-barrientos.png)

> **Video: (Inicio: 00:01)** ver segmento en SharePoint ([https://tinyurl.com/22n54ovz](https://tinyurl.com/22n54ovz))

> **Resumen:**
> Grober Barrientos Talaverano, un médico veterinario zootecnista de 34 años. Grober trabaja en el Fundo Agropecuario Yavi Yavi (Cusco), donde se encarga de brindar asistencia técnica en sanidad, manejo, alimentación y registros de ganado. Grober refleja una personalidad bastante asertiva y serena, además de un conocimiento técnico profundo que le claridad respecto a lo que busca en un sistema de monitoreo para el ganado. Durante la charla, Grober explicó que manejan animales criollos, cruzados y un lote de 65 cabezas productoras de leche (Brown Swiss y Fleckvieh). Actualmente utiliza herramientas de gestión como Excel en su computadora para llevar sus registros, aunque enfrenta problemas de conectividad intermitente en la zona de pastoreo. Indicó que la principal causa de mortalidad bovina en su zona es el mal de altura en terneros, cuyos primeros signos suelen evidenciarse en la reducción del movimiento y del tiempo de pastoreo. Por ello, destacó que le sería de gran utilidad una plataforma o sistema que registre y alerte sobre variaciones en las constantes fisiológicas (temperatura, frecuencias) y patrones de desplazamiento, además de permitir el filtrado por categorías, el control de costos e inventario y la generación de reportes e historiales de salud, sanidad y reproducción en tiempo real.

##### Entrevista 2

> **Entrevistado:** Próspero Contreras Flores
> **Cargo/Rol:** Ganadero, propietario de predio ganadero
> **Ubicación:** Región Apurímac, Perú
> **Duración:** 00:06:41
> **Entrevistador:** Flor Contreras

![Entrevista a Próspero Contreras Flores](assets/images/entrevista-segmento1-prospero-contreras.png)

> **Video: (Inicio: 06:01)** ver segmento en SharePoint ([https://tinyurl.com/22n54ovz](https://tinyurl.com/22n54ovz))

> **Resumen:**
> La entrevista realizada a Próspero Contreras Flores, ganadero ubicado en la región de Apurímac, describe la dinámica operativa y los desafíos clave en la gestión de un predio con aproximadamente 100 cabezas de ganado bajo un régimen de pastoreo extensivo. Próspero es un hombre con bastantes años de experiencia y muestra una actitud reflexiva sobre la importancia de la tecnología en la gestión ganadera. Su tono de voz expresa bastante calma y disposición a señalar los aspectos de mejora en este rubro con el uso de una herramienta de gestión adecuada. Actualmente, la administración del inventario y el registro de eventos de salud se realizan de forma rudimentaria mediante hojas de cálculo en Excel y cuadernos de notas, lo que genera vacíos significativos en la trazabilidad médica individual del hato y propicia pérdidas económicas por partos prematuros no supervisados y casos de abigeato (robo de ganado). La infraestructura local presenta una cobertura de internet intermitente (aproximadamente 50% de señal en los potreros), por lo que el productor requiere una herramienta digital multidispositivo (smartphone en campo y laptop en oficina) con capacidad de almacenamiento offline. La solución ideal demandada debe centralizar las fichas clínicas individuales, emitir notificaciones preventivas ajustadas al calendario sanitario andino (vacunación contra carbúnculo, desparasitación), predecir eventos reproductivos (detección de celos y proximidad de partos) y consolidar reportes administrativos de costos y mortalidad bajo un modelo de suscripción anual.

##### Entrevista 3

> **Entrevistado:** Meikoll Morell Bosa Cárdenas
> **Cargo/Rol:** Ingeniero zootecnista, propietario de la Hacienda del Marqués
> **Ubicación:** Pampa de Anta, Cusco, Perú
> **Duración:** 00:05:24
> **Entrevistador:** Flor Contreras

![Entrevista a Meikoll Morell Bosa Cárdenas](assets/images/entrevista-segmento1-meikoll-morell.png)

> **Video: (Inicio: 12:42)** ver segmento en SharePoint ([https://tinyurl.com/22n54ovz](https://tinyurl.com/22n54ovz))

> **Resumen:**
> El ingeniero zootecnista Meikoll Morell Bosa Cárdenas, propietario de la Hacienda del Marqués en Pampa de Anta (Cusco), maneja 40 cabezas de ganado Brown Swiss bajo un régimen semi-extensivo, 20 toros en engorde intensivo y caballos peruanos de paso. Meikoll es un profesional con un carácter bastante energico y elocuente, cuenta con amplio conocimiento en el área. Durante la entrevista mostró adoptar el lenguaje técnico adecuado de su rubro lo que facilitó el registro de preguntas. Su principal canal de control actual consiste en fichas individuales ingresadas en Excel desde su laptop y smartphone, pero identifica que el mayor problema en su gestión es la falta de hábito para registrar las intervenciones inmediatamente después del trabajo de campo, lo que deriva en pérdida de historial clínico y de trazabilidad. Respecto a pérdidas económicas, señala eventos de negligencia en partos y accidentes en equinos, además de vulnerabilidad ante el abigeato, donde la geolocalización por microchip ha fallado por falta de señal en zonas rurales. Para optimizar su toma de decisiones, Meikoll muestra interés en adoptar una solución de software bajo suscripción anual, priorizando que funcione desde el teléfono en modo offline para actualizar datos automáticamente al recuperar conexión. Entre las funciones clave que exige destacan las notificaciones automáticas para campañas sanitarias (dosificación, vacunas y vitaminas), alertas sobre el tiempo y peso estimado en ganadería de engorde, módulos de control de costos por alimento y medicinas por cabeza para evaluar la rentabilidad de los ciclos trimestrales, y la capacidad de adjuntar fotografías de los animales como evidencia del estado físico y respaldo ante robos.

#### Segmento 2: Zootecnistas y Médicos Veterinarios

##### Entrevista 1

> **Entrevistado:** Darwin Carbajal Vilca
> **Cargo/Rol:** Médico veterinario zootecnista, criador de ganado Brown Swiss
> **Ubicación:** Puno, Perú
> **Duración:** 00:21:28
> **Entrevistador:** Flor Contreras

![Entrevista a Darwin Carbajal Vilca](assets/images/entrevista-segmento2-darwin-carbajal.png)

> **Video: (Inicio: 18:07)** ver segmento en SharePoint ([https://tinyurl.com/22n54ovz](https://tinyurl.com/22n54ovz))

> **Resumen:**
> Darwin Carbajal Vilca, médico veterinario zootecnista y criador de ganado vacuno Brown Swiss en Puno con más de 18 años de experiencia en inseminación artificial, administra el fundo "Flores de Coña" con 26 animales de pedigree y PPC. Su jornada combina labor de campo e inspección en establo en primeras y últimas horas del día con trabajo de escritorio e investigación clínica. En su práctica médica identifica desafíos clave como la detección tardía del celo silencioso, reconocible habitualmente al segundo o tercer día por sangrado vulvar, y el impacto fatal de trastornos metabólicos de rápida evolución como el timpanismo o la intoxicación por ensilado alterado. Para optimizar su gestión, requiere una solución tecnológica integrada que permita registrar historias clínicas digitales en campo para validar fármacos administrados, recibir alertas preventivas sobre caídas en la rumia o alzas térmicas, analizar curvas epidemiológicas a nivel de hato y adjuntar evidencia ecográfica para agilizar los registros de gestación ante ASCRIGAR Perú.

##### Entrevista 2

> **Entrevistado:** Eliseo Ramírez Mena
> **Cargo/Rol:** Bachiller en Medicina Veterinaria y Zootecnia
> **Ubicación:** Perú
> **Duración:** 00:17:24
> **Entrevistador:** Flor Contreras

![Entrevista a Eliseo Ramírez Mena](assets/images/entrevista-segmento2-eliseo-ramirez.png)

> **Video: (Inicio: 24:01)** ver segmento en SharePoint ([https://tinyurl.com/22n54ovz](https://tinyurl.com/22n54ovz))

> **Resumen:**
> La entrevista expone la rutina laboral y las necesidades tecnológicas de Eliseo Ramírez Mena, bachiller en Medicina Veterinaria y Zootecnia con dos años de experiencia en el manejo de ganado vacuno y ovino. Eliseo muestra una base sólida de conocimiento respecto a los parámetros de salud y reproductividad deñ ganado. Como alguien con pronto ingreso en el campo de la medicina veterinario, muchos aspectos de su rutina requieren el manejo de aplicaciones en su teléfono inteligente, lo que prueba un manejo eficiente del mismo. Su jornada diaria distribuye la mañana en labores de campo con los animales y la tarde en trabajo de oficina, registro de datos en computadora e impresión de informes para clientes. En el aspecto sanitario y reproductivo, Eliseo enfatiza que los tratamientos dependen del diagnóstico clínico observable, como la variación de temperatura, el apetito, la alteración de rumiación o conductas en celo, y del apoyo de colegas en casos complejos, así como del uso de intervenciones inmediatas ante emergencias metabólicas como el timpanismo gaseoso. Frente a la propuesta de un software y una aplicación móvil veterinaria, el especialista prioriza la utilidad de sincronizar imágenes de ecógrafos para evaluar la gestación en tiempo real desde el celular, la emisión de alertas rojas automáticas cuando decaen las constantes vitales del animal, la automatización de reportes ejecutivos para sustituir el llenado manual en Excel, y la integración de módulos nutricionales que identifiquen deficiencias minerales o de nutrientes en la dieta del ganado.

##### Entrevista 3

> **Entrevistado:** Dionisio Rodríguez
> **Cargo/Rol:** Zootecnista
> **Ubicación:** Chile (con trabajo de campo en Perú)
> **Duración:** 00:16:31
> **Entrevistador:** Flor Contreras

![Entrevista a Dionisio Rodríguez](assets/images/entrevista-segmento2-dionisio-rodriguez.png)

> **Video: (Inicio: 29:32)** ver segmento en SharePoint ([https://tinyurl.com/22n54ovz](https://tinyurl.com/22n54ovz))

> **Resumen:**
> Esta entrevista explora las necesidades operativas y tecnológicas de Dionisio Rodríguez, zootecnista chileno con trabajo de campo en Perú, para guiar el desarrollo de la plataforma ganadera ICHU de SmartFarm. Indica que lleva unos pocos años ejerciendo como zootecnista a partir de su pasión por los animales y su reproducción. Rodríguez explica que pasa la mayor parte de su jornada en el terreno registrando datos y fotos en su teléfono inteligente, reservando la computadora de oficina para la elaboración de informes. Para la detección temprana de enfermedades metabólicas o infecciosas y la identificación de celos silenciosos, fundamenta su diagnóstico en el seguimiento continuo de la temperatura corporal, la inactividad, la disminución de la rumia y los cambios de conducta, recurriendo a exámenes de laboratorio solo en casos complejos. En cuanto al diseño de la plataforma, solicita alertas automáticas ante fiebres o partos, reportes exportables a Excel o PDF, e integración directa con equipos de campo como ecógrafos portátiles y software de nutrición para evitar la duplicidad en el registro de información.

**Trazabilidad de los dispositivos y herramientas hacia las User Personas**

La siguiente relación distingue lo documentado en cada resumen de los atributos que todavía no pueden asignarse al arquetipo del segmento.

| Participante | Dispositivos y herramientas documentados en su resumen | Alcance para la construcción del arquetipo |
|---|---|---|
| Próspero Contreras | Smartphone en campo, laptop en oficina, Excel y cuadernos. | Respalda el trabajo entre campo y oficina; no establece el sistema operativo ni el navegador principal. |
| Meikoll Morell | Laptop y smartphone para fichas en Excel. | Coincide con Próspero en esos dispositivos; la falta de hábito de registro y el caso del microchip se conservan como evidencia individual. |
| Grober Barrientos | Excel en computadora y conectividad intermitente en pastoreo. | No se identifica el tipo de computadora ni se documenta el uso de cuatro dispositivos. |
| Darwin Carbajal | Trabajo de campo y de escritorio; solicitud de adjuntar evidencia ecográfica para registros de gestación ante ASCRIGAR Perú. | El resumen no precisa dispositivos o sistema operativo. ASCRIGAR corresponde a este caso y finalidad, no a una influencia de compra común del segmento. |
| Eliseo Ramírez | Registros en computadora e informes impresos; solicitud de consultar imágenes ecográficas desde el celular. | Se distingue la práctica actual de la función deseada; no se atribuye una plataforma móvil ya utilizada para esa integración. |
| Dionisio Rodríguez | Smartphone para datos y fotos en campo, computadora de oficina para informes. | Documenta esos dispositivos, pero no un sistema operativo, navegador o canal social preferido. |

Los resultados agregados de los cuestionarios se presentan en 2.2.3 y no se asignan a un entrevistado específico sin identificación de su respuesta. En el cuestionario del Segmento 2, las tres respuestas sobre el dispositivo principal se reparten entre smartphone, laptop y papel; esto no equivale a que cada participante utilice los cuatro dispositivos dibujados en la ficha. Faltan respuestas comparables sobre sistemas operativos, navegadores principales, marcas e influencias de compra y canales preferidos. Estos campos requieren validación antes de presentarse como características habituales del segmento.

### 2.2.3. Análisis de entrevistas.

#### Análisis de entrevistas del Segmento 1: Medianos y Grandes Ganaderos

Para complementar las entrevistas en profundidad del Segmento 1, se aplicó un cuestionario estructurado a 2 ganaderos (propietarios y administradores de estancias de Apurímac y Cusco) con el objetivo de cuantificar su contexto operativo, sus pérdidas económicas actuales y sus preferencias sobre el modelo de negocio y las funcionalidades del software. A continuación, se presenta el análisis porcentual de los resultados y, posteriormente, el análisis cualitativo según los resúmenes de las entrevistas realizadas.

##### Análisis porcentual según los gráficos del cuestionario

**1. ¿Qué herramientas utiliza actualmente para el control del inventario de animales? (2 respuestas)**

![Herramientas utilizadas para el control del inventario](assets/images/analisis-segmento1-herramientas.png)

*Figura 1. Elaboración propia a partir de los datos recolectados. Startup SmartFarm.*

Cuestionario ampliado del Segmento 1: Ganaderos ([https://tinyurl.com/2bxh784s](https://tinyurl.com/2bxh784s))

Como muestra el gráfico, el **50% utiliza hojas de cálculo (Excel/Google Sheets) y el 50% restante cuaderno o registro manual**; ningún ganadero emplea software especializado ganadero ni aplicación móvil. Este patrón confirma que el 100% del segmento digitaliza de forma rudimentaria o no digitaliza nada, sin ningún uso de herramientas especializadas. Además, el registro se divide entre lo semi-digital (Excel) y lo totalmente análogo (cuaderno), lo que genera trazabilidad fragmentada. En consecuencia, ICHU debe incorporar una **migración simple desde Excel y cuadernos hacia la ficha digital por animal**, sin exigir competencias técnicas avanzadas a usuarios acostumbrados a registrar en papel.

**2. Si existiera una plataforma web que centralizara el historial de salud, ubicación y alertas de cada animal, ¿qué tan útil sería para su negocio? (2 respuestas)**

![Utilidad percibida de la plataforma centralizada](assets/images/analisis-segmento1-utilidad-plataforma.png)

*Figura 2. Elaboración propia a partir de los datos recolectados. Startup SmartFarm.*

Cuestionario ampliado del Segmento 1: Ganaderos ([https://tinyurl.com/2bxh784s](https://tinyurl.com/2bxh784s))

El gráfico evidencia una validación total de la propuesta de valor: el **100% de los ganaderos calificó la plataforma centralizada como "Muy útil, mejoraría significativamente mis procesos"**, sin ninguna respuesta neutra o negativa. Este dato porcentual respalda directamente el núcleo del producto ICHU: la centralización del historial de salud, la ubicación y las alertas por animal en un único sistema, frente a la dispersión actual en Excel y cuadernos que los propios entrevistados identifican como su principal debilidad de gestión.

##### Contexto operativo del segmento (respuestas complementarias)

Las respuestas del cuestionario complementan el perfil del segmento con los siguientes datos cuantificados:

- **Escala y manejo:** el 100% maneja entre **51 y 200 cabezas** (coincide con los 100 cabezas de Próspero y las 40 + 20 de engorde de Meikoll); el **50% trabaja bajo pastoreo extensivo y el 50% bajo régimen mixto**, confirmando que el modo offline es obligatorio.
- **Conectividad:** el **100% califica la conectividad en las zonas de pastoreo como regular (solo en algunas zonas)**, evidencia directa que sostiene la conectividad híbrida LoRaWAN/celular con sincronización retrasada del collar.
- **Pérdidas económicas:** el **100% reportó pérdidas del 5-10% del valor del hato en el último año** por enfermedades no detectadas a tiempo, y el **100% califica el abigeato como un problema frecuente y costoso**. Ambos datos dimensionan el retorno esperado de la solución.
- **Modelo de suscripción:** el **100% prefiere el pago anual con tarifa fija**, validando el modelo comercial definido en la estrategia 3 y coincidiendo con lo declarado por Próspero y Meikoll en sus entrevistas.
- **Notificaciones deseadas:** el **100% desea recibir todas las notificaciones automáticas** (alertas de temperatura anormal, recordatorios de revacunación, alertas de parto y celo, avisos de cuarentena), con énfasis explícito en las alertas de parto y celo como grupo prioritario.
- **Tablero de control:** las preferencias se dividen entre **inventario actualizado y movimientos (50%)** y **horas de actividad y alertas de celo (50%)**; ambas vías corresponden a los contextos de Gestión del Hato y Monitoreo Biométrico.
- **Monitoreo individual vs. por lotes:** el segmento valora ambos enfoques (50% menciona monitoreo por lote, 50% monitoreo individual), concluyendo que el monitoreo individual "ayuda a tomar mejores decisiones y corregir en el momento oportuno": la individualización por animal es la apuesta correcta del producto.

##### Análisis cualitativo según los resúmenes de entrevistas

El cruce de los tres resúmenes del Segmento 1 (Próspero Contreras Flores, Meikoll Morell Bosa Cárdenas y Grober Barrientos Talaverano) revela un patrón de necesidades convergente:

- **Registro fragmentado y sin trazabilidad.** Los tres trabajan con Excel y/o cuadernos (Próspero: Excel + cuaderno; Meikoll: fichas individuales en Excel; Grober: Excel en computadora), coincidiendo con el gráfico de herramientas (50% Excel / 50% cuaderno). Próspero lo resume: los servicios veterinarios son "puntuales" y no existe ficha clínica por animal; Meikoll identifica que el problema raíz es la **falta de hábito de registro** inmediato tras el trabajo de campo, lo que deriva en pérdida de historial clínico.

- **Conectividad intermitente como restricción de diseño.** Próspero reporta señal en solo el 50% de sus potreros, Grober enfrenta conectividad intermitente en la zona de pastoreo, y Meikoll, aunque tiene buena señal con Movistar y Claro, experimentó fallas de señal durante la propia entrevista en Apurímac. El 100% del cuestionario lo confirma ("regular, solo en algunas zonas"). Los tres exigen que la aplicación funcione **offline y sincronice automáticamente al recuperar conexión**.

- **Alertas sanitarias y reproductivas como demanda común.** Próspero pide notificaciones ajustadas al calendario sanitario andino (carbúnculo, desparasitación) y predicción de partos con una semana de anticipación; Meikoll exige notificaciones para campañas sanitarias y alertas de tiempo/peso en engorde; Grober solicita alertas sobre variaciones de constantes fisiológicas y patrones de desplazamiento (el mal de altura en terneros, primera causa de mortalidad en su zona, se manifiesta primero como reducción del movimiento y del tiempo de pastoreo). El cuestionario lo cuantifica: el 100% desea el paquete completo de notificaciones, con prioridad en parto y celo.

- **Abigeato y geolocalización como dolor patrimonial.** Próspero ha sufrido robos de 15-20 ganados y lo califica de "golpe a la ganadería"; Meikoll no pudo recuperar 2 de 3 caballos robados pese a tener microchip por falta de señal rural; ambos ganaderos del cuestionario lo califican como problema "frecuente y costoso". Las respuestas abiertas proponen la solución: GPS en el animal con monitoreo automático de movimiento, reemplazando al microchip que ya falló por falta de señal.

- **Control de costos y rentabilidad como lenguaje gerencial.** Próspero pide presupuesto por campaña sanitaria y reportes mensuales de muertes, enfermos, celos e inseminaciones; Meikoll exige control de costo por kilo y balance trimestral del engorde; Grober solicita control de costos e inventario con filtrado por categorías. Los reportes ejecutivos deben incluir producción de leche por día, consumo de alimento y constantes fisiológicas, según las respuestas abiertas.

- **Suscripción anual y valor estratégico.** Los tres aceptan el modelo de suscripción, que Próspero y Meikoll declaran expresamente anual, y el 100% del cuestionario ratifica "pago anual con tarifa fija". Grober añade el potencial de certificaciones (mejoramiento genético por PPC y su base de datos) y mejoramiento genético a partir de registros multi-generacionales (días abiertos, índice de fertilidad, producción per cápita anual), que amplían el valor del sistema más allá del monitoreo diario.

En síntesis, las entrevistas y el cuestionario respaldan, dentro de esta muestra, la necesidad de una ficha individual, operación sin cobertura, alertas sanitarias y reproductivas, ubicación, control de costos y una opción de pago anual. Estos resultados describen necesidades y preferencias declaradas; no validan todavía la eficacia de la solución ni la reducción de pérdidas.

##### Trazabilidad de evidencia a requisitos

La tabla separa patrones compartidos, respuestas del cuestionario y casos individuales. Los identificadores de historias enlazan con el Product Backlog del Capítulo III; la asociación expresa una necesidad respaldada, no una validación de que la funcionalidad ya produzca el beneficio esperado.

| Fuente | Hallazgo documentado | Necesidad derivada | Arquetipo | Historias relacionadas |
|---|---|---|---|---|
| Próspero, Meikoll y Grober; cuestionario Segmento 1 (2 respuestas) | Registros en Excel/cuadernos y pérdida de trazabilidad; ambos cuestionarios reportan uso de registros manuales o hojas de cálculo | Identificar al animal y consultar una ficha con sus datos productivos y eventos | Cesar Flores; patrón recurrente del segmento | US-06, US-07, US-21 |
| Próspero (50% de cobertura declarada en potreros), Meikoll y Grober; cuestionario Segmento 1 (2/2: cobertura regular) | La conectividad es irregular en zonas de pastoreo | Registrar y conservar información sin cobertura, con sincronización posterior | Cesar Flores; patrón recurrente, con distinta intensidad por predio | US-22, TS-03, TS-04, TS-06 |
| Próspero y Meikoll; cuestionario Segmento 1 (2/2 reportan abigeato frecuente y costoso) | Robos reportados por Próspero; Meikoll relata que el microchip no permitió recuperar dos de tres caballos robados por falta de señal | Consultar ubicación y recibir aviso de salida del área; el caso del microchip es evidencia individual de Meikoll | Cesar Flores; la experiencia de robo concreta es individual | US-15, US-17, US-20 |
| Grober | En su zona, la reducción de movimiento y pastoreo puede preceder signos de mal de altura en terneros | Consultar actividad y recibir una alerta que apoye la inspección clínica | Cesar Flores y Leonardo Rosales como necesidad compartida de vigilancia; el caso de altura es específico de Grober | US-13, US-16, TS-01 |
| Darwin | El celo silencioso suele reconocerse con dos o tres días de retraso; también solicita alertas por cambios de rumia y temperatura | Detectar patrones compatibles con celo y revisar evidencia biométrica | Leonardo Rosales; observación específica de Darwin que requiere validación clínica | US-18, US-14 |
| Darwin, Eliseo y Dionisio; cuestionario Segmento 2 (3 respuestas) | Los tres solicitan seguimiento de variables biométricas; el cuestionario indica uso de smartphone, laptop o papel (una respuesta por categoría) | Consultar el historial biométrico y registrar información desde los medios disponibles para el profesional | Leonardo Rosales; necesidad recurrente, dispositivos heterogéneos | US-14, US-21, US-22 |
| Darwin, Eliseo y Dionisio | Solicitan alertas ante anomalías; Eliseo y Dionisio además describen reportes e integración con equipos o herramientas externas | Recibir y atender alertas, exportar información y definir interoperabilidad pendiente | Leonardo Rosales; cada integración concreta debe confirmarse con usuarios y priorizarse | US-16, US-19, US-31; integración externa pendiente de HU |

**Límites de la muestra.** Se entrevistó a tres participantes por segmento y se aplicaron cuestionarios a dos ganaderos y tres profesionales. Por ello, las coincidencias se consideran patrones cualitativos de esta muestra, no estimaciones representativas de todos los ganaderos o veterinarios. La reducción de mortalidad, el ahorro de tiempo y la aceptación o renovación de una suscripción son resultados esperados que deben validarse en un piloto; no son resultados comprobados por estas entrevistas.

#### Análisis de entrevistas del Segmento 2: Zootecnistas y Médicos Veterinarios

Para complementar las entrevistas en profundidad del Segmento 2, se aplicó un cuestionario estructurado a 3 profesionales del sector (zootecnistas y médicos veterinarios) con el objetivo de cuantificar sus prácticas diagnósticas, sus umbrales clínicos de referencia y sus preferencias sobre las funcionalidades del software. A continuación, se presenta el análisis porcentual de los resultados y, posteriormente, el análisis cualitativo según los resúmenes de las entrevistas realizadas.

##### Análisis porcentual según los gráficos del cuestionario

**1. ¿Qué dispositivos informáticos utiliza habitualmente para registrar el historial de tratamientos y diagnósticos? (3 respuestas)**

![Dispositivos utilizados para registrar historiales](assets/images/analisis-segmento2-dispositivos.png)

*Figura 3. Elaboración propia a partir de los datos recolectados. Startup SmartFarm.*

Cuestionario ampliado del Segmento 2: Zootecnistas y médicos veterinarios ([https://tinyurl.com/28t73nqb](https://tinyurl.com/28t73nqb))

Como muestra el gráfico, los dispositivos de registro se distribuyen de forma exactamente equitativa: **33.3% smartphone, 33.3% laptop y 33.3% registros en papel únicamente**. Ningún profesional emplea tablet ni computadora de escritorio como dispositivo principal. Este patrón porcentual evidencia que un tercio del segmento aún no digitaliza su información clínica, mientras que los dos tercios restantes dependen de dispositivos móviles o portátiles. En consecuencia, la plataforma ICHU debe responder con una **aplicación móvil de primera clase** (compatible con smartphones y laptops) que además ofrezca un proceso de migración simple para trasladar los registros en papel hacia el sistema digital centralizado.

**2. ¿Qué tan confiables son los registros manuales de vacunación, inseminación y medicamentos en los establos que asesora? (3 respuestas)**

![Confiabilidad de los registros manuales](assets/images/analisis-segmento2-confiabilidad-registros.png)

*Figura 4. Elaboración propia a partir de los datos recolectados. Startup SmartFarm.*

Cuestionario ampliado del Segmento 2: Zootecnistas y médicos veterinarios ([https://tinyurl.com/28t73nqb](https://tinyurl.com/28t73nqb))

Según el gráfico, el **66.7% de los entrevistados califica los registros manuales como moderadamente confiables (50-70% de precisión)** y el **33.3% restante como confiables (70-90% de precisión)**. Es destacable que **ningún profesional los considera muy confiables ni confiables al 100%**, es decir, el 100% reconoce un margen de error de al menos un 10% en la información clínica que hoy sostiene sus decisiones. Este dato porcentual valida directamente la propuesta de valor de ICHU: historias clínicas digitales con trazabilidad completa (qué se aplicó, cuándo y quién), reduciendo riesgos ya observados por los propios entrevistados, como intoxicaciones por dosificación repetida o fallos de preñez por vacunación omitida.

**3. ¿Qué parámetro cuantitativo continuo desearía conocer del animal pero que actualmente le es imposible medir de forma manual? (3 respuestas)**

![Parámetros cuantitativos deseados](assets/images/analisis-segmento2-parametros.png)

*Figura 5. Elaboración propia a partir de los datos recolectados. Startup SmartFarm.*

Cuestionario ampliado del Segmento 2: Zootecnistas y médicos veterinarios ([https://tinyurl.com/28t73nqb](https://tinyurl.com/28t73nqb))

El gráfico evidencia un resultado unánime: el **100% de los entrevistados seleccionó "Todos los anteriores"**, es decir, desea medir de forma continua los **ciclos de rumia y alimentación, la frecuencia cardíaca y respiratoria, los niveles de actividad física diaria y la temperatura corporal continua 24/7**. La unanimidad absoluta del segmento convierte a estos cuatro parámetros en el **núcleo obligatorio de telemetría biométrica** que el collar inteligente de ICHU debe capturar, ya que constituyen variables que la observación manual no logra registrar de manera precisa y sostenida.

##### Análisis cualitativo según los resúmenes de entrevistas

El cruce de los tres resúmenes del Segmento 2 (Darwin Carbajal Vilca, Eliseo Ramírez Mena y Dionisio Rodríguez) revela un patrón de necesidades convergente:

- **Trabajo bifásico campo-oficina.** Los tres profesionales dividen su jornada: labor de campo e inspección en establo en primeras y últimas horas del día (Darwin), mañana en campo y tarde en oficina con registro en computadora (Eliseo), y registro en el terreno desde el smartphone reservando la oficina para informes (Dionisio). Esto confirma el hallazgo porcentual de dispositivos y exige que ICHU ofrezca **sincronización bidireccional entre la app móvil en campo y la plataforma web de oficina**.

- **Diagnóstico basado en variables continuas no medibles a mano.** Darwin fundamenta su práctica en la detección de celo silencioso (reconocido tardíamente al segundo o tercer día por sangrado vulvar) y en trastornos metabólicos de evolución fatal como el timpanismo; Eliseo diagnostica según la variación de temperatura, apetito, alteración de rumiación y conductas de celo; Dionisio realiza seguimiento continuo de temperatura corporal, inactividad, disminución de rumia y cambios de conducta. Los tres coinciden con el gráfico de parámetros (100% "Todos los anteriores"): **necesitan monitoreo biométrico continuo** que anticipe lo que hoy solo detectan visualmente cuando el cuadro ya está avanzado.

- **Alertas preventivas como prioridad compartida.** Darwin pide alertas por caídas de rumia o alzas térmicas; Eliseo solicita alertas rojas automáticas cuando decaen las constantes vitales; Dionisio requiere alertas ante fiebres o partos. Esta triple convergencia posiciona al **motor de alertas automáticas** como la funcionalidad más crítica del producto para este segmento, preferiblemente inmediata para cuadros graves y con resumen diario para cambios menores.

- **Historia clínica digital centralizada.** Darwin necesita registrar historias clínicas digitales en campo para validar fármacos administrados; Eliseo quiere sustituir el llenado manual en Excel por reportes automáticos; Dionisio busca evitar la duplicidad de registros. Los tres coinciden con el dato de confiabilidad (66.7% solo moderada) en que **el registro fragmentado y manual es el principal dolor operativo** del segmento.

- **Integración con equipos de campo y entidades oficiales.** Darwin requiere adjuntar evidencia ecográfica para agilizar registros de gestación ante ASCRIGAR Perú; Eliseo prioriza sincronizar imágenes de ecógrafos para evaluar gestación en tiempo real desde el celular; Dionisio pide integración directa con ecógrafos portátiles y software de nutrición. Además, Eliseo y Dionisio coinciden en demandar **módulos nutricionales** que identifiquen deficiencias minerales o de nutrientes. Esta convergencia define un requisito arquitectónico clave para la **API RESTful de ICHU**: interoperabilidad con dispositivos de diagnóstico por imagen y sistemas externos de nutrición.

- **Reportes ejecutivos comparativos.** Dionisio solicita reportes exportables a Excel o PDF y Eliseo automatización de reportes ejecutivos; ambos coinciden con la necesidad expresada en el cuestionario de graficar enfermedades por establecimiento, mortalidad y problemas reproductivos por mes, lo que sustenta el **módulo de analítica del ICHU Web Application**.

En síntesis, las entrevistas y el cuestionario respaldan en esta muestra el interés por consultar variables biométricas y recibir alertas, y documentan solicitudes de historial digital, soporte en campo y reportes. Las peticiones de ecógrafos, nutrición y otras integraciones se atribuyen a participantes concretos; la API abierta y la eficacia clínica no quedan validadas por estas entrevistas y requieren historias de backlog y validación posteriores.

## 2.3. Needfinding.

En esta sección se consolidan y sintetizan los hallazgos cualitativos y cuantitativos obtenidos durante la fase de investigación de campo, entrevistas en profundidad y análisis competitivo. El proceso de Needfinding nos permite transformar los datos brutos recolectados de los actores del sector ganadero en artefactos visuales y estructurados de diseño de experiencia de usuario (UX), garantizando que el desarrollo del ecosistema de software ICHU responda de manera directa a las necesidades reales, dolores operativos y metas estratégicas de cada perfil de usuario.

### 2.3.1. User Personas.

**Introducción y método de construcción**

Para la construcción de los arquetipos de usuario, el equipo procesó la información recolectada en la fase de entrevistas y el análisis del mercado ganadero. Se identificaron dos patrones de comportamiento que representan a los dos segmentos objetivo definidos para el ecosistema de software ICHU.

Del análisis de entrevistas se tomaron como insumo principal las herramientas de registro que utiliza cada participante, el estado de la conectividad en sus zonas de trabajo, las pérdidas económicas declaradas, los dispositivos mencionados y los parámetros que necesita conocer del animal. Los cuestionarios complementan esta información con resultados agregados de cada muestra, incluidas las preferencias de contratación cuando se preguntaron. El análisis competitivo aporta contexto sobre ofertas existentes, pero no demuestra por sí mismo las preferencias, marcas, dispositivos ni expectativas de los entrevistados.

Las personas son arquetipos de segmento construidos a partir de tres entrevistas por segmento, no retratos de un participante concreto. Se consideran **patrones comunes** los temas que aparecen en varias entrevistas o que coinciden con el cuestionario; se mantienen como **evidencia individual** los sucesos y condiciones atribuidos a una sola persona; y se consideran **supuestos por validar** las preferencias que no aparecen directamente en las fuentes. Por ejemplo, los robos relatados por Próspero y la experiencia con microchip de Meikoll son casos individuales, mientras que el cuestionario respalda que ambos participantes consideran frecuente y costoso el abigeato. La composición de la muestra es pequeña y no permite afirmar que estos rasgos describan a todo el mercado.

**Segmento 1: Medianos y Grandes Ganaderos.** Propietarios y administradores de unidades productivas, enfocados en la rentabilidad, la reducción de pérdidas por mortalidad y abigeato, y la toma de decisiones a partir de indicadores del hato.

**User Persona 1: Cesar Flores**

Arquetipo del Segmento 1, construido a partir de los patrones identificados en las entrevistas a Próspero Contreras, Meikoll Morell y Grober Barrientos.

![User Persona Cesar Flores, arquetipo del Segmento 1](assets/images/persona-segmento1-cesar-flores.png)

Ficha de User Persona de Cesar Flores en UXPressia ([https://tinyurl.com/2yd9eme2](https://tinyurl.com/2yd9eme2))

La ficha diferencia el uso de smartphone y laptop declarado por Próspero y Meikoll de la configuración de cuatro dispositivos que no está respaldada como patrón común. El rango de 51–200 cabezas y la preferencia por pago anual fijo corresponden a las dos respuestas del cuestionario del segmento, no a todos los predios entrevistados.

**Segmento 2: Zootecnistas y Médicos Veterinarios.** Profesionales orientados al monitoreo biométrico continuo, al diagnóstico clínico temprano y a la revisión de historiales de salud consolidados.

**User Persona 2: Leonardo Rosales**

Arquetipo del Segmento 2, construido a partir de los patrones identificados en las entrevistas a Darwin Carbajal, Eliseo Ramírez y Dionisio Rodríguez.

![User Persona Leonardo Rosales, arquetipo del Segmento 2](assets/images/persona-segmento2-leonardo-rosales.png)

Ficha de User Persona de Leonardo Rosales en UXPressia ([https://tinyurl.com/266yhp4g](https://tinyurl.com/266yhp4g))

La ficha sintetiza las entrevistas a Darwin, Eliseo y Dionisio y explicita la variedad de herramientas registrada en las tres respuestas del cuestionario. ASCRIGAR Perú se mantiene como evidencia individual de Darwin para registros de gestación; no se generaliza como marca o influencia compartida. Los objetivos y motivaciones expresan resultados deseados, no efectos clínicos ya comprobados de ICHU.

Ambas fichas fueron elaboradas en UXPressia y contemplan datos demográficos, biografía, personalidad, habilidades, objetivos, frustraciones, tecnología, marcas e influencias y canales. Los atributos sin respaldo en varias entrevistas o cuestionarios deben interpretarse como hipótesis de diseño pendientes de validación, no como rasgos confirmados del arquetipo.

**Lectura de los campos pendientes de validación**



| Campo de las fichas | Evidencia disponible y corrección de interpretación | Validación pendiente |
|---|---|---|
| Dispositivos y sistemas operativos | Próspero y Meikoll mencionan smartphone y laptop; Grober menciona computadora. En el Segmento 2, el cuestionario distribuye el dispositivo principal entre smartphone, laptop y papel. Los cuatro dispositivos y los logotipos de Android o Windows no constituyen una configuración común confirmada. | Identificar por participante los dispositivos realmente usados y su sistema operativo; retirar de futuras exportaciones los que no tengan respaldo. |
| Navegadores | Las fichas señalan estos iconos como pendientes de validación. Los resúmenes no establecen una preferencia compartida por Chrome, Edge o Firefox. | Registrar el navegador principal de cada participante antes de seleccionar los iconos del arquetipo. |
| Marcas e influencias de Cesar | Zoetis, MSD Animal Health, AGALEP y las ferias mostradas en la imagen no quedan sustentadas como preferencias comunes en los resúmenes disponibles. Tampoco se confirma de manera comparable la influencia de consultores en las decisiones de compra. | Preguntar qué marcas usa cada participante y quién o qué influye en sus decisiones; conservar solo los patrones respaldados e identificar las menciones individuales. |
| Marcas e influencias de Leonardo | ASCRIGAR Perú está vinculada al caso de Darwin y a registros de gestación. Las consultas a colegas aparecen en las entrevistas; no prueban preferencias compartidas por marcas, universidades o plataformas académicas. | Diferenciar entidades relacionadas con un trámite de fuentes de influencia o preferencias de compra y contrastarlas entre participantes. |
| Canales de ambos arquetipos | PC y laptop son dispositivos de acceso, no canales de comunicación por sí mismos. Los iconos de Facebook, WhatsApp o correo en las fichas no demuestran que esos sean los canales preferidos del segmento. El uso de un smartphone tampoco prueba una aplicación de mensajería concreta. | Documentar por qué medio se comunica o informa cada participante, con quién y para qué actividad; separar el canal del dispositivo utilizado. |
| Demografía y habilidades | Los nombres de las personas son sintéticos y las edades y escalas de habilidades de las fichas son ilustrativas. Una localización o experiencia individual no representa automáticamente al segmento completo. | No utilizar esos valores como estadísticas del segmento; confirmar cualquier atributo que se vaya a tratar como patrón de la muestra. |

Estos límites también se aplican a la lectura de los Empathy Maps de 2.3.4: ningún dato pendiente de las User Personas debe trasladarse al mapa como un hecho confirmado. La actualización de las dos fichas no implica una nueva exportación de los mapas de empatía.

### 2.3.2. User Task Matrix.

La User Task Matrix compara las actividades actuales de **Cesar Flores**, administrador ganadero del Segmento 1, y **Leonardo Rosales**, médico veterinario del Segmento 2. Las tareas sintetizan las jornadas descritas en las seis entrevistas y se expresan mediante una acción y su objeto de trabajo: inventario ganadero, identificación individual, evaluación sanitaria, atención clínica o control económico. Pueden ejecutarse mediante observación directa, registros de campo y hojas de cálculo, sin depender de ICHU.

La **frecuencia** indica la recurrencia de la actividad: alta, habitual; media, periódica o según el caso; baja, ocasional. La **importancia** expresa el impacto de omitirla o ejecutarla incorrectamente sobre los objetivos del arquetipo: alto, medio o bajo. Son valoraciones cualitativas de síntesis, no mediciones estadísticas. **No aplica** identifica una responsabilidad que no se atribuye a ese arquetipo en esta matriz; no equivale a importancia baja.

<table>
  <colgroup>
    <col style="width: 40%;"/>
    <col style="width: 15%;"/>
    <col style="width: 15%;"/>
    <col style="width: 15%;"/>
    <col style="width: 15%;"/>
  </colgroup>
  <thead>
    <tr>
      <th rowspan="2" scope="col" align="left">Tarea del usuario</th>
      <th colspan="2" scope="colgroup" align="center">Cesar Flores<br/>Administrador ganadero</th>
      <th colspan="2" scope="colgroup" align="center">Leonardo Rosales<br/>Médico veterinario</th>
    </tr>
    <tr>
      <th scope="col" align="center">Frecuencia</th>
      <th scope="col" align="center">Importancia</th>
      <th scope="col" align="center">Frecuencia</th>
      <th scope="col" align="center">Importancia</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row" align="left">Conciliar el inventario ganadero mediante el conteo físico del hato en los potreros.</th>
      <td align="center">Alta</td><td align="center">Alta</td><td align="center">Baja</td><td align="center">Baja</td>
    </tr>
    <tr>
      <th scope="row" align="left">Evaluar signos conductuales de alteración sanitaria o reproductiva durante el pastoreo.</th>
      <td align="center">Alta</td><td align="center">Alta</td><td align="center">Alta</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Medir las constantes fisiológicas de un animal con sospecha de alteración sanitaria.</th>
      <td align="center">Media</td><td align="center">Alta</td><td align="center">Alta</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Documentar eventos sanitarios y reproductivos con identificación del animal y fecha.</th>
      <td align="center">Media</td><td align="center">Alta</td><td align="center">Alta</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Revisar los antecedentes clínicos, sanitarios y reproductivos de un animal.</th>
      <td align="center">Media</td><td align="center">Alta</td><td align="center">Alta</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Verificar la identidad individual del bovino mediante su número de arete.</th>
      <td align="center">Alta</td><td align="center">Media</td><td align="center">Alta</td><td align="center">Media</td>
    </tr>
    <tr>
      <th scope="row" align="left">Coordinar la atención veterinaria según el caso y la disponibilidad del profesional.</th>
      <td align="center">Media</td><td align="center">Alta</td><td align="center">No aplica</td><td align="center">No aplica</td>
    </tr>
    <tr>
      <th scope="row" align="left">Organizar el desplazamiento entre unidades productivas para realizar atenciones veterinarias.</th>
      <td align="center">Baja</td><td align="center">Baja</td><td align="center">Alta</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Programar y ejecutar campañas de prevención sanitaria según el calendario del hato.</th>
      <td align="center">Baja</td><td align="center">Alta</td><td align="center">Media</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Realizar intervenciones terapéuticas o procedimientos de inseminación según indicación veterinaria.</th>
      <td align="center">Baja</td><td align="center">Alta</td><td align="center">Alta</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Evaluar la evolución clínica posterior a una intervención terapéutica.</th>
      <td align="center">Media</td><td align="center">Alta</td><td align="center">Alta</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Localizar un bovino extraviado mediante la inspección de las zonas de pastoreo.</th>
      <td align="center">Baja</td><td align="center">Alta</td><td align="center">Baja</td><td align="center">Baja</td>
    </tr>
    <tr>
      <th scope="row" align="left">Registrar los costos operativos de alimentación, medicamentos e insumos por ciclo productivo.</th>
      <td align="center">Media</td><td align="center">Alta</td><td align="center">Baja</td><td align="center">Media</td>
    </tr>
    <tr>
      <th scope="row" align="left">Elaborar informes sanitarios o productivos para sustentar decisiones de manejo.</th>
      <td align="center">Baja</td><td align="center">Media</td><td align="center">Alta</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Verificar las fechas y pautas del calendario sanitario aplicable a la región.</th>
      <td align="center">Baja</td><td align="center">Media</td><td align="center">Media</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Interpretar hallazgos ecográficos para evaluar el estado de gestación.</th>
      <td align="center">No aplica</td><td align="center">No aplica</td><td align="center">Media</td><td align="center">Alta</td>
    </tr>
    <tr>
      <th scope="row" align="left">Analizar los costos y resultados del ciclo productivo para estimar su rentabilidad.</th>
      <td align="center">Baja</td><td align="center">Alta</td><td align="center">Baja</td><td align="center">Baja</td>
    </tr>
  </tbody>
</table>

**Lectura del cuadro**

Para **Cesar Flores**, la conciliación del inventario y la evaluación del comportamiento animal combinan frecuencia e importancia altas. La coordinación veterinaria, la localización de animales extraviados y el control económico conservan importancia alta, aunque su ejecución es periódica u ocasional.

Para **Leonardo Rosales**, destacan la medición de constantes, la revisión de antecedentes, las intervenciones terapéuticas, el seguimiento clínico y los informes sanitarios, todos con frecuencia e importancia altas. La interpretación ecográfica tiene frecuencia media e importancia alta y corresponde al ámbito profesional del arquetipo.

La principal **coincidencia** es la evaluación del comportamiento animal, con frecuencia e importancia altas para ambos. Documentar eventos y revisar antecedentes también tiene importancia alta en los dos perfiles, pero su frecuencia es media para Cesar y alta para Leonardo. La identificación por arete es frecuente en ambos y tiene importancia media en esta valoración.

Las **diferencias** se concentran en la responsabilidad operativa: Cesar prioriza inventario, costos y rentabilidad; Leonardo, atención clínica, informes y desplazamiento entre predios. La información de campo debe acompañar el trabajo de ambos perfiles; la movilidad entre unidades productivas tiene mayor peso para el veterinario, pero no convierte la portabilidad en una necesidad exclusiva de ese segmento.

### 2.3.3. User Journey Mapping.

Los User Journey Maps que se presentan a continuación describen el recorrido actual de cada arquetipo, en la situación previa a la existencia de la solución. Se elaboran en su versión As-Is con el fin de evidenciar, sobre la secuencia real de actividades, en qué momentos se concentran los puntos de dolor identificados durante las entrevistas. Por esa razón, ninguna etapa incorpora la plataforma ICHU ni los dispositivos que forman parte de la propuesta: los canales representados son los medios que los entrevistados utilizan hoy, es decir cuadernos de campo, hojas de cálculo, comunicación telefónica, observación directa del animal y visita presencial.

El recorrido de Cesar Flores abarca el ciclo de gestión de su hato, desde el recorrido matinal de supervisión hasta el cierre económico de la campaña, e incluye los episodios críticos de detección tardía de enfermedad y de pérdida de animales por muerte o abigeato. El recorrido de Leonardo Rosales abarca la atención de una emergencia sanitaria en un establo que asesora, desde la recepción del aviso telefónico hasta el informe entregado al propietario y el seguimiento posterior del tratamiento aplicado.

Ambos mapas fueron elaborados en UXPressia y están vinculados a la ficha de User Persona correspondiente dentro de la misma herramienta.

**User Journey Map As-Is de Cesar Flores**

![User Journey Map As-Is de Cesar Flores](assets/images/journey-map-segmento1-cesar-flores.png)

*Figura 6. Elaboración de creación propia por datos recolectados, startup SmartFarm.*

User Journey Map de Cesar Flores en UXPressia ([https://uxpressia.com/w/v8FzI/t/AIZ5N](https://uxpressia.com/w/v8FzI/t/AIZ5N))

**User Journey Map As-Is de Leonardo Rosales**

![User Journey Map As-Is de Leonardo Rosales](assets/images/journey-map-segmento2-leonardo-rosales.png)

*Figura 7. Elaboración de creación propia por datos recolectados, startup SmartFarm.*

User Journey Map de Leonardo Rosales en UXPressia ([https://uxpressia.com/w/v8FzI/t/AIZ5N](https://uxpressia.com/w/v8FzI/t/AIZ5N))

#### As-Is Mapping

**As-Is Map de Cesar Flores**

![As-Is Mapping de Cesar Flores, arquetipo del Segmento 1](assets/images/cesar-flores-as-is-mapping.jpeg)

**As-Is Map de Leonardo Rosales**

![As-Is Mapping de Leonardo Rosales, arquetipo del Segmento 2](assets/images/leonardo-rosales-as-is-mapping.jpeg)

**Lectura de los recorridos**

En el recorrido de Cesar Flores, la emoción desciende en dos momentos concretos: cuando descubre que un animal lleva días enfermo sin que él lo advirtiera, y cuando constata una pérdida por muerte o robo. Ambos comparten la misma causa, que es la ausencia de información entre el instante en que el problema comienza y el instante en que se vuelve visible.

En el recorrido de Leonardo Rosales, el punto más bajo se sitúa en la consulta de antecedentes, porque es el momento en que comprueba que la información sobre la cual debe decidir es incompleta o poco confiable. Los tramos siguientes heredan esa limitación: el diagnóstico se emite con datos parciales y el seguimiento posterior queda sin verificación.

Ambos recorridos convergen en que el registro se realiza siempre después de la actividad, nunca durante, y en un soporte que no está disponible para la otra parte cuando lo necesita.

### 2.3.4. Empathy Mapping.

Para la elaboración de los Empathy Maps, el equipo partió de las entrevistas y de los patrones sintetizados en las User Personas. Los elementos descritos a continuación se limitan a evidencia disponible: registros en Excel o cuadernos, conectividad irregular, observación y atención de animales, uso de teléfonos o computadoras cuando se declara, y necesidades expresadas por los participantes. Las marcas, influencias de compra y canales sociales no están documentados de manera consistente en las fuentes transcritas; se consideran preguntas pendientes de validación y no hechos del arquetipo. Los mapas gráficos asociados deben reflejar esta misma distinción entre patrón común, caso individual y supuesto.

**Empathy Map de Cesar Flores**

![Empathy Map de Cesar Flores, arquetipo del Segmento 1](assets/images/empathy-map-segmento1-ganadero.jpg)

Empathy Map del Segmento 1 en UXPressia ([https://uxpressia.com/w/v8FzI/t/AIZ5N](https://uxpressia.com/w/v8FzI/t/AIZ5N))

Se empatiza con un arquetipo de propietario o administrador ganadero. En esta muestra, los predios entrevistados se encuentran en Apurímac y Cusco y los tamaños declarados varían; no se toma la localización ni escala de un solo participante como requisito universal.

Necesita identificar animales, consultar antecedentes, organizar campañas, revisar costos y responder a problemas sanitarios o de seguridad. Las entrevistas describen registros en Excel y cuadernos, potreros con cobertura irregular y labores de observación directa. Próspero menciona el uso de smartphone en campo y laptop en oficina; Meikoll refiere laptop y smartphone para sus fichas. Las actividades y necesidades comunes incluyen revisar animales, registrar eventos y consultar apoyo veterinario. Los canales de comunicación preferidos, marcas y fuentes de influencia no quedaron establecidos de forma comparable; deben validarse, no asumirse. Próspero expresa la necesidad de tener los antecedentes disponibles en una base de datos práctica.

La muestra documenta preocupación por enfermedades, partos y abigeato, pero los sucesos concretos varían por participante. La necesidad transversal respaldada es mantener información accesible y mejorar la detección y respuesta; que una herramienta reduzca efectivamente mortalidad o pérdidas sigue siendo una hipótesis a validar.

Los **Pains comunes documentados** son la fragmentación de registros y la conectividad irregular. La falta de hábito para registrar corresponde específicamente a Meikoll; los robos y problemas de parto o enfermedad se atribuyen a quienes los relataron y no a todos los ganaderos. Los **Gains esperados** son la ficha individual, las alertas, el funcionamiento sin conexión, la ubicación y los reportes; su efecto en pérdidas y tiempos requiere validación.

**Empathy Map de Leonardo Rosales**

![Empathy Map de Leonardo Rosales, arquetipo del Segmento 2](assets/images/empathy-map-segmento2-veterinario.jpg)

Empathy Map del Segmento 2 en UXPressia ([https://uxpressia.com/w/v8FzI/t/AIZ5N](https://uxpressia.com/w/v8FzI/t/AIZ5N))

Se empatiza con un arquetipo de zootecnista o médico veterinario que combina atención en campo con análisis y documentación clínica. Las entrevistas describen esta dinámica en Darwin, Eliseo y Dionisio, aunque las herramientas y tareas específicas varían entre ellos.

Necesita examinar animales, registrar intervenciones, consultar antecedentes, interpretar cambios de temperatura, actividad o rumia y comunicar resultados al propietario. El cuestionario del segmento (3 respuestas) registra un uso repartido entre smartphone, laptop y papel; Dionisio menciona el teléfono en campo y la computadora para informes. Eliseo describe registros en computadora e impresión de informes. Las entrevistas respaldan consultas de colegas y el uso de equipos como ecógrafos en casos concretos. Darwin menciona ASCRIGAR Perú para registros de gestación, lo que constituye evidencia individual de esa relación, no una influencia compartida por todos los profesionales. Las marcas, asociaciones, universidades y canales de influencia no quedan documentados de manera común; deben confirmarse antes de incorporarlos como atributos del arquetipo.

Los participantes expresan preocupación por detectar tarde cambios clínicos, por la calidad de los registros y por duplicar tareas. Necesitan datos trazables para sustentar decisiones; la eficacia diagnóstica de alertas o monitoreo continuo aún requiere validación clínica.

Los **Pains comunes documentados** son la información clínica incompleta o duplicada y la dificultad de advertir algunos cambios a tiempo. El timpanismo y el celo silencioso se mantienen como ejemplos clínicos relatados por participantes concretos. Los **Gains esperados** son alertas, historiales trazables, reportes e interoperabilidad; su eficacia clínica y disponibilidad deben validarse antes de presentarlos como resultados alcanzados.

## 2.4. Big Picture EventStorming.

El Big Picture EventStorming permite construir una comprensión compartida del negocio ganadero antes de diseñar la solución. Este modelo describe el **negocio actual**: las personas identifican y gestionan a los animales, los observan durante el pastoreo, brindan atención veterinaria, gestionan la reproducción y las campañas preventivas, y mantienen registros en cuadernos, teléfonos y hojas de cálculo. No describe una plataforma ICHU que ya se encuentre en funcionamiento.

La evidencia proviene de los resúmenes de entrevistas de la sección 2.2.2 del informe oficial AV1 (páginas 16–19 del PDF). Próspero, Meikoll y Grober describen registros manuales o en Excel, historiales incompletos y limitaciones de conectividad rural; Darwin, Eliseo y Dionisio describen observación en campo, trabajo clínico, evidencia ecográfica y elaboración de informes en oficina. Las alertas automáticas, la telemetría continua y las integraciones entre aplicaciones que solicitan son **capacidades deseadas**, no pruebas de que dichas capacidades ya existan.

**Proceso y alcance de la revisión**

El modelo existente del equipo en FigJam se revisa en cinco etapas: recopilar eventos candidatos del negocio, ordenar secuencias temporales locales, asociar personas y medios de apoyo existentes, revisar problemas y oportunidades, e identificar eventos pivote y áreas de negocio provisionales. Los nombres de los eventos se contrastan con las entrevistas documentadas y con el vocabulario existente del negocio. Esta revisión no afirma que se haya realizado una nueva entrevista ni un nuevo taller facilitado.

La explicación del negocio utiliza el tiempo presente porque describe cómo se trabaja hoy. Cada evento naranja o morado se redacta en pasado porque nombra un hecho que ya ocurrió, como *Animal examinado* o *Diagnóstico registrado*. La incorporación de collares inteligentes, la captura de telemetría, el almacenamiento en el dispositivo de borde, la sincronización central, los recordatorios automáticos y las alertas generadas por el sistema se excluyen del inventario de eventos del negocio actual. Los componentes técnicos y las fronteras definitivas de los contextos delimitados corresponden al diseño posterior, no a esta sección.

Las siguientes figuras son capturas PNG independientes exportadas directamente de las secciones corregidas de FigJam, no dibujos reconstruidos. Cada captura y su explicación corresponden a su respectiva etapa dentro de la sección 2.4; el enunciado del trabajo final no exige subsecciones numeradas adicionales en este punto. El texto dentro de las imágenes se conserva en inglés; las explicaciones del informe se presentan en español.

**Etapa 1 — Exploración caótica**

El inventario sin ordenar contiene 36 eventos candidatos del negocio. Las notas naranjas representan hechos relacionados con la identificación del hato, la observación, la atención sanitaria, la reproducción, las campañas, los registros y las bajas de animales. La proximidad entre las notas no implica una secuencia. Los conceptos existentes del dominio cuyas reglas operativas exactas no se establecen en las entrevistas se mantienen como candidatos por validar, en lugar de presentarse como procedimientos confirmados que todas las unidades productivas aplican.

![Etapa 1 — Exploración caótica: eventos candidatos del negocio actual sin ordenar](assets/images/diagrams/big-picture-eventstorming/01-1-chaotic-exploration.png)

*Figura 2.4.1. Exploración caótica: 36 eventos candidatos del negocio redactados en pasado, sin componentes de la solución futura. Fuente: tablero de SmartFarm en FigJam.*

Tablero de figma del big picture event storming: [https://tinyurl.com/BigPictureEventStorming](https://tinyurl.com/BigPictureEventStorming)

**Etapa 2 — Ordenamiento temporal**

Los mismos 36 eventos candidatos se organizan en seis carriles del negocio, que se leen de arriba hacia abajo. Las flechas expresan un orden local plausible únicamente donde se modela una relación. No convierten cada observación en un paso obligatorio ni implican que todas las unidades productivas sigan un único proceso universal. Las observaciones durante el pastoreo son hallazgos alternativos; la muerte, la venta y el robo son motivos alternativos de baja, no eventos consecutivos. El registro en campo y la incorporación de datos en oficina pueden ocurrir en momentos distintos.

![Etapa 2 — Ordenamiento temporal: seis procesos locales del negocio y alternativas explícitas](assets/images/diagrams/big-picture-eventstorming/01-2-enforce-timeline.png)

*Figura 2.4.2. Ordenamiento temporal: ciclo de vida del hato, observaciones durante el pastoreo, intervención sanitaria, reproducción, campañas preventivas y registros en campo e informes. Fuente: tablero de SmartFarm en FigJam.*

Tablero de figma del big picture event storming: [https://tinyurl.com/BigPictureEventStorming](https://tinyurl.com/BigPictureEventStorming)

El carril de reproducción ilustra una secuencia exitosa, no una preñez o un parto garantizados. La revisión del historial de medicamentos y el diagnóstico pueden ocurrir en un orden distinto. Los períodos de retiro se aplican únicamente cuando el tratamiento administrado los requiere; las reglas efectivamente utilizadas, los criterios de cierre de campañas y los traspasos de información sobre costos e indicadores se mantienen pendientes de validación. No se define ningún umbral clínico ni política de software.

**Etapa 3 — Personas y medios de apoyo externos**

Las notas amarillas identifican roles del negocio: ganadero propietario, trabajador de campo o pastor, administrador de la unidad productiva y médico veterinario o zootecnista. Las notas azules muestran medios de apoyo existentes: cuadernos, notas y fotografías en el teléfono, registros en Excel, equipos de ecografía, notas clínicas, apoyo de laboratorio para casos complejos e informes de oficina o impresos. Estas asociaciones aclaran quién utiliza cada medio de apoyo en relación con un evento; no representan comandos de software ni integraciones. Una misma persona puede desempeñar varios roles, y las responsabilidades del trabajador de campo requieren confirmación.

![Etapa 3 — Personas y medios de apoyo existentes asociados con eventos de referencia del negocio](assets/images/diagrams/big-picture-eventstorming/01-3-people-and-systems.png)

*Figura 2.4.3. Personas y medios de apoyo externos: roles actuales, herramientas de apoyo y registro externo de criadores, sin la infraestructura propuesta de ICHU. Fuente: tablero de SmartFarm en FigJam.*

Tablero de figma del big picture event storming: [https://tinyurl.com/BigPictureEventStorming](https://tinyurl.com/BigPictureEventStorming)

ASCRIGAR Perú es un participante administrativo externo mencionado en las necesidades de Darwin sobre evidencia para el registro de gestación. No se representa como una integración mediante API que ya exista. La evidencia requerida, la responsabilidad de presentar la documentación y los pasos de aceptación permanecen como preguntas abiertas. Los actores del negocio no se sustituyen por collares, un dispositivo de borde ni un servicio central.

**Etapa 4 — Problemas y oportunidades**

La revisión de la secuencia del negocio vincula cinco eventos de referencia con puntos problemáticos en rosado y oportunidades en verde. Un punto problemático describe un dolor actual o un asunto del negocio pendiente de resolver. Una oportunidad expresa un resultado deseado, no una capacidad ya implementada ni una solución técnica obligatoria.

![Etapa 4 — Cinco problemas actuales, mejoras deseadas y cuatro preguntas de validación](assets/images/diagrams/big-picture-eventstorming/01-4-problems-and-opportunities.png)

*Figura 2.4.4. Problemas y oportunidades: cinco dolores del negocio actual, cinco resultados deseados y cuatro preguntas explícitas de validación. Fuente: tablero de SmartFarm en FigJam.*

Tablero de figma del big picture event storming: [https://tinyurl.com/BigPictureEventStorming](https://tinyurl.com/BigPictureEventStorming)

| Evento de referencia | Dolor actual o asunto pendiente | Resultado deseado y evidencia |
|---|---|---|
| Temperatura corporal elevada observada | El deterioro de la salud puede advertirse tarde; la observación manual no es continua. | Reconocer el deterioro con mayor anticipación y reducir las demoras en la respuesta. Grober, Darwin, Eliseo y Dionisio describen signos fisiológicos o de comportamiento y la necesidad de reconocerlos antes. |
| Animal reportado como desaparecido | La desaparición de animales y el robo pueden advertirse después de una pérdida; la señal rural limita los intentos de rastreo existentes. | Mejorar la visibilidad del hato y el seguimiento de los animales desaparecidos. Próspero y Meikoll describen pérdidas relacionadas con el robo; esto no demuestra que exista una solución operativa de GPS o cercas virtuales. |
| Tratamiento aplicado | Los historiales se encuentran dispersos entre cuadernos y fichas individuales, lo que dificulta rastrear las intervenciones anteriores. | Mantener un historial confiable por animal, con fechas y autoría claras. Próspero y Meikoll describen registros incompletos; Darwin necesita consultar la información sobre medicamentos administrados previamente. |
| Registro de campo ingresado en hoja de cálculo | El trabajo de campo y el ingreso de datos en oficina están separados; el registro tardío y la conectividad intermitente aumentan la pérdida de información. | Capturar la evidencia cuando se realiza el trabajo y conservarla para su revisión en oficina. Meikoll identifica el registro tardío, mientras que Eliseo y Dionisio describen rutinas de campo y oficina. No se presupone una arquitectura de sincronización. |
| Preñez confirmada por ecografía | La evidencia ecográfica y la documentación del registro externo implican pasos administrativos separados cuyas reglas exactas no están confirmadas. | Conservar evidencia completa y aclarar el traspaso de información al registro. Darwin identifica la necesidad relacionada con ASCRIGAR; el procedimiento formal de presentación y aceptación requiere validación. |

Las cuatro preguntas de las notas amarillo claro se mantienen explícitamente sin resolver:

- ¿Quién revisa el hato y se responsabiliza de comunicar los problemas de salud para su atención?
- ¿Cómo se asocia cada nota de campo con el animal correcto?
- ¿Qué reglas de cierre de campañas, costos y períodos de retiro se utilizan realmente?
- ¿Qué evidencia de gestación exige ASCRIGAR y quién la presenta?

**Etapa 5 — Eventos pivote y áreas de negocio emergentes**

Cuatro eventos pivote en morado marcan cambios en la responsabilidad o en el enfoque del negocio: *Animal registrado en el hato* establece una pertenencia al hato que puede rastrearse; *Problema de salud reportado* orienta la observación rutinaria hacia una respuesta; *Diagnóstico registrado* aporta una conclusión clínica que guía el tratamiento; y *Preñez confirmada por ecografía* cambia el seguimiento reproductivo y el manejo de la evidencia. Estos eventos no definen fronteras definitivas de software.

![Etapa 5 — Eventos pivote del negocio y áreas exploratorias, no contextos delimitados definitivos](assets/images/diagrams/big-picture-eventstorming/01-5-pivotal-and-emerging-contexts.png)

*Figura 2.4.5. Eventos pivote y áreas de negocio emergentes: cuatro eventos pivote y eventos de apoyo asociados con cinco áreas provisionales del negocio. Fuente: tablero de SmartFarm en FigJam.*

Tablero de figma del big picture event storming: [https://tinyurl.com/BigPictureEventStorming](https://tinyurl.com/BigPictureEventStorming)

Las áreas provisionales son **Identificación y ciclo de vida del hato**, **Observación durante el pastoreo y respuesta**, **Salud animal y atención clínica**, **Reproducción y evidencia**, y **Campañas preventivas e informes**. *Campaña sanitaria cerrada* sirve de apoyo a la revisión administrativa, sujeta a la validación de las reglas de cierre. *Animal dado de baja después de un robo* pertenece a la gestión del ciclo de vida del hato, no exclusivamente a la elaboración de informes. El mantenimiento de registros de campo atraviesa estas áreas; no es un servicio de telemetría. Estas agrupaciones son hipótesis de exploración, no un mapa de contextos definitivo, una descomposición de servicios ni una asignación de responsabilidades de software.

**Inventario de eventos del negocio por carril**

La tabla presenta, traducidos al español, los mismos 36 eventos de las etapas 1 y 2, cuyos nombres dentro de las imágenes se conservan en inglés. Pertenecer a un carril no implica una secuencia cronológica incondicional.

| Carril del negocio | Eventos candidatos del negocio redactados en pasado |
|---|---|
| Identificación y ciclo de vida del hato (7) | Animal registrado en el hato; Arete asignado; Animal incorporado a un lote; Etapa productiva registrada; Animal dado de baja por muerte; Animal dado de baja después de una venta; Animal dado de baja después de un robo. |
| Pastoreo y observaciones (8) | Pastoreo iniciado; Hato revisado visualmente; Temperatura corporal medida; Temperatura corporal elevada observada; Disminución de la rumia observada; Comportamiento inusual observado; Animal encontrado fuera del área de pastoreo; Animal reportado como desaparecido. |
| Salud e intervención (8) | Problema de salud reportado; Asistencia veterinaria solicitada; Animal examinado; Historial de medicamentos revisado; Diagnóstico registrado; Tratamiento aplicado; Período de retiro iniciado; Período de retiro finalizado. |
| Reproducción (5) | Celo detectado; Servicio registrado; Preñez confirmada por ecografía; Parto registrado; Cría registrada en el hato. |
| Campaña sanitaria preventiva (3) | Campaña sanitaria programada; Aplicación preventiva registrada; Campaña sanitaria cerrada. |
| Registros de campo e informes (5) | Observación de campo registrada; Registro de campo ingresado en hoja de cálculo; Costo consolidado; Indicadores del período calculados; Informe entregado al propietario. |

Tablero de figma del big picture event storming: [https://tinyurl.com/BigPictureEventStorming](https://tinyurl.com/BigPictureEventStorming)

## 2.5. Ubiquitous Language.

El lenguaje ubicuo reúne los términos que comparten los ganaderos, los operarios de campo, los médicos veterinarios, los zootecnistas y el equipo para describir el negocio ganadero investigado en las secciones 2.2 y 2.3. Se presenta como un único glosario, ordenado alfabéticamente por el término en español. El equivalente en inglés facilita la lectura de los eventos de la sección 2.4 sin cambiar su significado.

Las definiciones describen animales, personas, lugares, prácticas, registros y relaciones del negocio. Una ficha o un historial puede mantenerse en cuadernos, formularios u hojas de cálculo; su existencia no presupone una aplicación. Las reglas clínicas específicas y los procedimientos que las entrevistas no confirman requieren validación con los profesionales y responsables de cada unidad productiva.

| Término del negocio | Equivalente en inglés | Significado compartido |
|---|---|---|
| Abigeato | Cattle rustling | Robo de ganado. Se distingue del extravío, en el que se desconoce la ubicación del animal sin que se haya confirmado un robo. |
| Abrevadero | Water trough | Lugar o recipiente destinado a proporcionar agua de bebida al ganado. |
| Administrador ganadero | Ranch administrator | Persona responsable de organizar la operación de la unidad productiva, mantener sus registros y coordinar las faenas y la atención del hato. Puede ser también su propietario. |
| Alcance de la asesoría | Advisory scope | Animales, lotes, labores y responsabilidades que el propietario o administrador acuerda con el profesional que asesora a la unidad productiva. |
| Arete | Ear tag | Identificador físico colocado en la oreja del bovino para reconocerlo individualmente y asociarlo con sus registros. |
| Asesoría del hato | Herd advisory | Relación profesional mediante la cual un médico veterinario o zootecnista asesora a una unidad productiva sobre salud, reproducción, alimentación o manejo. |
| Baja de un animal | Animal deregistration | Constancia de que un animal deja de formar parte del inventario activo del hato por muerte, venta o robo. No equivale a borrar sus antecedentes. |
| Calendario ganadero | Livestock calendar | Organización de las labores sanitarias, reproductivas y de manejo de la unidad productiva según la época y las condiciones de la región. |
| Campaña sanitaria | Health campaign | Conjunto planificado de intervenciones preventivas, como vacunación o desparasitación, dirigido a un grupo de animales. Sus responsables y reglas de cierre deben acordarse con la unidad productiva. |
| Celo | Estrus | Periodo reproductivo de la hembra bovina que se considera para decidir el momento del servicio. Su identificación corresponde a la observación y valoración del responsable del manejo reproductivo. |
| Celo silencioso | Silent heat | Celo cuyos signos externos son poco evidentes para quien observa al animal. Es una dificultad de detección mencionada en las entrevistas, independiente del medio utilizado para observarlo. |
| Colegiatura veterinaria | Veterinary license | Registro profesional del médico veterinario que se consigna para identificar al responsable de una atención o informe clínico. |
| Cuarentena | Quarantine | Separación temporal de animales por motivos sanitarios, bajo las indicaciones del profesional responsable. |
| Diagnóstico | Diagnosis | Conclusión clínica que el médico veterinario establece tras evaluar al animal y los antecedentes disponibles. Se distingue de una observación de campo o una sospecha. |
| Días abiertos | Days open | Intervalo entre el parto de una hembra y la concepción siguiente, utilizado en el seguimiento reproductivo. |
| Ecografía de gestación | Gestation ultrasound | Examen por imagen que el profesional utiliza para evaluar la gestación y conservar evidencia de sus hallazgos. |
| Etapa productiva | Production stage | Fase de desarrollo o función productiva del animal, como ternero, vaquillona o vaca en producción. |
| Extravío | Missing animal | Situación en la que un animal no se encuentra donde se esperaba y se desconoce su ubicación. Requiere búsqueda; por sí sola no confirma abigeato. |
| Faena ganadera | Livestock task | Jornada o labor de manejo realizada sobre uno o varios animales, como vacunación, desparasitación o revisión del hato. |
| Ficha individual | Individual record | Registro que identifica a un animal y reúne sus datos de raza, etapa productiva, procedencia y otros antecedentes. El soporte puede ser físico o digital. |
| Ganadero propietario | Cattle rancher | Persona propietaria de la unidad productiva o del ganado que decide sobre inversiones, contratación de servicios y objetivos de producción. |
| Ganado bovino | Cattle | Conjunto de animales de la especie bovina, como vacas, toros, terneros y vaquillonas. En el informe, el término no incluye otras especies. |
| Ganado en sentido general | Livestock | Conjunto de animales de producción pecuaria, que puede abarcar distintas especies. Se distingue del ganado bovino estudiado en el proyecto. |
| Genealogía | Genealogy | Antecedentes de ascendencia de un animal utilizados para el seguimiento reproductivo y el mejoramiento genético. |
| Gestación o preñez | Pregnancy | Estado reproductivo de la hembra que lleva una cría en desarrollo. La sospecha de preñez se distingue de la confirmación profesional documentada. |
| Hato | Herd | Conjunto de bovinos administrado en una misma unidad productiva. Puede organizarse en varios lotes. |
| Historial clínico | Clinical history | Secuencia de observaciones, diagnósticos, tratamientos, exámenes e intervenciones de un animal, con sus fechas y responsables cuando están disponibles. |
| Informe de la unidad productiva | Ranch report | Documento que reúne resultados sanitarios, reproductivos, operativos o económicos de un periodo para informar al propietario y apoyar decisiones. |
| Intervención clínica | Clinical intervention | Atención que realiza el médico veterinario sobre un animal, con el procedimiento o producto aplicado y su fecha. |
| Lote | Lot | Subgrupo del hato reunido por criterios de manejo, como edad, condición productiva o potrero asignado. No equivale al terreno donde se encuentra. |
| Mal de altura | High mountain disease | Denominación empleada por Grober para un problema de salud observado en terneros criados en altura. Su identificación requiere evaluación profesional. |
| Médico veterinario | Veterinarian | Profesional que evalúa la salud animal, establece diagnósticos, indica tratamientos y documenta la atención clínica. |
| Observación de campo | Field observation | Hecho advertido durante el manejo o recorrido del predio, como una conducta inusual o una disminución de actividad. No constituye por sí mismo un diagnóstico. |
| Operario de campo | Field operator | Persona que realiza el manejo directo de los animales, recorre potreros y ejecuta las faenas asignadas. Puede comunicar y registrar observaciones. |
| Parto | Calving | Nacimiento de la cría que cierra la gestación y forma parte del historial reproductivo de la hembra. |
| Pastoreo | Grazing | Actividad de alimentación del ganado en áreas de pastos, acompañada por las labores de conducción y observación que corresponden al predio. |
| Periodo de retiro | Withdrawal period | Plazo indicado para un medicamento veterinario durante el cual los productos del animal tratado no se destinan al consumo. Su aplicación depende del producto y de la indicación profesional. |
| Potrero | Paddock | Área de pastos delimitada dentro del predio para organizar el pastoreo. Puede recibir distintos lotes en momentos diferentes. |
| Raza | Breed | Clasificación del bovino por sus características de origen y crianza, registrada para su identificación y manejo. |
| Registro de campo | Field record | Anotación de una observación o labor durante la faena, vinculada al animal y al momento del hecho. Puede incorporarse después a los registros de oficina. |
| Rumia | Rumination | Proceso digestivo del bovino cuya observación aporta información al seguimiento de su estado general. Su valoración se interpreta junto con otros hallazgos. |
| Servicio reproductivo | Breeding service | Monta o inseminación registrada para el seguimiento de la reproducción. Un servicio no garantiza una preñez. |
| Timpanismo | Bloat | Problema digestivo del bovino mencionado por Darwin y Eliseo entre los casos sanitarios atendidos. Su diagnóstico corresponde al médico veterinario. |
| Tratamiento | Treatment | Medida terapéutica indicada por el médico veterinario y aplicada al animal, con registro del producto o procedimiento, fecha y responsable. |
| Unidad productiva ganadera | Ranch | Organización y predio donde se administra el hato; en las entrevistas también se denomina fundo, estancia o hacienda. |
| Zootecnista | Zootechnician | Profesional que asesora sobre producción, alimentación, reproducción y manejo del ganado dentro de su ámbito de trabajo. Su rol se distingue del diagnóstico clínico veterinario. |
