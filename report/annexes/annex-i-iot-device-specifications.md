## Anexo I. Especificaciones de dispositivos IoT y sus conexiones

El primer diseño de ICHU reúne tres dispositivos. El **collar** mide temperatura superficial, movimiento y ubicación del animal. El **controlador del abrevadero** mide la temperatura del agua y acciona el calefactor. El **receptor de alertas** muestra el estado del ganado mediante texto, luces y sonido. El **Portable Edge Gateway** es el equipo de comunicación y procesamiento local que recibe telemetría y evalúa reglas de alerta.

![Primer diseño IoT de ICHU con el collar a la izquierda, el controlador del abrevadero en el centro y el receptor de alertas a la derecha](../assets/images/iot/system-circuit-overview.png)

*Vista general del diseño conceptual en Cirkit Designer. Cada bloque tiene su propio circuito de alimentación. Las tablas distinguen el cableado visible, las conexiones propuestas y los enlaces de datos que se deberán implementar.* [Capítulo V, sección 5.6](../50-solution-ui-ux-design.md#56-iot-device-design) · [Proyecto editable y capturas](annex-g-diagram-sources.md)

### I.1. Collar IoT

El ESP32-S3 DevKit se instala con la batería y los módulos en la carcasa del collar. El sensor térmico va en la cara interna, con contacto estable con el animal. El sensor de movimiento se fija a la placa y la antena GPS queda orientada hacia el cielo.

| Componente | Conexión con el ESP32-S3 o la alimentación | Función |
|---|---|---|
| DS18B20, sensor de temperatura | `DQ` ↔ `GPIO4` por 1-Wire, `VDD` al riel regulado y `GND` a tierra común. El pull-up de diseño conecta `DQ` con `3V3` mediante **4,7 kΩ**. | Mide la temperatura superficial en el punto de contacto. |
| MPU-6050, acelerómetro y giroscopio | `SDA` ↔ `GPIO8` y `SCL` ↔ `GPIO9` por I²C. El módulo comparte el riel de baja tensión y la tierra del ESP32-S3. | Entrega aceleración y velocidad angular para estimar la actividad. |
| NEO-6M y antena GPS | La captura lleva las dos señales UART a `GPIO17` y `GPIO18`. Confirmar en los bornes del módulo el cruce propuesto de `GPIO17 (TX)` → `RX` del GPS y `TX` del GPS → `GPIO18 (RX)`. `VCC` al riel compatible con el módulo y `GND` a tierra común. | Entrega coordenadas y datos de precisión cuando dispone de una posición válida. |
| Batería LiPo de 3,7 V y módulo de carga/protección | La batería va a `B+` y `B−`. Las salidas `OUT+` y `OUT−` van al módulo de alimentación dibujado aguas abajo. | Proporciona energía al collar y permite recargar la celda. |
| Módulo de alimentación de cuatro terminales | Entrada desde el módulo de carga/protección, salida hacia el riel común del ESP32-S3 y sus sensores. Confirmar el modelo, el sentido de sus terminales y la regulación a `3V3` con el módulo real. | Acondiciona la alimentación para la placa y los periféricos. |

En la captura, la resistencia entre `DQ` y la alimentación está rotulada **200 Ω**, aunque la nota del lienzo indica **4,7 kΩ**. El valor de 4,7 kΩ sigue el circuito de referencia del fabricante. Los GPIO se interpretaron a partir de la captura y de la distribución de pines de la placa de referencia. [Circuito del collar](../assets/images/iot/collar-circuit.png) · [DS18B20](https://www.analog.com/media/en/technical-documentation/data-sheets/DS18B20.pdf) · [ESP32-S3-DevKitC-1](https://docs.espressif.com/projects/esp-idf/en/v4.4.3/esp32s3/hw-reference/esp32s3/user-guide-devkitc-1.html)

Las interfaces I²C y UART se especifican en las hojas de datos de los módulos. [MPU-6050](https://invensense.tdk.com/wp-www.invensense.com/wp-content/uploads/2015/02/MPU-6000-Datasheet1.pdf) · [NEO-6M](https://content.u-blox.com/sites/default/files/products/documents/NEO-6_DataSheet_%28GPS.G6-HW-09005%29.pdf)

La medición del nivel de batería exigida por `TS-01` requiere definir un circuito de lectura. El botón y el LED de estado descritos en el concepto de la carcasa requieren asignación de pines y cableado. [Requisitos del collar](../30-requirements-specification.md#31-user-stories) · [Concepto físico](../50-solution-ui-ux-design.md#562-collar-iot)

### I.2. Controlador del abrevadero

El ESP32 DevKitC y el relé van en una caja fuera de las salpicaduras. La sonda impermeable se sumerge en el agua y se ubica separada de la resistencia para medir la temperatura del agua. El ESP32 activa el relé, cuyos contactos conmutan la rama de potencia del calefactor.

| Componente | Conexión | Función |
|---|---|---|
| DS18B20 impermeable, sensor de agua | `DQ` ↔ `GPIO4` por 1-Wire, `VDD` a `3V3` y `GND` a tierra lógica. El diseño debe llevar un pull-up de **4,7 kΩ** entre `DQ` y `3V3`. Verificar los conductores del modelo de sonda elegido. | Entrega la lectura que gobierna el calentamiento local. |
| Relé de un canal, bobina rotulada `DC5V` | `GPIO26` → `IN` y tierra lógica → `DC−`. Completar la alimentación de `DC+` con el riel de 5 V compatible y verificar el nivel de disparo con la salida de 3,3 V. | Conmuta la alimentación de la resistencia calefactora. |
| Resistencia calefactora y componente en serie | El esquema dibuja la rama `+ de la fuente de potencia → COM del relé → NO del relé → componente en serie → resistencia calefactora → − de la fuente de potencia`. La referencia y el valor del componente en serie quedan por confirmar. | La resistencia convierte energía eléctrica en calor. |
| Fuente de potencia y alimentación lógica | La fuente de banco representa la alimentación independiente de la carga. Completar la alimentación del ESP32 y del relé de acuerdo con sus entradas, con referencia común en el circuito de mando. | Alimentan por separado la rama del calefactor y el control. |

La captura del abrevadero muestra un pull-up de **200 Ω** y deja `DC+` del relé sin conexión. Antes del montaje se debe corregir el pull-up, confirmar las conexiones y dimensionar la fuente, el relé, la protección térmica y el calefactor para la carga elegida. [Circuito del abrevadero](../assets/images/iot/water-heater-circuit.png) · [DS18B20](https://www.analog.com/media/en/technical-documentation/data-sheets/DS18B20.pdf) · [ESP32-DevKitC](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32/esp32-devkitc/user_guide.html)

Según `TS-13`, con una lectura válida y las protecciones habilitadas, el controlador enciende el calefactor por debajo del límite inferior y lo apaga al alcanzar el superior. Si falla la sonda, la lectura es inválida o se supera un límite de seguridad, mantiene el calefactor apagado y registra el fallo. La decisión se ejecuta en el ESP32, incluso cuando el gateway está fuera de alcance. [Requisitos del abrevadero](../30-requirements-specification.md#31-user-stories)

### I.3. Receptor local de alertas

El ESP32 DevKitC del receptor se instala en un panel seco y visible para el operario, con la pantalla y los indicadores hacia el frente y la salida del buzzer despejada.

| Componente | Conexión con el ESP32 DevKitC o la fuente | Función |
|---|---|---|
| Pantalla LCD I²C de 16 × 2 y conversor de nivel | `GPIO21 (SDA)` ↔ `SDA` y `GPIO22 (SCL)` ↔ `SCL`, ambos a través del conversor. El lado de baja tensión usa `3V3` y el de alta usa `5V`. La pantalla recibe `5V` y comparte `GND` con el conversor y la placa. | Muestra el estado en texto. |
| LED verde | `GPIO25` → resistencia de 220 Ω → LED → `GND`. | Indica **Normal**. |
| LED amarillo | `GPIO26` → resistencia de 220 Ω → LED → `GND`. | Indica **Atención**. |
| LED rojo | `GPIO27` → resistencia de 220 Ω → LED → `GND`. | Indica **Urgencia**. |
| Buzzer activo KY-012 | `GPIO14` → `S` del módulo, `VIN` a `5V` y `GND` a tierra común. Verificar el disparo con una señal de 3,3 V en el módulo real. | Emite una señal sonora de urgencia. |
| Fuente de baja tensión | La fuente de banco representa el riel de `5V` del LCD, el lado alto del conversor y el buzzer. Definir la alimentación del ESP32, cuyo borne de entrada queda libre en la captura, y compartir la referencia de tierra. | Alimenta el panel. |

[Circuito del receptor](../assets/images/iot/alert-receiver-circuit.png) · [Asignación de pines y estados en el Capítulo V](../50-solution-ui-ux-design.md#563-alert-receiver-and-indicators)

### I.4. Comunicación entre dispositivos

Los tres circuitos son eléctricamente independientes. BLE significa Bluetooth de baja energía. La tabla describe el flujo de datos previsto y separa los requisitos vigentes de la propuesta del panel.

| Origen → destino | Medio y datos | Estado del diseño |
|---|---|---|
| Collar → Portable Edge Gateway | **BLE**. Envía lecturas identificadas con fecha y hora, temperatura superficial, actividad, posición, precisión GPS y nivel de batería. | Requisito de `TS-01` a `TS-04`. El collar conserva las lecturas pendientes hasta recibir confirmación del gateway. |
| Controlador del abrevadero → Portable Edge Gateway | **BLE**. Envía temperatura y validez de la lectura, estado del calefactor y eventos de control. | Requisito de `TS-13` y `TS-14`. El controlador conserva registros pendientes y sigue regulando el calentador si se pierde el enlace. |
| Portable Edge Gateway → receptor local de alertas | **Wi-Fi en la red local**, como propuesta del Capítulo V. El panel recibe el estado o aviso que debe presentar mediante LCD, LED y buzzer. | Quedan por definir la interfaz, el formato del mensaje y el comportamiento del panel al perder comunicación. |
| Portable Edge Gateway → API central de ICHU | **HTTPS** con acceso a Internet. Sincroniza telemetría y alertas en `POST /api/v1/telemetry/batch` y registros del abrevadero en `POST /api/v1/water-controllers/{controllerId}/readings`. | Requisito de `TS-06` y `TS-14`. El gateway recibe y guarda las lecturas localmente mientras recupera conectividad. |

Para los enlaces del collar y del abrevadero se toman como referencia las historias técnicas del Capítulo III y la arquitectura actualizada del Capítulo IV. La sección 5.6.5 conserva una descripción anterior que contempla el envío directo del collar al backend y deja pendiente el paso del abrevadero por Edge. En los requisitos vigentes, ambos dispositivos entregan sus registros al gateway y este los sincroniza con la API central. El modelo físico del gateway y la integración del panel quedan por definir. [Historias técnicas](../30-requirements-specification.md#31-user-stories) · [Arquitectura de contenedores](../40-solution-software-design.md#4133-software-architecture-container-level-diagram) · [Flujo descrito en el diseño conceptual](../50-solution-ui-ux-design.md#565-design-decisions-and-edge-data-flow)

### I.5. Verificaciones para el prototipo

1. Contrastar los GPIO y terminales de cada módulo con el esquema editable y la placa física. Corregir ambos pull-ups y completar las entradas de alimentación antes de probar el cableado.
2. Probar la captura de temperatura, movimiento y posición en el collar, incluyendo una lectura inválida y un periodo sin enlace BLE. Verificar la recuperación y la confirmación de los registros pendientes.
3. Probar el control del abrevadero con una carga de prueba antes de conectar el calefactor. Verificar encendido, apagado al límite superior y apagado ante fallo de la sonda.
4. Verificar los tres estados del receptor mediante texto y LED, y el aviso sonoro de urgencia. Probar el intercambio con el gateway cuando se defina el contrato del panel.
