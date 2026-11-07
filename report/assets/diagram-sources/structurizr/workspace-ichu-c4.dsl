workspace "ICHU" "C4 model of ICHU, the livestock IoT platform by SmartFarm" {
    !impliedRelationships false

    model {
        ranchManager = person "Ranch Manager" {
            description "Owner or manager of a cattle farm"
            tags "Person"
        }

        fieldOperator = person "Field Operator" {
            description "Person who performs livestock tasks in the field"
            tags "Person"
        }

        veterinarian = person "Veterinarian / Zootechnist" {
            description "Professional who advises authorized herds"
            tags "Person"
        }

        visitor = person "Prospective Customer" {
            description "Visitor who evaluates the platform and its plans"
            tags "Visitor"
        }

        cattleBandHardware = softwareSystem "Cattle Band Hardware" {
            description "ESP32 collar with temperature, motion and GPS sensors, Wi-Fi and BLE"
            tags "External,Hardware"
        }

        waterControllerHardware = softwareSystem "Water Temperature Controller Hardware" {
            description "ESP32 water-temperature sensor and heating actuator"
            tags "External,Hardware"
        }

        ledHardwareDisplay = softwareSystem "LED Hardware Display" {
            description "External LED indicator connected to the Portable Edge Gateway for visible local alerts"
            tags "External,Hardware"
        }

      

        firebaseMessaging = softwareSystem "Firebase Cloud Messaging Provider" {
            description "External push notification service"
            tags "External"
        }

        mapProvider = softwareSystem "Map Provider" {
            description "External map and geofence service"
            tags "External"
        }

        paymentProvider = softwareSystem "Payment Provider" {
            description "External subscription payment service"
            tags "External"
        }

        ichu = softwareSystem "ICHU" {
            description "Livestock management IoT platform"

            landingPageUxUi = container "Website" {
                technology "HTML + CSS + JavaScript"
                description "Customer-visible layout and styles of the public landing page, rendered in the browser"
                tags "WebApplicationFolder"
            }

            webApplication = container "Web Application" {
                technology "HTML + CSS + JavaScript"
                description "Static visual layer of the web application, providing its HTML and CSS user interface"
                tags "WebApplicationFolder"
            }

            spa = container "Single Page Application" {
                technology "Angular + TypeScript"
                description "Interactive Angular single-page application that implements system functionality and displays alerts"
                tags "BrowserClient"
            }

            mobileApplication = container "Mobile Application" {
                technology "Flutter + Dart"
                description "Monitoring, alerts and offline field operations"
                tags "Mobile"
            }

            mobileCacheDatabase = container "Mobile Cache Database" {
                technology "SQLite"
                description "On-device cache for recently accessed livestock records, alerts and pending offline operations"
                tags "Database"
            }

            cattleBandEmbeddedApp = container "Cattle Band Embedded Application" {
                technology "C++ on ESP32"
                description "Collar firmware that captures and transmits telemetry"
                tags "IoT"

                // Figura 4.8: componentes añadidos desde la captura.

                bandTelemetryInterface = component "Band Telemetry Interface" {
                    technology "C++"
                    description "Interfaz de arranque del ciclo de captura"
                    tags "Interface"
                }

                bandTelemetryService = component "Band Telemetry Service" {
                    technology "C++"
                    description "Servicio de aplicación que coordina la captura"
                    tags "Application"
                }

                cattleBandAggregate = component "Cattle Band Aggregate" {
                    technology "C++"
                    description "Agregado del estado del collar"
                    tags "DomainAggregate"
                }

                cattleTelemetryProcessor = component "Cattle Telemetry Processor" {
                    technology "C++"
                    description "Servicio de dominio que normaliza las lecturas"
                    tags "DomainService"
                }

                bandConnectivityService = component "Band Connectivity Service" {
                    technology "C++"
                    description "Servicio de aplicación que elige Wi-Fi o BLE"
                    tags "Application"
                }

                cattleBandHal = component "Cattle Band HAL" {
                    technology "C++"
                    description "Capa de abstracción del hardware del collar"
                    tags "Infrastructure"
                }

                cattleBandHardwareAcl = component "Cattle Band Hardware ACL" {
                    technology "C++"
                    description "ACL hacia los controladores del fabricante"
                    tags "ACL"
                }

                bandCloudAdapter = component "Band Cloud Adapter" {
                    technology "C++ / HTTPS"
                    description "Adaptador de envío directo al backend"
                    tags "Infrastructure"
                }

                bandBleAdapter = component "Band BLE Adapter" {
                    technology "C++ / Bluetooth Low Energy"
                    description "Adaptador de envío por Bluetooth Low Energy"
                    tags "Infrastructure"
                }

                cattleBandLocalBuffer = component "Cattle Band Local Buffer" {
                    technology "ESP32 Flash / NVS"
                    description "Memoria local para lecturas no transmitidas"
                    tags "Infrastructure"
                }
            }

            waterControllerEmbeddedApp = container "Water Controller Embedded Application" {
                technology "C++ on ESP32"
                description "Water-trough firmware for measurement and heating"
                tags "IoT"

                // Figura 4.10: componentes añadidos desde la captura.

                waterControlInterface = component "Water Control Interface" {
                    technology "C++"
                    description "Interfaz de arranque del ciclo de medición"
                    tags "Interface"
                }

                waterControlApplicationService = component "Water Control Application Service" {
                    technology "C++"
                    description "Servicio de aplicación que coordina la medición"
                    tags "Application"
                }

                temperatureRegulationService = component "Temperature Regulation Service" {
                    technology "C++"
                    description "Servicio de dominio que decide el accionamiento"
                    tags "DomainService"
                }

                waterControllerAggregate = component "Water Controller Aggregate" {
                    technology "C++"
                    description "Agregado del estado del controlador"
                    tags "DomainAggregate"
                }

                waterControllerHal = component "Water Controller HAL" {
                    technology "C++"
                    description "Capa de abstracción del hardware del controlador"
                    tags "Infrastructure"
                }

                waterControllerHardwareAcl = component "Water Controller Hardware ACL" {
                    technology "C++"
                    description "ACL hacia los controladores del fabricante"
                    tags "ACL"
                }

                waterControllerLocalBuffer = component "Water Controller Local Buffer" {
                    technology "ESP32 Flash / NVS"
                    description "Memoria local para lecturas no transmitidas"
                    tags "Infrastructure"
                }

                waterCloudAdapter = component "Water Cloud Adapter" {
                    technology "C++ / HTTPS"
                    description "Adaptador de envío al backend"
                    tags "Infrastructure"
                }
            }

            edgeGateway = container "Portable Edge Service" {
                technology "Flask + Peewee ORM on Python, running on Raspberry Pi or similar Edge Device"
                description "Portable offline gateway with later cloud synchronization"
                tags "Edge"

                // Figura 4.9: componentes añadidos desde la captura.

                bleDeviceInterface = component "BLE Device Interface" {
                    technology "Python + Bluetooth Low Energy"
                    description "Interfaz de descubrimiento y recepción por BLE"
                    tags "Interface"
                }

                edgeTelemetryCollectionService = component "Edge Telemetry Collection Service" {
                    technology "Python"
                    description "Servicio de aplicación que recibe de varios collares"
                    tags "Application"
                }

                localMonitoringService = component "Local Monitoring Service" {
                    technology "Python"
                    description "Servicio de dominio que evalúa umbrales sin Internet"
                    tags "DomainService"
                }

                edgeTelemetryAggregate = component "Edge Telemetry Aggregate" {
                    technology "Python"
                    description "Agregado de la telemetría local y su estado de sincronización"
                    tags "DomainAggregate"
                }

                edgeSyncOrchestrator = component "Edge Sync Orchestrator" {
                    technology "Python"
                    description "Servicio de aplicación que sincroniza con la nube"
                    tags "Application"
                }

                localAlertAdapter = component "Local Alert Adapter" {
                    technology "Python"
                    description "Adaptador de alertas locales a la app móvil"
                    tags "Infrastructure"
                }

                edgeRepository = component "Edge Repository" {
                    technology "Peewee ORM + SQLite"
                    description "Repositorio local sobre SQLite"
                    tags "Infrastructure"
                }

                ichuCloudApiAcl = component "ICHU Cloud API ACL" {
                    technology "Python"
                    description "ACL hacia el API central"
                    tags "ACL"
                }
            }

            edgeDatabase = container "Edge Database" {
                technology "SQLite"
                description "Local telemetry, synchronization state and cached configuration"
                tags "Database,Edge"
            }

            backend = container "ICHU Web Service" {
                technology "ASP.NET Core Web API"
                description "Cloud REST API implemented as a modular monolith"
                tags "Monolith,API"

                // Figura 4.7: componentes añadidos desde la captura.

                telemetryApi = component "Telemetry API" {
                    technology "ASP.NET Core Controllers"
                    description "Interfaz de ingesta y consulta de telemetría"
                    tags "Interface"
                }

                operationsApi = component "Operations API" {
                    technology "ASP.NET Core Controllers"
                    description "Interfaz de eventos de campo e intervenciones clínicas"
                    tags "Interface"
                }

                edgeConfigurationApi = component "Edge Configuration API" {
                    technology "ASP.NET Core Controllers"
                    description "Interfaz de configuración y sincronización del borde"
                    tags "Interface"
                }

                telemetryIngestionService = component "Telemetry Ingestion Service" {
                    technology ".NET"
                    description "Servicio de aplicación que valida y persiste lecturas"
                    tags "Application"
                }

                operationsApplicationService = component "Operations Application Service" {
                    technology ".NET"
                    description "Servicio de aplicación de alertas y operaciones"
                    tags "Application"
                }

                edgeConfigurationService = component "Edge Configuration Service" {
                    technology ".NET"
                    description "Servicio de aplicación que entrega umbrales y geocercas"
                    tags "Application"
                }

                monitoringAggregate = component "Monitoring Aggregate" {
                    technology ".NET"
                    description "Agregado de la alerta y su regla de deduplicación"
                    tags "DomainAggregate"
                }

                livestockOperationAggregate = component "Livestock Operation Aggregate" {
                    technology ".NET"
                    description "Agregado del evento de campo y la intervención clínica"
                    tags "DomainAggregate"
                }

                cattleLookupAcl = component "Cattle Lookup ACL" {
                    technology ".NET"
                    description "ACL hacia Cattle Information"
                    tags "ACL"
                }

                iotAssetsLookupAcl = component "IoT Assets Lookup ACL" {
                    technology ".NET"
                    description "ACL hacia IoT Assets"
                    tags "ACL"
                }

                monitoringRulesDomainService = component "Monitoring Rules Domain Service" {
                    technology ".NET"
                    description "Servicio de dominio que evalúa umbrales y geocercas"
                    tags "DomainService"
                }

                monitoringRepository = component "Monitoring Repository" {
                    technology ".NET + Entity Framework Core"
                    description "Repositorio del esquema monitoring"
                    tags "Infrastructure"
                }

                cattleApplicationService = component "Cattle Application Service" {
                    technology ".NET"
                    description "Servicio de aplicación de información del ganado"
                    tags "Application"
                }

                iotAssetsApplicationService = component "IoT Assets Application Service" {
                    technology ".NET"
                    description "Servicio de aplicación de activos IoT"
                    tags "Application"
                }

                internalDomainEventDispatcher = component "Internal Domain Event Dispatcher" {
                    technology ".NET Domain Events"
                    description "Publica eventos de dominio entre módulos del monolito"
                    tags "Infrastructure"
                }

                firebaseMessagingAdapter = component "Firebase Messaging Adapter" {
                    technology ".NET + Entity Framework Core"
                    description "Adaptador hacia el servicio de notificaciones push"
                    tags "ACL"
                }
            }

            cloudDatabase = container "ICHU Cloud Database" {
                technology "PostgreSQL"
                description "Relational database with one schema per bounded context"
                tags "Database"
            }
        }

        ranchManager -> ichu "Manages cattle, devices, planning and subscriptions"
        fieldOperator -> ichu "Supervises cattle and records field tasks"
        veterinarian -> ichu "Reviews authorized animal health and history"
        visitor -> ichu "Reviews the value proposition and plans"

        cattleBandHardware -> ichu "Provides temperature, movement and position"
        waterControllerHardware -> ichu "Provides water temperature and actuator status"

        ichu -> firebaseMessaging "Sends push notifications"
        ichu -> mapProvider "Displays positions and geofences"
        ichu -> paymentProvider "Processes subscription payments"

        visitor -> landingPageUxUi "Browses the public website" "HTTPS"

        ranchManager -> webApplication "Loads the UI from" "HTTPS"
        ranchManager -> spa "Manages cattle and reviews indicators" "HTTPS"
        veterinarian -> mobileApplication "Reviews cattle and receives alerts" "HTTPS"

        fieldOperator -> mobileApplication "Performs field tasks" "HTTPS / Local Network"

        veterinarian -> webApplication "Loads the UI from" "HTTPS"
        veterinarian -> spa "Reviews authorized information" "HTTPS"
        veterinarian -> mobileApplication "Reviews authorized cattle information during farm visits" "HTTPS"

        landingPageUxUi -> webApplication "Redirects users to the web application when CTA is clicked" "HTTPS"

        webApplication -> spa "Delivers"

    
        spa -> mapProvider "Displays positions and geofences" "HTTPS"
        mobileApplication -> mapProvider "Displays positions and geofences" "HTTPS"

        landingPageUxUi -> backend "Requests plans and public content" "HTTPS / JSON"
        spa -> backend "Retrieves alerts and monitoring" "HTTPS / JSON"
        backend -> spa "Streams real time alerts and notifications" "HTTPS / WSS"

        mobileApplication -> backend "Calls the REST API" "HTTPS / JSON"
        mobileApplication -> mobileCacheDatabase "Reads and writes cached information for offline use" "SQLite"

        cattleBandEmbeddedApp -> cattleBandHardware "Reads sensors and position"
        cattleBandEmbeddedApp -> backend "Sends telemetry when Internet is available" "HTTPS / JSON"
        cattleBandEmbeddedApp -> edgeGateway "Sends offline telemetry over BLE" "Bluetooth Low Energy"

        edgeGateway -> edgeDatabase "Stores local telemetry and configuration" "SQLite"
        edgeGateway -> backend "Synchronizes when connectivity returns" "HTTPS / JSON"
        edgeGateway -> mobileApplication "Delivers local alerts without Internet" "Local Wi-Fi"
        edgeGateway -> ledHardwareDisplay "Activates visual warnings for critical local events" "GPIO"
        edgeGateway -> fieldOperator "Notifies the operator about critical local alerts" "Visual LED signal"

        waterControllerEmbeddedApp -> waterControllerHardware "Measures water and controls the heater"
        waterControllerEmbeddedApp -> backend "Reports temperature and actuator events" "HTTPS / JSON"

        backend -> cloudDatabase "Reads and writes cloud data" "Entity Framework Core / Npgsql"
        backend -> firebaseMessaging "Requests push notifications" "Firebase Admin SDK"
        backend -> paymentProvider "Requests subscription payment" "HTTPS"

        firebaseMessaging -> mobileApplication "Delivers the notification to the device" "Push Notification"

        // Figura 4.7: Operations & Monitoring.

        telemetryApi -> telemetryIngestionService "Invokes telemetry ingestion"
        operationsApi -> operationsApplicationService "Invokes livestock operational workflows"
        edgeConfigurationApi -> edgeConfigurationService "Requests Edge monitoring configuration"

        telemetryIngestionService -> monitoringAggregate "Updates cloud monitoring state"
        telemetryIngestionService -> cattleLookupAcl "Validates cattle identity"
        telemetryIngestionService -> iotAssetsLookupAcl "Validates device registration and assignment"
        telemetryIngestionService -> monitoringRulesDomainService "Evaluates telemetry rules"
        telemetryIngestionService -> monitoringRepository "Stores accepted telemetry"

        operationsApplicationService -> livestockOperationAggregate "Creates and updates livestock operational events"
        operationsApplicationService -> cattleLookupAcl "Resolves cattle identity when required"
        operationsApplicationService -> iotAssetsLookupAcl "Resolves device-to-cattle assignments"
        operationsApplicationService -> monitoringRulesDomainService "Evaluates operational monitoring conditions"
        operationsApplicationService -> monitoringRepository "Stores operational events"

        edgeConfigurationService -> monitoringRepository "Loads fever thresholds and geofence configuration"

        cattleLookupAcl -> cattleApplicationService "Queries Cattle Information module"
        iotAssetsLookupAcl -> iotAssetsApplicationService "Queries IoT Assets module"

        monitoringRulesDomainService -> internalDomainEventDispatcher "Publishes monitoring domain events"
        monitoringRulesDomainService -> firebaseMessagingAdapter "Requests notification when a critical condition exists"

        firebaseMessagingAdapter -> firebaseMessaging "Sends cloud push notification" "Firebase Admin SDK"
        monitoringRepository -> cloudDatabase "Stores telemetry, monitoring and livestock operational data" "Entity Framework Core / Npgsql"

        // Figura 4.8: firmware del collar inteligente.

        bandTelemetryInterface -> bandTelemetryService "Starts telemetry acquisition"
        bandTelemetryService -> cattleBandAggregate "Updates cattle band state"
        bandTelemetryService -> cattleTelemetryProcessor "Processes cattle sensor readings"
        bandTelemetryService -> bandConnectivityService "Requests telemetry transmission"
        bandTelemetryService -> cattleBandLocalBuffer "Stores telemetry when communication is unavailable"

        cattleBandAggregate -> cattleBandHal "Accesses device state and hardware"
        cattleTelemetryProcessor -> cattleBandHal "Reads normalized temperature, movement and GPS data"
        cattleBandHal -> cattleBandHardwareAcl "Uses hardware-specific drivers"
        cattleBandHardwareAcl -> cattleBandHardware "Reads physical sensors and GPS/GNSS module"

        bandConnectivityService -> bandCloudAdapter "Uses cloud route when Wi-Fi and Internet are available"
        bandConnectivityService -> bandBleAdapter "Uses BLE route when cloud connectivity is unavailable"
        bandCloudAdapter -> backend "Envía telemetría directamente a la nube" "HTTPS / JSON"
        bandBleAdapter -> edgeGateway "Sends cattle telemetry to the Portable Edge Gateway" "Bluetooth Low Energy"

        // Figura 4.9: pasarela de borde.

        bleDeviceInterface -> edgeTelemetryCollectionService "Provides telemetry received from cattle bands"
        edgeTelemetryCollectionService -> localMonitoringService "Evaluates critical offline monitoring rules"
        edgeTelemetryCollectionService -> edgeTelemetryAggregate "Creates and updates local telemetry state"
        edgeTelemetryCollectionService -> edgeRepository "Stores received telemetry"

        localMonitoringService -> localAlertAdapter "Requests local alert when a critical condition is detected"
        localMonitoringService -> edgeRepository "Loads cached cattle mappings, thresholds and geofences"
        localAlertAdapter -> mobileApplication "Delivers local fever or geofence alert" "Local Wi-Fi"

        edgeSyncOrchestrator -> edgeRepository "Loads pending telemetry and stores synchronized configuration"
        edgeSyncOrchestrator -> ichuCloudApiAcl "Requests upload of pending telemetry and download of monitoring configuration"

        edgeRepository -> edgeDatabase "Persists telemetry, rules, mappings and synchronization state" "SQLite"
        ichuCloudApiAcl -> backend "Synchronizes telemetry, assignments, thresholds and geofences" "HTTPS / JSON"

        // Figura 4.10: firmware del controlador del abrevadero.

        waterControlInterface -> waterControlApplicationService "Starts temperature monitoring"
        waterControlApplicationService -> waterControllerAggregate "Updates controller state"
        waterControlApplicationService -> temperatureRegulationService "Requests temperature regulation evaluation"
        waterControlApplicationService -> waterControllerLocalBuffer "Buffers events while cloud connectivity is unavailable"
        waterControlApplicationService -> waterCloudAdapter "Reports temperature and actuator events"

        temperatureRegulationService -> waterControllerAggregate "Updates heating state"
        temperatureRegulationService -> waterControllerHal "Reads temperature and controls heating actuator"
        waterControllerAggregate -> waterControllerHal "Executes device state changes"
        waterControllerHal -> waterControllerHardwareAcl "Uses hardware-specific drivers"
        waterControllerHardwareAcl -> waterControllerHardware "Reads temperature sensor and operates heating actuator"
        waterCloudAdapter -> backend "Reports water telemetry and actuator events" "HTTPS / JSON"

        production = deploymentEnvironment "Production" {
            deploymentNode "Ranch / Grazing Environment" {
                deploymentNode "Cattle Band Device" {
                    technology "ESP32 + Wi-Fi + Bluetooth Low Energy"
                    containerInstance cattleBandEmbeddedApp
                }

                deploymentNode "Water Temperature Controller Device" {
                    technology "ESP32 + Wi-Fi"
                    containerInstance waterControllerEmbeddedApp
                }

                deploymentNode "Portable Edge Gateway Device" {
                    technology "Raspberry Pi or similar portable Edge computer with BLE and Wi-Fi"
                    containerInstance edgeGateway
                    containerInstance edgeDatabase
                }

                deploymentNode "Mobile User Device" {
                    technology "Android / iOS"
                    containerInstance mobileApplication
                    containerInstance mobileCacheDatabase
                }
            }

            deploymentNode "User Computer" {
                deploymentNode "Web Browser" {
                    technology "HTML, CSS and JavaScript execution"
                    containerInstance landingPageUxUi
                    containerInstance webApplication
                    containerInstance spa
                }
            }

            deploymentNode "Cloud Platform" {
                deploymentNode "Angular Application Web Hosting" {
                    technology "HTTPS static file hosting"
                }

                deploymentNode ".NET Application Runtime" {
                    technology ".NET / ASP.NET Core"
                    containerInstance backend
                }

                deploymentNode "PostgreSQL Database Host" {
                    technology "PostgreSQL"
                    containerInstance cloudDatabase
                }
            }

            deploymentNode "External Service Providers" {
                deploymentNode "Firebase Services" {
                    technology "Google Firebase"
                    softwareSystemInstance firebaseMessaging
                }

                deploymentNode "Map Service Provider" {
                    technology "Managed HTTPS service"
                    softwareSystemInstance mapProvider
                }

                deploymentNode "Payment Service Provider" {
                    technology "Managed HTTPS service"
                    softwareSystemInstance paymentProvider
                }
            }
        }
    }

    views {
        systemLandscape "SystemLandscape" {
            title "ICHU - System Landscape"
            description "People, devices and external services surrounding the solution"
            include *
            autoLayout lr
        }

        systemContext ichu "SystemContext" {
            title "ICHU - System Context"
            description "Users, IoT hardware and external services interacting with ICHU"

            include ichu
            include ranchManager
            include fieldOperator
            include veterinarian
            include visitor
            include cattleBandHardware
            include waterControllerHardware
            include ledHardwareDisplay
            include firebaseMessaging
            include mapProvider
            include paymentProvider

            autoLayout lr
        }

        container ichu "ContainerDiagram" {
            title "ICHU - Container Diagram"
            description "Browser clients, static hosting, mobile, IoT, Edge, Web Service and databases"

            include *

            autoLayout lr
        }

        deployment * "Production" "ProductionDeployment" {
            title "ICHU - Production Deployment"
            description "Static hosting is separated from browser execution, Edge and cloud services"

            include *

            autoLayout lr
        }

        // Figuras 4.7 a 4.13: vistas añadidas desde las siete capturas.

        component backend "OperationsMonitoringComponents" {
            title "Figura 4.7. Componentes del módulo Operations & Monitoring"
            description "Elaboración propia con Structurizr."

            include telemetryApi
            include operationsApi
            include edgeConfigurationApi
            include telemetryIngestionService
            include operationsApplicationService
            include edgeConfigurationService
            include monitoringAggregate
            include livestockOperationAggregate
            include cattleLookupAcl
            include iotAssetsLookupAcl
            include monitoringRulesDomainService
            include monitoringRepository
            include cattleApplicationService
            include iotAssetsApplicationService
            include internalDomainEventDispatcher
            include firebaseMessagingAdapter

            include cloudDatabase
            include firebaseMessaging

            autoLayout lr
        }

        component cattleBandEmbeddedApp "CattleBandComponents" {
            title "Figura 4.8. Componentes del firmware del collar inteligente"
            description "Elaboración propia con Structurizr."

            include bandTelemetryInterface
            include bandTelemetryService
            include cattleBandAggregate
            include cattleTelemetryProcessor
            include bandConnectivityService
            include cattleBandHal
            include cattleBandHardwareAcl
            include bandCloudAdapter
            include bandBleAdapter
            include cattleBandLocalBuffer

            include cattleBandHardware
            include backend
            include edgeGateway

            autoLayout lr
        }

        component edgeGateway "EdgeGatewayComponents" {
            title "Figura 4.9. Componentes de la pasarela de borde"
            description "Elaboración propia con Structurizr."

            include bleDeviceInterface
            include edgeTelemetryCollectionService
            include localMonitoringService
            include edgeTelemetryAggregate
            include edgeSyncOrchestrator
            include localAlertAdapter
            include edgeRepository
            include ichuCloudApiAcl

            include mobileApplication
            include cattleBandEmbeddedApp
            include edgeDatabase
            include backend

            autoLayout lr
        }

        component waterControllerEmbeddedApp "WaterControllerComponents" {
            title "Figura 4.10. Componentes del firmware del controlador del abrevadero"
            description "Elaboración propia con Structurizr."

            include waterControlInterface
            include waterControlApplicationService
            include temperatureRegulationService
            include waterControllerAggregate
            include waterControllerHal
            include waterControllerHardwareAcl
            include waterControllerLocalBuffer
            include waterCloudAdapter

            include waterControllerHardware
            include backend

            autoLayout lr
        }

        dynamic ichu "ConnectedCattleMonitoringFlow" {
            title "Figura 4.11. Flujo completo cuando el collar tiene cobertura"
            description "Elaboración propia con Structurizr."

            cattleBandEmbeddedApp -> backend "1. Sends temperature, movement and GPS telemetry through Wi-Fi"
            backend -> cloudDatabase "2. Stores telemetry and monitoring state"
            backend -> firebaseMessaging "3. Requests push notification when a critical rule is detected"
            firebaseMessaging -> mobileApplication "4. Delivers cattle alert to the user"

            autoLayout lr
        }

        dynamic ichu "OfflineGrazingFlow" {
            title "Figura 4.12. Flujo completo durante el pastoreo sin cobertura"
            description "Elaboración propia con Structurizr."

            cattleBandEmbeddedApp -> edgeGateway "1. Sends telemetry through Bluetooth Low Energy"
            edgeGateway -> edgeDatabase "2. Stores telemetry and uses cached monitoring configuration"
            edgeGateway -> mobileApplication "3. Delivers local fever or geofence alerts"

            autoLayout lr
        }

        dynamic ichu "EdgeGatewaySynchronization" {
            title "Figura 4.13. Sincronización al recuperar la conexión"
            description "Elaboración propia con Structurizr."

            edgeGateway -> backend "1. Uploads telemetry collected during offline grazing and requests updated configuration"
            backend -> cloudDatabase "2. Stores synchronized telemetry"
            backend -> firebaseMessaging "3. Requests cloud notifications when required"
            firebaseMessaging -> mobileApplication "4. Delivers cloud notification"

            autoLayout lr
        }

        styles {
            element "Element" {
                shape RoundedBox
            }

            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }

            element "Visitor" {
                shape Person
                background #777777
                color #ffffff
            }

            element "Software System" {
                background #1168bd
                color #ffffff
            }

            element "Container" {
                background #438dd5
                color #ffffff
            }

            element "Monolith" {
                background #277da1
                color #ffffff
            }

            element "Database" {
                shape Cylinder
                background #f4a261
                color #000000
            }

            element "Hardware" {
                background #666666
                color #ffffff
            }

            element "External" {
                background #999999
                color #ffffff
            }

            element "IoT" {
                background #168aad
                color #ffffff
            }

            element "Edge" {
                background #2a9d8f
                color #ffffff
            }

            element "BrowserClient" {
                shape WebBrowser
            }

            element "WebApplicationFolder" {
                shape Folder
            }

            element "LandingPageUxUi" {
                shape WebBrowser
                background #3a86ff
                color #ffffff
            }

            element "StaticHosting" {
                shape Box
                background #35689c
                color #ffffff
            }

            element "Mobile" {
                shape MobileDeviceLandscape
            }

            element "Component" {
                background #85bbf0
                color #000000
            }

            element "Interface" {
                background #fff2cc
                color #000000
            }

            element "Application" {
                background #cfe2f3
                color #000000
            }

            element "DomainAggregate" {
                background #d9ead3
                color #000000
            }

            element "DomainService" {
                background #d0e0e3
                color #000000
            }

            element "Infrastructure" {
                background #f4cccc
                color #000000
            }

            element "ACL" {
                shape Component
                background #f8f8f8
                stroke #cccccc
                color #000000
            }
        }
    }
}