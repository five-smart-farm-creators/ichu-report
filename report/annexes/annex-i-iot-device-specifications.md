## Anexo I. Especificaciones de dispositivos IoT y sus conexiones

El primer diseño de ICHU reúne tres dispositivos de campo. El **collar** mide temperatura superficial, movimiento y ubicación del animal. El **controlador del abrevadero** mide la temperatura del agua y acciona el calefactor. El **receptor de alertas** presenta el estado del ganado mediante texto, luces y sonido. El **Portable Edge Gateway** recibe y almacena la telemetría y evalúa las reglas de alerta cerca de los dispositivos.

![Primer diseño IoT de ICHU con el collar a la izquierda, el controlador del abrevadero en el centro y el receptor de alertas a la derecha](../assets/images/iot/system-circuit-overview.png)

*Vista general del diseño conceptual en Cirkit Designer. Los tres bloques tienen alimentaciones independientes y se relacionan mediante los enlaces de datos descritos en I.4.*

Las tablas distinguen las conexiones leídas en la captura, los valores documentados por los fabricantes y las propuestas para completar el montaje. `3V3` identifica un riel de 3,3 V, `5V` uno de 5 V y `GND` el retorno común del bloque. Las flechas indican el sentido de una señal o el recorrido de la alimentación.

### I.1. Collar IoT

El ESP32-S3 DevKit concentra tres entradas. El DS18B20 va en la cara interna de la carcasa con contacto estable con el animal, el MPU-6050 se fija a la placa para que se mueva con el collar y la antena del NEO-6M se orienta hacia el cielo. La placa, la batería y los módulos de alimentación quedan sujetos dentro de la carcasa.

#### I.1.1. Inventario y especificaciones

| Cantidad | Componente | Especificación y función |
|---|---|---|
| 1 | ESP32-S3 DevKit | Microcontrolador con lógica de 3,3 V. Lee 1-Wire, I²C y UART, compone las lecturas y las transmite al gateway mediante Bluetooth de baja energía (BLE). La revisión física de la placa se verifica contra el pinout de Espressif. |
| 1 | DS18B20 del collar | Sensor digital 1-Wire de tres terminales. El fabricante especifica alimentación de 3,0 a 5,5 V, resolución de 9 a 12 bits y exactitud de ±0,5 °C entre −10 y +85 °C. A 12 bits la conversión tarda hasta 750 ms. En el collar se alimenta a 3,3 V y mide la superficie en el punto de contacto. |
| 1 | MPU-6050 | Unidad inercial con acelerómetro y giroscopio de tres ejes cada uno. Sus escalas configurables son ±2, ±4, ±8 y ±16 g, y ±250, ±500, ±1000 y ±2000 °/s. Admite I²C de 100 o 400 kHz. El firmware usa estas muestras para calcular el índice de actividad. |
| 1 conjunto | NEO-6M con antena GPS | El NEO-6M admite UART. Su configuración de fábrica es 9600 baudios, 8 bits, sin paridad y 1 bit de parada, con salida NMEA habilitada. El módulo u-blox admite 2,7 a 3,6 V en `VCC`. Para la placa adaptadora del dibujo se debe comprobar el voltaje de entrada y el nivel de sus señales. |
| 1 | Batería LiPo de una celda | La captura indica 3,7 V nominales y 1100 mAh. La capacidad final y la autonomía se determinan con la batería elegida y el consumo medido en captura, transmisión y reposo. |
| 1 | Módulo de carga y protección | La captura muestra entrada USB, bornes de batería `B+` y `B−` y salida a la carga `OUT+` y `OUT−`. Confirmar la referencia y la corriente de carga compatibles con la celda. |
| 1 | Módulo de alimentación de cuatro terminales | Conecta la salida del cargador al riel del collar. Quedan por identificar el módulo, el sentido de sus terminales y su capacidad para mantener 3,3 V durante los picos de consumo del ESP32 y el GPS. |
| 1 | Resistencia de pull-up | 4,7 kΩ entre `DQ` y `3V3`, según el circuito de referencia del DS18B20. La captura muestra 200 Ω y el rótulo del lienzo indica 4,7 kΩ. Se debe conciliar el valor en el esquema antes de montar. |

#### I.1.2. Conexiones pin a pin

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

`TS-01` exige un indicador de batería por lectura. Quedan por definir el circuito de medición y la conversión de tensión a nivel de carga. La carcasa conceptual incluye un botón de encendido o emparejamiento y un LED de estado, ambos con pines y cableado por definir. Para despertar el collar por movimiento, `TS-02` permite una interrupción si está habilitada. El pin `INT` del MPU-6050 aparece libre en la captura y la primera prueba puede usar el temporizador.

### I.2. Controlador del abrevadero

El ESP32 DevKitC y el relé se instalan en una caja fuera de las salpicaduras. La sonda impermeable se sumerge en el agua y se fija separada del calefactor para medir el agua del recipiente. La etapa de control usa baja tensión y los contactos del relé conmutan la alimentación independiente del calefactor.

#### I.2.1. Inventario y especificaciones

| Cantidad | Componente | Especificación y función |
|---|---|---|
| 1 | ESP32 DevKitC | Placa de referencia de 38 pines con módulo ESP-WROOM-32 en la captura. Lee la sonda por 1-Wire, comanda el relé mediante un GPIO de 3,3 V y transmite registros al gateway por BLE. |
| 1 | Sonda impermeable DS18B20 | Mide agua en °C con el mismo sensor digital descrito en I.1. Su envoltura y cable deben corresponder a la instalación sumergida. Verificar `VDD`, `DQ` y `GND` en el modelo real. La captura muestra un cuarto conductor sin terminar. |
| 1 | Resistencia de pull-up | 4,7 kΩ propuestos entre `DQ` y `3V3`. El símbolo de la captura indica 200 Ω. |
| 1 | Módulo relé de un canal | Bobina rotulada `DC5V`, entrada `IN`, alimentación `DC+` y `DC−`, y contactos `COM`, `NO` y `NC`. La captura muestra selección de disparo alto o bajo. Confirmar la posición del selector, el disparo con 3,3 V y la capacidad de los contactos para la carga elegida. |
| 1 | Resistencia calefactora | Convierte la energía eléctrica en calor. Definir tensión, corriente, potencia y condiciones de instalación con el modelo elegido. |
| 1 | Componente en serie con el calefactor | Visible entre el relé y la resistencia. Su referencia no es legible en la captura. Confirmar su función y definir la protección térmica de la rama para la carga real. |
| 1 por rama | Alimentación de control y fuente de potencia | La alimentación lógica debe cubrir la placa y el relé. La fuente de banco dibujada representa la rama de potencia. La tensión y la capacidad de esa rama quedan sujetas al calefactor seleccionado. |

#### I.2.2. Conexiones pin a pin

| Terminal de origen | Terminal de destino | Señal o condición |
|---|---|---|
| Sonda `DQ` | ESP32 `GPIO4` | Bus 1-Wire. El pull-up se conecta desde este mismo nodo a `3V3`. |
| ESP32 `3V3` y `GND` | Sonda `VDD` y `GND` | Alimentación y referencia de la sonda. Identificar terminales mediante la ficha de la sonda. |
| ESP32 `GPIO26` | Relé `IN` | Orden de calentamiento. Definir en el firmware el nivel activo después de verificar el módulo. |
| Riel de 5 V compatible y `GND` | Relé `DC+` y `DC−` | Alimentación del módulo y retorno del mando. La captura deja `DC+` abierto. Confirmar también la alimentación de entrada del ESP32. |
| Positivo de la fuente de potencia | Relé `COM` | Entrada a la rama conmutada del calefactor. |
| Relé `NO` | Componente en serie → resistencia calefactora | Contacto normalmente abierto. El terminal `NC` queda libre en el diseño. |
| Segundo terminal de la resistencia | Negativo de la fuente de potencia | Retorno de la carga a su propia fuente. |

#### I.2.3. Comportamiento del control local

1. Al arrancar, el calefactor permanece apagado mientras se verifica la sonda y se obtiene una lectura válida. Verificar el estado de `NO` también durante el reinicio del ESP32.
2. Si la temperatura baja del límite inferior configurado y las protecciones lo permiten, el ESP32 activa el relé. Entre los límites conserva el estado previo y apaga el relé al alcanzar el límite superior. Esta diferencia de umbrales evita conmutaciones repetidas cerca de una sola temperatura.
3. Ante pérdida de la sonda, lectura inválida o superación de un límite de seguridad, el controlador mantiene o pasa el calefactor a apagado y registra la causa. Los valores de operación y seguridad quedan por definir para la instalación.
4. Cada lectura registra identidad, hora, temperatura con unidad y validez y estado del actuador. Cada cambio de estado genera un evento con `eventId` y causa. La regulación continúa cuando se pierde el enlace con el gateway, conforme a `TS-13`.

### I.3. Receptor local de alertas

El ESP32 DevKitC va en un panel seco y visible para el operario. La pantalla y los LED se orientan al frente y la salida del buzzer queda despejada.

#### I.3.1. Inventario y especificaciones

| Cantidad | Componente | Especificación y función |
|---|---|---|
| 1 | ESP32 DevKitC | Placa con lógica de 3,3 V. Recibe el estado por la red local según la propuesta y gobierna el LCD, los tres LED y el buzzer. |
| 1 | LCD de 16 × 2 con interfaz I²C | Dos líneas de 16 caracteres. El diseño lo alimenta a 5 V. Confirmar la referencia y la dirección I²C del adaptador que acompañe a la pantalla. |
| 1 | Conversor de nivel I²C | Adapta `SDA` y `SCL` entre el lado de 3,3 V del ESP32 y el lado de 5 V de la pantalla. Confirmar que sea bidireccional y verificar los pull-ups de cada lado. |
| 3 | LED verde, amarillo y rojo | Un indicador por estado. Cada LED lleva una resistencia individual de 220 Ω en serie. Verificar polaridad y corriente con los LED elegidos. |
| 1 | Buzzer activo KY-012 | Aviso sonoro para urgencias. Un buzzer activo genera el tono al activarse. Confirmar la función de cada terminal, el nivel de disparo y la corriente requerida por la variante elegida. |
| 1 | Fuente regulada de 5 V propuesta | Alimenta el LCD y el lado alto del conversor. El símbolo del buzzer recibe 5 V en el esquema. Definir y verificar la alimentación de la placa y del módulo sonoro antes de cerrar el cableado. |

#### I.3.2. Conexiones pin a pin

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

### I.4. Comunicación entre dispositivos

| Origen → destino | Medio | Datos y confirmación |
|---|---|---|
| Collar → Portable Edge Gateway | BLE, según `TS-01` a `TS-04` | Cada lectura lleva `readingId`, `deviceId` y `recordedAt` en UTC, más temperatura, actividad, posición, precisión GPS y batería con unidad y validez donde corresponda. El gateway valida y guarda la lectura localmente antes de confirmar `readingId`. |
| Controlador del abrevadero → Portable Edge Gateway | BLE, según `TS-13` y `TS-14` | Envía `readingId`, `controllerId`, `recordedAt`, temperatura con unidad y validez, `actuatorState` y eventos de control. El gateway confirma el registro después de persistirlo. |
| Portable Edge Gateway → receptor local de alertas | Wi-Fi por la red local, propuesta del Capítulo V | El gateway evalúa lecturas válidas con las reglas locales y el panel presenta el aviso recibido. Quedan por definir el servicio de entrega o consulta, la identificación del aviso y su vigencia. |
| Portable Edge Gateway → API central de ICHU | HTTPS cuando hay acceso a Internet, según `TS-06` y `TS-14` | Sincroniza telemetría y alertas en `POST /api/v1/telemetry/batch` y registros del abrevadero en `POST /api/v1/water-controllers/{controllerId}/readings`. Reintenta con los mismos identificadores si se pierde la respuesta. |

Los dispositivos embebidos conservan sus registros en una cola persistente si el gateway está fuera de alcance y los retiran tras su confirmación. El gateway requiere una interfaz BLE para recibir ambos dispositivos, almacenamiento persistente para la base SQLite y acceso a la red local. Con acceso a Internet sincroniza las colas con la API central. Quedan por definir la plataforma física, el alcance efectivo en el predio y los parámetros de los enlaces BLE.

Para el collar y el abrevadero, este anexo adopta las historias técnicas del Capítulo III y la arquitectura actualizada del Capítulo IV. La descripción anterior de la sección 5.6.5 del Capítulo V contempla Wi-Fi directo al backend para el collar y deja por definir el paso del abrevadero por Edge. En el flujo vigente ambos entregan sus registros al gateway, que se encarga de sincronizarlos.

### I.5. Verificaciones para el prototipo

| Prueba | Criterio de aceptación |
|---|---|
| Continuidad y alimentación | Verificar terminales y polaridad contra los módulos reales. Sustituir los dos pull-ups de 200 Ω de las capturas por el valor especificado, completar las entradas de alimentación y medir los rieles antes de conectar periféricos. |
| Collar | Obtener una lectura térmica válida, seis ejes de movimiento y una posición GPS válida. Al desconectar un sensor o perder la posición GPS, marcar el campo afectado como inválido y conservar los datos válidos de los demás sensores. |
| Abrevadero | Usar primero una carga de prueba. Comprobar encendido por debajo del límite inferior, apagado en el superior y salida apagada durante reinicio o pérdida de la sonda. Medir el estado de los contactos para comprobar la orden del firmware. |
| Panel | Probar Normal, Atención y Urgencia con el texto y LED correspondientes. Verificar el sonido en urgencia y comprobar la indicación de pérdida de comunicación cuando se integre con el gateway. |
| Registros sin conexión | Interrumpir BLE, reiniciar el dispositivo y verificar que los registros siguen pendientes. Recuperar el enlace y comprobar que cada registro se confirma una vez almacenado y que un reenvío idéntico conserva su identidad. |
| Sincronización del gateway | Interrumpir Internet y comprobar que se siguen recibiendo lecturas locales. Al recuperar la conexión, verificar que se sincronizan con la API central sin crear duplicados. |

### I.6. Fuentes y enlaces

**Proyecto editable en Cirkit Designer**

<https://app.cirkitdesigner.com/project/a07ab13c-8ded-4672-a786-deecb40e13c2>

**Captura del collar**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/assets/images/iot/collar-circuit.png>

**Captura del controlador del abrevadero**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/assets/images/iot/water-heater-circuit.png>

**Captura del receptor de alertas**

<https://github.com/five-smart-farm-creators/ichu-report/blob/b2bc54063c73ae53ae26c98b55b0f3fddeaf01ea/report/assets/images/iot/alert-receiver-circuit.png>

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
