## Anexo J. Especificaciones de dispositivos IoT y sus conexiones

El primer diseño de ICHU reúne tres dispositivos de campo. El **collar** mide temperatura superficial, movimiento y ubicación del animal. El **controlador del abrevadero** mide la temperatura del agua y acciona el calefactor. El **receptor de alertas** presenta el estado del ganado mediante texto, luces y sonido. El **Portable Edge Gateway** recibe y almacena la telemetría y evalúa las reglas de alerta cerca de los dispositivos.

![Primer diseño IoT de ICHU con el collar a la izquierda, el controlador del abrevadero en el centro y el receptor de alertas a la derecha](../assets/images/iot/system-circuit-overview.png)

*Vista general del diseño conceptual en Cirkit Designer. Los tres bloques tienen alimentaciones independientes y se relacionan mediante los enlaces de datos descritos en J.4.*

Las tablas distinguen las conexiones leídas en la captura, los valores documentados por los fabricantes y las propuestas para completar el montaje. `3V3` identifica un riel de 3,3 V, `5V` uno de 5 V y `GND` el retorno común del bloque. Las flechas indican el sentido de una señal o el recorrido de la alimentación.

### J.1. Collar IoT

El ESP32-S3 DevKit concentra tres entradas. El DS18B20 va en la cara interna de la carcasa con contacto estable con el animal, el MPU-6050 se fija a la placa para que se mueva con el collar y la antena del NEO-6M se orienta hacia el cielo. La placa, la batería y los módulos de alimentación quedan sujetos dentro de la carcasa.

#### J.1.1. Inventario y especificaciones

| Cantidad | Componente | Especificación y función |
|---|---|---|
| 1 | ESP32-S3 DevKit | Microcontrolador con lógica de 3,3 V. Lee 1-Wire, I²C y UART, compone las lecturas y las transmite al gateway por HTTP sobre Wi-Fi. La ruta por Bluetooth de baja energía (BLE) está prevista y el gateway aún no tiene receptor. La revisión física de la placa se verifica contra el pinout de Espressif. |
| 1 | DS18B20 del collar | Sensor digital 1-Wire de tres terminales. El fabricante especifica alimentación de 3,0 a 5,5 V, resolución de 9 a 12 bits y exactitud de ±0,5 °C entre −10 y +85 °C. A 12 bits la conversión tarda hasta 750 ms. En el collar se alimenta a 3,3 V y mide la superficie en el punto de contacto. |
| 1 | MPU-6050 | Unidad inercial con acelerómetro y giroscopio de tres ejes cada uno. Sus escalas configurables son ±2, ±4, ±8 y ±16 g, y ±250, ±500, ±1000 y ±2000 °/s. Admite I²C de 100 o 400 kHz. El firmware usa estas muestras para calcular el índice de actividad. |
| 1 conjunto | NEO-6M con antena GPS | El NEO-6M admite UART. Su configuración de fábrica es 9600 baudios, 8 bits, sin paridad y 1 bit de parada, con salida NMEA habilitada. El módulo u-blox admite 2,7 a 3,6 V en `VCC`. Para la placa adaptadora del dibujo se debe comprobar el voltaje de entrada y el nivel de sus señales. |
| 1 | Batería LiPo de una celda | La captura indica 3,7 V nominales y 1100 mAh. La capacidad final y la autonomía se determinan con la batería elegida y el consumo medido en captura, transmisión y reposo. |
| 1 | Módulo de carga y protección | La captura muestra entrada USB, bornes de batería `B+` y `B−` y salida a la carga `OUT+` y `OUT−`. Confirmar la referencia y la corriente de carga compatibles con la celda. |
| 1 | Módulo de alimentación de cuatro terminales | Conecta la salida del cargador al riel del collar. Quedan por identificar el módulo, el sentido de sus terminales y su capacidad para mantener 3,3 V durante los picos de consumo del ESP32 y el GPS. |
| 1 | Resistencia de pull-up | 4,7 kΩ entre `DQ` y `3V3`, según el circuito de referencia del DS18B20. La captura muestra 200 Ω y el rótulo del lienzo indica 4,7 kΩ. Se debe conciliar el valor en el esquema antes de montar. |

#### J.1.2. Conexiones pin a pin

| Terminal de origen | Terminal de destino | Señal o condición |
|---|---|---|
| DS18B20 `DQ` | ESP32-S3 `GPIO4` | Bus 1-Wire bidireccional. La resistencia de 4,7 kΩ va entre esta línea y `3V3`. |
| Riel `3V3` y tierra | DS18B20 `VDD` y `GND` | Alimentación de tres hilos. |
| MPU-6050 `SDA` | ESP32-S3 `GPIO8` | Datos I²C. Verificar que el pull-up de la placa del sensor eleve `SDA` al nivel de 3,3 V. |
| ESP32-S3 `GPIO9` | MPU-6050 `SCL` | Reloj I²C. Verificar el pull-up del módulo y su dirección de 7 bits. `AD0` bajo corresponde a `0x68` y `AD0` alto a `0x69`. |
| Riel `3V3` y tierra | Módulo MPU-6050 `VCC` y `GND` | Alimentación compartida con el ESP32-S3. Confirmar que la placa del sensor opere con ese riel. |
| ESP32-S3 `GPIO17 (TX)` | GPS `RX` | Asignación UART propuesta a partir de la captura. Confirmar la identificación del borne del GPS. |
| GPS `TX` | ESP32-S3 `GPIO18 (RX)` | Entrega las tramas de posición. Confirmar el borne y el nivel lógico con el módulo adquirido. |
| Riel compatible y tierra | Placa GPS `VCC` y `GND` | Comprobar tensión y polaridad en la placa adaptadora. La antena se conecta al puerto RF del GPS. |
| Batería `+` y `−` | Cargador `B+` y `B−` | Entrada de la celda con la polaridad indicada. |
| Cargador `OUT+` y `OUT−` | Entrada positiva y negativa del módulo de alimentación | Salida protegida hacia el módulo regulador. |
| Salida regulada y retorno | ESP32-S3 `3V3` y `GND`, riel de sensores | Alimentación propuesta para uso con batería. Elegir una sola entrada de alimentación del DevKit durante las pruebas según la guía de su revisión. |

Cada ciclo entrega temperatura en °C, una medida de actividad y, cuando el GPS obtiene una posición válida, latitud y longitud con su indicador de precisión. La resolución del DS18B20 describe los incrementos de lectura. La precisión sobre el animal depende también del contacto y del montaje. El firmware comprueba que el sensor responda, que la conversión concluya y que el CRC de la lectura coincida antes de marcarla como válida.

`TS-01` exige un indicador de batería por lectura. El firmware lee la tensión de la celda en `GPIO1` a través de un divisor 1:2 de dos resistencias iguales y la convierte a porcentaje con una aproximación lineal entre 3,0 V y 4,2 V; en Wokwi la tensión se simula con un potenciómetro. La captura de Cirkit aún no dibuja el divisor y la conversión no se ha caracterizado con la batería real. La carcasa conceptual incluye un botón de encendido o emparejamiento y un LED de estado, ambos con pines y cableado por definir. Para despertar el collar por movimiento, `TS-02` permite una interrupción si está habilitada. El pin `INT` del MPU-6050 aparece libre en la captura y la primera prueba puede usar el temporizador.

### J.2. Controlador del abrevadero

El ESP32 DevKitC y el relé se instalan en una caja fuera de las salpicaduras. La sonda impermeable se sumerge en el agua y se fija separada del calefactor para medir el agua del recipiente. La etapa de control usa baja tensión y los contactos del relé conmutan la alimentación independiente del calefactor.

#### J.2.1. Inventario y especificaciones

| Cantidad | Componente | Especificación y función |
|---|---|---|
| 1 | ESP32 DevKitC | Placa de referencia de 38 pines con módulo ESP-WROOM-32 en la captura. Lee la sonda por 1-Wire, comanda el relé mediante un GPIO de 3,3 V y transmite registros al gateway por BLE. |
| 1 | Sonda impermeable DS18B20 | Mide agua en °C con el mismo sensor digital descrito en J.1. Su envoltura y cable deben corresponder a la instalación sumergida. Verificar `VDD`, `DQ` y `GND` en el modelo real. La captura muestra un cuarto conductor sin terminar. |
| 1 | Resistencia de pull-up | 4,7 kΩ propuestos entre `DQ` y `3V3`. El símbolo de la captura indica 200 Ω. |
| 1 | Módulo relé de un canal | Bobina rotulada `DC5V`, entrada `IN`, alimentación `DC+` y `DC−`, y contactos `COM`, `NO` y `NC`. La captura muestra selección de disparo alto o bajo. Confirmar la posición del selector, el disparo con 3,3 V y la capacidad de los contactos para la carga elegida. |
| 1 | Resistencia calefactora | Convierte la energía eléctrica en calor. Definir tensión, corriente, potencia y condiciones de instalación con el modelo elegido. |
| 1 | Componente en serie con el calefactor | Visible entre el relé y la resistencia. Su referencia no es legible en la captura. Confirmar su función y definir la protección térmica de la rama para la carga real. |
| 1 por rama | Alimentación de control y fuente de potencia | La alimentación lógica debe cubrir la placa y el relé. La fuente de banco dibujada representa la rama de potencia. La tensión y la capacidad de esa rama quedan sujetas al calefactor seleccionado. |

#### J.2.2. Conexiones pin a pin

| Terminal de origen | Terminal de destino | Señal o condición |
|---|---|---|
| Sonda `DQ` | ESP32 `GPIO4` | Bus 1-Wire. El pull-up se conecta desde este mismo nodo a `3V3`. |
| ESP32 `3V3` y `GND` | Sonda `VDD` y `GND` | Alimentación y referencia de la sonda. Identificar terminales mediante la ficha de la sonda. |
| ESP32 `GPIO26` | Relé `IN` | Orden de calentamiento. Definir en el firmware el nivel activo después de verificar el módulo. |
| Riel de 5 V compatible y `GND` | Relé `DC+` y `DC−` | Alimentación del módulo y retorno del mando. La captura deja `DC+` abierto. Confirmar también la alimentación de entrada del ESP32. |
| Positivo de la fuente de potencia | Relé `COM` | Entrada a la rama conmutada del calefactor. |
| Relé `NO` | Componente en serie → resistencia calefactora | Contacto normalmente abierto. El terminal `NC` queda libre en el diseño. |
| Segundo terminal de la resistencia | Negativo de la fuente de potencia | Retorno de la carga a su propia fuente. |

#### J.2.3. Comportamiento del control local

1. Al arrancar, el calefactor permanece apagado mientras se verifica la sonda y se obtiene una lectura válida. Verificar el estado de `NO` también durante el reinicio del ESP32.
2. Si la temperatura baja del límite inferior configurado y las protecciones lo permiten, el ESP32 activa el relé. Entre los límites conserva el estado previo y apaga el relé al alcanzar el límite superior. Esta diferencia de umbrales evita conmutaciones repetidas cerca de una sola temperatura.
3. Ante pérdida de la sonda, lectura inválida o superación de un límite de seguridad, el controlador mantiene o pasa el calefactor a apagado y registra la causa. Los valores de operación y seguridad quedan por definir para la instalación.
4. Cada lectura registra identidad, hora, temperatura con unidad y validez y estado del actuador. Cada cambio de estado genera un evento con `eventId` y causa. La regulación continúa cuando se pierde el enlace con el gateway, conforme a `TS-13`.

### J.3. Receptor local de alertas

El ESP32 DevKitC va en un panel seco y visible para el operario. La pantalla y los LED se orientan al frente y la salida del buzzer queda despejada.

#### J.3.1. Inventario y especificaciones

| Cantidad | Componente | Especificación y función |
|---|---|---|
| 1 | ESP32 DevKitC | Placa con lógica de 3,3 V. Recibe el estado por la red local según la propuesta y gobierna el LCD, los tres LED y el buzzer. |
| 1 | LCD de 16 × 2 con interfaz I²C | Dos líneas de 16 caracteres. El diseño lo alimenta a 5 V. Confirmar la referencia y la dirección I²C del adaptador que acompañe a la pantalla. |
| 1 | Conversor de nivel I²C | Adapta `SDA` y `SCL` entre el lado de 3,3 V del ESP32 y el lado de 5 V de la pantalla. Confirmar que sea bidireccional y verificar los pull-ups de cada lado. |
| 3 | LED verde, amarillo y rojo | Un indicador por estado. Cada LED lleva una resistencia individual de 220 Ω en serie. Verificar polaridad y corriente con los LED elegidos. |
| 1 | Buzzer activo KY-012 | Aviso sonoro para urgencias. Un buzzer activo genera el tono al activarse. Confirmar la función de cada terminal, el nivel de disparo y la corriente requerida por la variante elegida. |
| 1 | Fuente regulada de 5 V propuesta | Alimenta el LCD y el lado alto del conversor. El símbolo del buzzer recibe 5 V en el esquema. Definir y verificar la alimentación de la placa y del módulo sonoro antes de cerrar el cableado. |

#### J.3.2. Conexiones pin a pin

| Terminal de origen | Terminal de destino | Señal o condición |
|---|---|---|
| ESP32 `GPIO21 (SDA)` | Canal de datos del conversor → LCD `SDA` | Bus I²C bidireccional. |
| ESP32 `GPIO22 (SCL)` | Canal de reloj del conversor → LCD `SCL` | Reloj I²C adaptado al riel del LCD. |
| ESP32 `3V3` | Conversor `LV` | Referencia del lado del ESP32. |
| Fuente `5V` | Conversor `HV` y LCD `VCC` | Alimentación del lado del LCD. Verificar la tierra de ambos lados según el conversor. |
| ESP32 `GPIO25` | Resistencia de 220 Ω → ánodo LED verde | Cátodo a `GND`. Indica **Normal**. |
| ESP32 `GPIO26` | Resistencia de 220 Ω → ánodo LED amarillo | Cátodo a `GND`. Indica **Atención**. |
| ESP32 `GPIO27` | Resistencia de 220 Ω → ánodo LED rojo | Cátodo a `GND`. Indica **Urgencia**. |
| ESP32 `GPIO14` | Buzzer `S` | Orden sonora. Si la entrada del módulo requiere más corriente de la que admite el GPIO, definir una etapa de mando antes de conectarlo. |
| Fuente `5V` y `GND` | Buzzer `+` y `−` del símbolo | Cableado visible. Confirmar que el módulo real tenga una entrada de alimentación independiente de `S`. |
| Retorno de la fuente | `GND` del ESP32, conversor, LCD, LED y buzzer | Referencia común del panel. La entrada de alimentación del ESP32 queda libre en la captura y se debe completar con una opción admitida por la placa. |

El panel muestra el estado por escrito junto con el LED correspondiente. En urgencia también activa el buzzer. Quedan por definir el tiempo de aviso sonoro y el criterio de actualización del estado recibido. Para la prueba de integración se propone mostrar **Sin comunicación** cuando el aviso pierda vigencia, evitando que una pérdida de enlace aparezca como **Normal**.

### J.4. Comunicación entre dispositivos

| Origen → destino | Medio | Datos y confirmación |
|---|---|---|
| Collar → Portable Edge Gateway | HTTP sobre Wi-Fi local (`POST /api/v1/monitoring/telemetry-readings` con `X-API-Key`), según `TS-01` a `TS-04`. BLE previsto. | Cada lectura lleva `device_id`, `event_id` y `recorded_at` en UTC, más `body_temperature`, `activity_index`, `battery_level` y `position` con `accuracy_meters`; un campo sin medición puede informarse en `invalid_reasons`. El gateway valida y guarda la lectura en SQLite antes de responder `201 Created`; un reenvío idéntico recibe `200 OK` y un `event_id` reutilizado con otro contenido, `409 Conflict`. |
| Controlador del abrevadero → Portable Edge Gateway | BLE, según `TS-13` y `TS-14` | Envía `readingId`, `controllerId`, `recordedAt`, temperatura con unidad y validez, `actuatorState` y eventos de control. El gateway confirma el registro después de persistirlo. |
| Portable Edge Gateway → receptor local de alertas | Wi-Fi por la red local, propuesta del Capítulo V | El gateway evalúa lecturas válidas con las reglas locales y el panel presenta el aviso recibido. Quedan por definir el servicio de entrega o consulta, la identificación del aviso y su vigencia. |
| Portable Edge Gateway → API central de ICHU | HTTPS cuando hay acceso a Internet, con la cabecera `X-Gateway-Key`, según `TS-06`, `TS-14` y `TS-15` | Sincroniza telemetría y alertas en `POST /api/v1/telemetry/batch` cada 15 s, en lotes de hasta 100 lecturas y 100 alertas; tras un fallo, la espera se duplica hasta 5 min. Antes de cada lote descarga las reglas (`GET /api/v1/edge-gateways/{gatewayId}/monitoring-rules`) y las asignaciones de collares (`GET /api/v1/edge-gateways/{gatewayId}/device-assignments`). Reintenta con los mismos identificadores si se pierde la respuesta. Los registros del abrevadero en `POST /api/v1/water-controllers/{controllerId}/readings` siguen propuestos. |

El collar conserva sus lecturas en una cola de hasta 60 registros si el gateway está fuera de alcance y las retira tras la confirmación. En la versión actual del firmware esa cola reside en RAM y se pierde al apagar el collar; su persistencia en la memoria no volátil (NVS) del ESP32-S3 está en desarrollo. El gateway guarda cada lectura y alerta en SQLite en modo WAL, con un estado de sincronización que solo cambia cuando la API central responde, y requiere acceso a la red local. Con acceso a Internet sincroniza los pendientes con la API central. Quedan por definir la plataforma física, el alcance efectivo de la red Wi-Fi en el predio y, si se incorpora BLE, los parámetros de ese enlace.

Para el collar y el abrevadero, este anexo adopta las historias técnicas del Capítulo III y la arquitectura actualizada del Capítulo IV. El collar entrega sus lecturas al gateway por Wi-Fi local y nunca directamente al backend; el gateway se encarga de sincronizarlas. El paso del abrevadero por Edge y la entrega de alertas al receptor del panel siguen como propuestas sin implementar; el Edge API ya ofrece `GET /api/v1/monitoring/alerts`, que el panel podría consultar.

### J.5. Clasificación de sensores, actuadores y equipos de apoyo

| Dispositivo | Sensores o entradas | Actuadores o salidas | Control y soporte |
|---|---|---|---|
| Collar | **DS18B20** para temperatura superficial, **MPU-6050** para aceleración y velocidad angular, **NEO-6M** para posición. La lectura del nivel de batería requiere un circuito de medida pendiente. El botón de la carcasa es una entrada manual propuesta. | LED de estado de la carcasa, previsto en el concepto y pendiente de cableado. | ESP32-S3, antena GPS, batería, cargador con protección, regulador y resistencia de pull-up. |
| Abrevadero | **DS18B20 impermeable** para temperatura del agua. | **Relé** como actuador de conmutación y **resistencia calefactora** como actuador térmico. | ESP32, fuentes de control y potencia, resistencia de pull-up y componente en serie con la carga. |
| Receptor de alertas | Estado recibido del gateway como entrada de datos. | **LED verde, amarillo y rojo** como indicadores luminosos, **buzzer KY-012** como actuador acústico y **LCD** como salida visual de texto. | ESP32, conversor I²C, resistencias de los LED y fuente regulada. |
| Portable Edge Gateway | Lecturas recibidas por HTTP en la red Wi-Fi local; BLE previsto para los dispositivos embebidos. | Avisos y datos por red local, y sincronización por HTTPS. | Procesamiento, almacenamiento persistente y comunicación. |

### J.6. Capacidad del suministro de energía

Las capacidades de las fuentes de la tabla son **propuestas para el banco de pruebas**. Se dimensiona con `P = V × I` y se confirma la corriente de pico con todos los consumidores del riel activos. Como criterio de diseño inicial, la capacidad de la fuente debe superar en al menos 25 % el pico medido, sin salir de la tensión admitida por cada módulo.

| Bloque | Capacidad de partida | Base de dimensionamiento y verificación |
|---|---|---|
| Collar | Batería dibujada de **3,7 V y 1100 mAh** (aprox. **4,07 Wh nominales**). Regulador propuesto de **3,3 V y 1 A** (3,3 W). | Espressif recomienda capacidad de al menos 500 mA para alimentar el ESP32-S3. Se reserva corriente adicional para GPS, IMU, DS18B20 y transitorios. u-blox indica hasta 67 mA como referencia para dimensionar la alimentación del NEO-6M, antes de considerar el adaptador o la antena activa. Confirmar que celda, protección y regulador soporten el pico simultáneo con batería próxima al fin de descarga. |
| Abrevadero, control | Fuente propuesta de **5 V y 1 A** (5 W), con salida de 3,3 V para la lógica y el DS18B20 según el pinout de la placa. | La fuente de control debe sostener simultáneamente el ESP32 con BLE activo y la bobina del relé. Medir el consumo de la bobina del módulo elegido y verificar que la conmutación mantenga estable el riel de 3,3 V. |
| Abrevadero, potencia | Fuente independiente. Su tensión y corriente nominales dependen del calefactor elegido. | Una carga resistiva de banco de **12 V y 24 W** requiere **2 A**. Con 25 % de reserva, ese ensayo requiere una fuente de **12 V y al menos 2,5 A** (30 W). Para el calefactor final calcular `I = P / V` con su placa de datos y dimensionar contactos, conductores y protecciones para esa carga y su régimen de servicio. |
| Panel | Fuente propuesta de **5 V y 1 A** (5 W). El ESP32 aporta la referencia de 3,3 V al lado bajo del conversor. | Medir con la radio activa, el LCD iluminado, el LED de urgencia y el buzzer encendidos. Revisar el presupuesto si la placa o los periféricos elegidos requieren más corriente. |
| Portable Edge Gateway | Alimentación por seleccionar con la plataforma de J.10. Para el banco se reserva un presupuesto de **15 W** al nodo completo. | Verificar el consumo de CPU, almacenamiento y radios durante recepción, escrituras y sincronización simultáneas. Elegir la tensión y el adaptador según el equipo utilizado. |

Como objetivo inicial, el collar debe operar **24 h** con el perfil de muestreo de J.7. Si en el ensayo se aprovecha el 80 % de la capacidad nominal de 1100 mAh, el consumo medio permitido en los bornes de batería es `0,80 × 1100 mAh / 24 h ≈ 36,7 mA`. Registrar corriente media y picos durante adquisición GPS, transmisión Wi-Fi y reposo, y comprobar la autonomía con un ciclo de descarga del prototipo. La capacidad aprovechable depende de la celda, la temperatura, el regulador y el corte de protección.

### J.7. Tiempo de respuesta objetivo (Time Delay)

Los tiempos de esta tabla distinguen la conversión del sensor, el periodo de muestreo y la latencia de entrega. Las metas son de banco y se verifican con marcas de tiempo. `p95` significa que al menos el 95 % de los ensayos debe quedar dentro del tiempo indicado. Para medir entre equipos se usan relojes sincronizados o un instrumento de tiempo común.

| Tramo | Tiempo de ficha técnica o meta propuesta | Inicio y fin de la medición |
|---|---|---|
| DS18B20 del collar y del abrevadero | **Hasta 750 ms** por conversión a 12 bits, según ficha técnica; el firmware del collar usa 10 bits, con una conversión de unos 190 ms. El firmware del collar toma una lectura cada **10 s** (`kReadingIntervalMs`), valor de demostración; para campo se propone **60 s**, sujeto al ensayo de autonomía. Periodo propuesto de **10 s** en el abrevadero. | Medir desde la orden de conversión hasta que la lectura digital queda disponible. Ensayar por separado la respuesta térmica de la sonda y su montaje. |
| MPU-6050 del collar | El firmware toma una muestra cada **50 ms** (20 Hz) durante todo el intervalo de lectura y calcula el índice como la desviación media del módulo de la aceleración respecto de la gravedad, escalada a 0–100 con un fondo de escala provisional de 3,0 m/s². Índice listo **≤ 100 ms p95** después de cerrar el intervalo. | Registrar inicio y fin del intervalo y el tiempo para calcular el índice. Calibrar el fondo de escala con animales antes de comparar índices. |
| GPS NEO-6M | Ficha técnica de referencia de **27 s típicos** hasta la primera posición en arranque en frío. Meta de **≤ 60 s p95** en cielo abierto. Una posición reportada debe tener una antigüedad **≤ 10 s** al formar el registro. | Medir desde el encendido en frío hasta la primera posición válida. En cada registro guardar la hora de la posición y marcarla inválida si está ausente o supera la antigüedad admitida. |
| Control local del abrevadero | Orden al GPIO **≤ 100 ms p95** desde que se dispone de la lectura válida o del resultado de fallo. El relé debe cambiar el contacto **≤ 50 ms p95** después de la orden. | Medir la lectura o el fallo detectado, el flanco de `GPIO26` y el cambio de continuidad del contacto. Un cruce entre muestras puede esperar hasta el siguiente ciclo de 10 s, además de la respuesta térmica de la sonda. |
| Collar → Edge por HTTP sobre Wi-Fi | Confirmación de persistencia (`201 Created`) **≤ 2 s p95** desde que el registro está listo, con Wi-Fi conectado y sin cola previa. El firmware abandona el intento a los 5 s y espera 5 s antes de reintentar. | Comparar la hora de preparación del registro y la de recepción de su confirmación. Medir las reconexiones y el vaciado de cola por separado. |
| Procesamiento en Edge | **≤ 250 ms p95** desde la recepción de una trama válida hasta persistir el registro y terminar la evaluación local que corresponda. | Instrumentar recepción, confirmación de SQLite y fin de reglas en el gateway. La confirmación al emisor se habilita tras persistir. |
| Edge → panel | Presentación del aviso **≤ 1 s p95** desde que Edge deja disponible el estado, con Wi-Fi local operativo. | Comparar la hora de publicación con el cambio visible del LCD y LED y el inicio del buzzer, según el estado. |
| Salidas locales del panel | LED y buzzer **≤ 100 ms p95** hasta encender o sonar. LCD **≤ 250 ms p95** hasta completar el texto. | Medir cada salida desde que el firmware del panel emite su orden local. |
| Edge → API central | Meta de sincronizar un lote normal **≤ 30 s p95** desde que queda listo para envío, con Internet operativo. El sincronizador corre cada 15 s (`SYNC_INTERVAL_SECONDS`), por lo que la espera hasta el siguiente ciclo cabe en la meta; la primera petición a la API desplegada en Render puede tardar cerca de un minuto si el servicio estaba en reposo. | Medir hasta la confirmación de la API. En ausencia de conectividad se conserva la cola y se mide el tiempo de recuperación por separado. |

El tiempo de calentamiento del agua se mide desde la activación del calefactor hasta alcanzar el límite superior. Depende del volumen, la potencia y las pérdidas térmicas, por lo que se definirá al seleccionar el equipo. Los **30 min** de desviación sostenida de `US-55` y las **6 h** para el estado sin comunicación de `US-54` son ventanas funcionales del reporte, distintas de la latencia de control y transmisión.

### J.8. Incertidumbre objetivo de los sensores (Target Uncertainty)

Para temperatura, movimiento y tensión se propone una incertidumbre expandida objetivo `U = k × u_c` con factor de cobertura `k = 2`. La incertidumbre estándar combinada `u_c` reúne las contribuciones de la referencia, la resolución, la dispersión de las repeticiones y el montaje. Para GPS se usa el percentil 95 del error horizontal frente a una referencia conocida. Los **2,5 m CEP** de la ficha del NEO-6M corresponden al radio que contiene el 50 % de las posiciones en el ensayo estático del fabricante.

| Sensor y cantidad física | Incertidumbre o error objetivo propuesto | Método de verificación |
|---|---|---|
| DS18B20 del collar, temperatura superficial (°C) | **U ≤ 1,0 °C** en un ensayo de contacto entre 30 y 42 °C. | Comparar en varios puntos con un termómetro de referencia sobre una superficie estabilizada. Repetir retirando y colocando el collar para incorporar la variación por contacto. El ensayo caracteriza la superficie medida. |
| DS18B20 del abrevadero, temperatura del agua (°C) | **U ≤ 0,75 °C** en un baño de prueba entre 5 y 40 °C. | Comparar en varios puntos con un termómetro de referencia, con agua mezclada y ambas sondas a la misma profundidad. Repetir lecturas tras estabilizar y registrar la diferencia durante transitorios en una prueba separada. |
| Acelerómetro del MPU-6050, aceleración en X, Y y Z | **U ≤ 0,10 g por eje** (aprox. 0,98 m/s²), tras calibración en reposo. | Colocar el sensor con cada eje orientado sucesivamente a favor y en contra de la gravedad. Comparar con las componentes esperadas y repetir el montaje. |
| Giroscopio del MPU-6050, velocidad angular en X, Y y Z | **U ≤ 5 °/s por eje** en banco, tras corregir el sesgo. | Medir el cero en reposo y velocidades de referencia de hasta ±90 °/s mediante giro controlado en ambos sentidos por eje. |
| NEO-6M, posición horizontal a partir de latitud y longitud | **Error horizontal p95 ≤ 10 m** en cielo abierto y con posición válida. | Comparar series de posiciones con un punto de coordenadas conocidas en varias sesiones. Registrar fallos de posición y estimación de precisión del receptor. Para geocercas, tratar como no concluyentes las posiciones cuya incertidumbre impida distinguir el lado del límite. |
| Circuito propuesto de medida de batería, tensión de la celda (V) | **U ≤ 0,05 V** en el rango de operación de la celda elegida. | Tras definir el circuito, comparar con un multímetro de referencia en varios puntos y durante carga de trabajo. El porcentaje requiere caracterizar la batería bajo el perfil de uso. |

### J.9. Exactitud y precisión objetivo de los actuadores (Target Accuracy and Precision)

En una salida discreta, la exactitud se verifica por correspondencia entre la orden y el estado observado. La precisión se evalúa repitiendo la orden y midiendo la dispersión del tiempo de respuesta. En el calefactor también se evalúan la potencia y la repetibilidad térmica. Las metas siguientes se proponen para un ensayo controlado.

| Actuador o salida | Exactitud objetivo | Precisión o repetibilidad objetivo y prueba |
|---|---|---|
| Relé del abrevadero | **100 de 100 órdenes** de apertura o cierre reproducen el estado esperado del contacto `NO`, con la carga de prueba. El contacto queda abierto durante las pruebas de arranque y fallo del sensor. | Desviación estándar de la latencia **≤ 10 ms** por sentido de conmutación. Registrar el flanco de la orden y el estado estable del contacto en los ciclos de banco. |
| Resistencia calefactora | Potencia eléctrica estable dentro de **±10 %** de la nominal, a la tensión especificada. Como meta del conjunto de control, el pico del agua tras el apagado se mantiene **≤ 1,0 °C por encima del límite superior** en el volumen y montaje ensayados. | En diez ciclos con igual volumen, temperatura inicial y ubicación de sonda, la desviación estándar de la potencia estable debe ser **≤ 3 %** de su media y la del pico térmico **≤ 0,5 °C**. Medir ambas con instrumentos de referencia. |
| LED verde, amarillo y rojo | **100 de 100 cambios de estado** muestran el color asignado y un solo LED de estado activo. | Desviación estándar de la latencia de encendido **≤ 20 ms** desde la orden local, por color. Usar fotodetector o registro de video con resolución temporal suficiente. |
| Buzzer KY-012 | **100 de 100 órdenes** de urgencia generan sonido y las órdenes de desactivación lo silencian. Para un pulso de prueba de **1,00 s**, error de duración audible **≤ 0,10 s**. | Desviación estándar de la duración audible **≤ 50 ms** en pulsos repetidos. Medir con micrófono a distancia fija y comprobar el estado silencioso fuera de urgencia. |
| LCD de 16 × 2 | **100 de 100 actualizaciones** muestran el texto correspondiente sin restos del mensaje anterior. | Desviación estándar de la latencia de refresco **≤ 50 ms** desde la orden local. Repetir los cambios entre los tres estados y medir hasta que el texto esté completo. |
| LED de estado del collar | Una vez asignado, **100 de 100 órdenes** muestran el estado definido por el firmware. | Desviación estándar de la latencia de encendido **≤ 20 ms** bajo las mismas condiciones de alimentación. Aplicar cuando se defina el circuito. |

### J.10. Esfuerzo computacional en Edge y Fog (Processing Power)

El ESP32-S3 calcula el índice de actividad a partir de la ventana local y entrega el resumen al **Portable Edge Gateway**. El ESP32 del abrevadero ejecuta el control térmico local. Edge recibe los registros, los valida, los guarda en SQLite, evalúa alertas con la configuración vigente y sincroniza lotes con la API. El procesamiento de Edge se dimensiona para esos registros, con el análisis de muestras crudas en el collar.

| Algoritmo o tarea en Edge | Esfuerzo y memoria esperados | Implementación de referencia |
|---|---|---|
| Validar e identificar tramas | `O(B)` por registro, donde `B` es el tamaño de la trama. Memoria proporcional a los registros en proceso. | Validar identidad, campos, unidades, tiempo y validez. Consultar por índice la identidad del registro y confirmar después de que SQLite complete la escritura. |
| Evaluar umbrales y deduplicar alertas | `O(K)` comparaciones por registro para `K` reglas aplicables, más consultas indexadas de asignaciones y alertas. | Aplicar las reglas de la revisión vigente, con las asignaciones de collar a lote y etapa de vida descargadas de la API central, y la ventana de deduplicación configurada (`ALERT_DEDUPLICATION_MINUTES`). Un campo informado en `invalid_reasons` no se evalúa. Mantener las reglas activas en caché y persistir la alerta junto con su referencia a la lectura. |
| Evaluar geocercas | `O(V)` por posición para un polígono aplicable de `V` vértices. | Verificar validez y precisión de la posición. Aplicar una prueba punto en polígono y, fuera del polígono, generar la alerta solo si la distancia al límite supera la tolerancia de la geocerca más la precisión informada (`accuracy_meters`), de modo que el error del GPS no basta para alertar (ADR-0016 del Edge API). |
| Sincronizar registros pendientes | `O(L)` por lote de `L` registros, con memoria acotada al lote. | Preparar lotes paginados por índice, serializar y transmitir por HTTPS. Procesar confirmaciones individuales y reintentar con identidades estables. |

**Escenario de ensayo propuesto.** 100 collares con un registro cada 60 s y 10 abrevaderos con un registro cada 10 s producen en promedio **2,67 lecturas/s** o **230 400 lecturas/día**, más eventos de control. Se propone ensayar **20 registros/s** en Edge para incluir ráfagas de reenvío. Con un polígono de hasta 100 vértices por posición y una ráfaga compuesta íntegramente por posiciones, se recorren hasta **2000 segmentos/s** por pasada de geocerca. Medir los eventos, escrituras y consultas de alertas junto con esa carga. Con el periodo de demostración de 10 s del firmware, los mismos 100 collares producirían 10 lecturas/s, todavía por debajo de la ráfaga de ensayo.

**CPU, memoria y almacenamiento.** El punto de partida para el ensayo es un equipo Linux de **2 núcleos, 2 GiB de RAM y 16 GB de almacenamiento persistente**, con Wi-Fi y red local, y BLE si se incorpora ese receptor. Con una hipótesis de **1 KiB por lectura persistida**, siete días sin sincronizar ocupan unos **1,54 GiB** solo en lecturas. Reservar **al menos 4 GiB** para la base, sus índices, alertas y archivos temporales, y verificar el tamaño con la base real. La meta a 20 registros/s es mantener **CPU media ≤ 60 %** de la capacidad total y **RAM residente ≤ 512 MiB** para el servicio Edge y su proceso de sincronización, cumplir los **250 ms p95** de J.7 y conservar las confirmaciones tras un reinicio. La frecuencia del procesador y el equipo final se seleccionan a partir de esa prueba de carga.

**Aplicabilidad de Fog.** La arquitectura vigente concentra estas tareas en Edge y envía los lotes a la API central. Un nodo Fog separado queda fuera del dimensionamiento del prototipo. Si se incorpora para concentrar varios gateways, su carga se calculará con la suma de sus tasas y el volumen retenido durante la desconexión. Los umbrales locales y el control del calefactor seguirán ejecutándose en Edge y en el abrevadero, respectivamente.

### J.11. Verificaciones para el prototipo

| Prueba | Criterio de aceptación |
|---|---|
| Continuidad y alimentación | Verificar terminales y polaridad contra los módulos reales. Sustituir los dos pull-ups de 200 Ω de las capturas por el valor especificado, completar las entradas de alimentación y medir los rieles antes de conectar periféricos. |
| Collar | Obtener una lectura térmica válida, seis ejes de movimiento y una posición GPS válida. Al desconectar un sensor o perder la posición GPS, marcar el campo afectado como inválido y conservar los datos válidos de los demás sensores. El Edge API ya acepta el motivo en `invalid_reasons`; el firmware actual omite el campo y su envío está pendiente. |
| Abrevadero | Usar primero una carga de prueba. Comprobar encendido por debajo del límite inferior, apagado en el superior y salida apagada durante reinicio o pérdida de la sonda. Medir el estado de los contactos para comprobar la orden del firmware. |
| Panel | Probar Normal, Atención y Urgencia con el texto y LED correspondientes. Verificar el sonido en urgencia y comprobar la indicación de pérdida de comunicación cuando se integre con el gateway. |
| Registros sin conexión | Detener el Edge API o cortar el Wi-Fi, reiniciar el collar y verificar que los registros siguen pendientes; esta prueba requiere la cola en NVS, en desarrollo. Recuperar el enlace y comprobar que cada registro se confirma una vez almacenado y que un reenvío idéntico conserva su `event_id` y recibe `200 OK`. |
| Sincronización del gateway | Interrumpir Internet y comprobar que se siguen recibiendo lecturas locales. Al recuperar la conexión, verificar que se sincronizan con la API central sin crear duplicados. |
| Metas de medición, actuación y energía | Registrar instrumentos, condiciones, repeticiones y resultados de J.6 a J.9. Comparar la incertidumbre, la repetibilidad, los tiempos y la autonomía medidos con las metas propuestas. |
| Capacidad del gateway | Reproducir la carga normal y mantener la ráfaga de J.10 durante 30 min con sincronización concurrente. Registrar latencia p95, CPU, memoria, crecimiento de SQLite y recuperación de los registros tras reinicio. |

### J.12. Fuentes y enlaces

**Proyecto editable en Cirkit Designer**

<https://app.cirkitdesigner.com/project/a07ab13c-8ded-4672-a786-deecb40e13c2>

**Captura del collar**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/assets/images/iot/collar-circuit.png>

**Captura del controlador del abrevadero**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/assets/images/iot/water-heater-circuit.png>

**Captura del receptor de alertas**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/assets/images/iot/alert-receiver-circuit.png>

**Edge API (`ichu-edge-service`): README, ADR y contratos**

<https://github.com/five-smart-farm-creators/ichu-edge-service>

**Firmware del collar (`ichu-cattle-band-embedded-app`)**

Repositorio aún sin publicar en GitHub; su enlace queda pendiente para el equipo.

**Capítulo III. Historias técnicas y criterios de aceptación**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/30-requirements-specification.md#31-user-stories>

**Capítulo IV. Arquitectura de contenedores**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/40-solution-software-design.md#4133-software-architecture-container-level-diagram>

**Capítulo V. Diseño de dispositivos IoT**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/50-solution-ui-ux-design.md#56-iot-device-design>

**Espressif. ESP32-S3-DevKitC-1**

<https://documentation.espressif.com/esp-dev-kits/en/latest/esp32s3/esp32-s3-devkitc-1/user_guide_v1.0.html>

**Espressif. ESP32-DevKitC V4**

<https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32/esp32-devkitc/user_guide.html>

**Analog Devices. DS18B20**

<https://www.analog.com/media/en/technical-documentation/data-sheets/DS18B20.pdf>

**TDK InvenSense. MPU-6050**

<https://product.tdk.com/system/files/dam/doc/product/sensor/mortion-inertial/imu/data_sheet/mpu-6000-datasheet1.pdf>

**u-blox. NEO-6M**

<https://content.u-blox.com/sites/default/files/products/documents/NEO-6_DataSheet_%28GPS.G6-HW-09005%29.pdf>

**Joy-IT. KY-012 activo, variante de referencia**

<https://www.sensorkit.joy-it.net/en/sensors/ky-012>

**Espressif. Dimensionamiento del suministro del ESP32-S3**

<https://docs.espressif.com/projects/esp-hardware-design-guidelines/en/latest/esp32s3/schematic-checklist.html>

**JCGM. Guía para expresar la incertidumbre de medición**

<https://www.bipm.org/documents/20126/2071204/JCGM_100_2008_E.pdf>
