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
            description "ESP32-S3 collar with temperature, motion, GPS, pulse and methane sensors and Wi-Fi"
            tags "External,Hardware"
        }

        alertPanelHardware = softwareSystem "Alert Panel Hardware" {
            description "ESP32 board with a 16x2 LCD, three LEDs and a buzzer installed at the ranch"
            tags "External,Hardware"
        }

        firebaseAuthentication = softwareSystem "Firebase Authentication" {
            description "External identity provider that signs users in and issues ID tokens"
            tags "External"
        }

        mapProvider = softwareSystem "OpenStreetMap Tile Service" {
            description "External map tiles used to show positions and geofences"
            tags "External"
        }

        paymentProvider = softwareSystem "Stripe" {
            description "External payment service with hosted Checkout pages and signed webhooks"
            tags "External"
        }

        ichu = softwareSystem "ICHU" {
            description "Livestock management IoT platform"

            landingPageUxUi = container "Website" {
                technology "HTML + CSS + JavaScript"
                description "Static landing page with the value proposition, plans and links to the web application"
                tags "WebApplicationFolder"
            }

            webApplication = container "Web Application" {
                technology "HTML + CSS + JavaScript"
                description "Compiled files of the Angular application, served over HTTPS"
                tags "WebApplicationFolder"
            }

            spa = container "Single Page Application" {
                technology "Angular + TypeScript"
                description "Browser application to manage cattle, devices, planning, analytics and subscriptions"
                tags "BrowserClient"
            }

            mobileApplication = container "Mobile Application" {
                technology "Flutter + Dart"
                description "Field app for cattle, telemetry and alerts, with local notifications for new alerts"
                tags "Mobile"
            }

            cattleBandEmbeddedApp = container "Cattle Band Embedded Application" {
                technology "C++ on ESP32-S3, Modest IoT Nano Framework"
                description "Collar firmware that reads the sensors and sends one reading every 10 s to the Edge API"
                tags "IoT"

                collarSketch = component "Composition Root" {
                    technology "sketch.ino"
                    description "Builds the device and starts the framework tasks; loop() only yields"
                    tags "Interface"
                }

                collarDevice = component "Collar Device" {
                    technology "C++ / framework Device"
                    description "Mediator that receives sensor events and queues one reading per interval"
                    tags "Application"
                }

                frameworkSensors = component "Framework Sensors" {
                    technology "ImuSensor, GeolocationSensor, GasSensor, PowerManager"
                    description "Motion, GPS, methane index and battery level sampled by the framework scheduler"
                    tags "Infrastructure"
                }

                temperatureProbe = component "Temperature Probe Driver" {
                    technology "DallasTemperature"
                    description "Reads the DS18B20 body temperature probe"
                    tags "Infrastructure"
                }

                heartRateEstimator = component "Heart Rate Estimator" {
                    technology "C++"
                    description "Detects beats in the SP-203 signal and computes the heart rate"
                    tags "DomainService"
                }

                activityIndexCalculator = component "Activity Index Calculator" {
                    technology "C++"
                    description "Computes the activity index from the motion samples"
                    tags "DomainService"
                }

                telemetryReading = component "Telemetry Reading" {
                    technology "C++ value type"
                    description "One reading with optional measurements and the reasons of invalid ones"
                    tags "DomainAggregate"
                }

                telemetryBuffer = component "Telemetry Buffer" {
                    technology "framework TelemetryBuffer + LittleFS"
                    description "Queue of up to 60 readings that wait for a successful send"
                    tags "Infrastructure"
                }

                telemetryPayload = component "Telemetry Payload" {
                    technology "C++ / JSON"
                    description "Builds the JSON body of the Edge API contract"
                    tags "Infrastructure"
                }

                httpGatewayClient = component "HTTP Gateway Client" {
                    technology "framework HttpGatewayClient + WiFiConnectivityDriver"
                    description "Posts the reading with the device key over Wi-Fi"
                    tags "ACL"
                }
            }

            alertPanelEmbeddedApp = container "Alert Panel Embedded Application" {
                technology "C++ on ESP32, Modest IoT Nano Framework"
                description "Panel firmware that polls the Edge API every 3 s and shows the alert state with LEDs, buzzer and LCD"
                tags "IoT"
            }

            edgeGateway = container "Portable Edge Service" {
                technology "Flask + Peewee ORM on Python"
                description "Ranch gateway that stores readings, raises alerts offline and synchronizes with the cloud"
                tags "Edge"

                monitoringBlueprint = component "Monitoring API" {
                    technology "Flask Blueprint + Pydantic"
                    description "POST telemetry-readings, GET alerts and POST synchronizations"
                    tags "Interface"
                }

                synchronizeCommand = component "Synchronize Command" {
                    technology "flask --app app synchronize"
                    description "Runs the synchronization every 15 s and doubles the wait after a failure, up to 5 min"
                    tags "Interface"
                }

                iamAcl = component "IAM Anti-Corruption Layer" {
                    technology "Python"
                    description "Verifies the device key through the IAM context"
                    tags "ACL"
                }

                ingestionService = component "Telemetry Ingestion Service" {
                    technology "Python"
                    description "Validates and stores each reading idempotently and raises its alerts"
                    tags "Application"
                }

                synchronizationService = component "Synchronization Service" {
                    technology "Python"
                    description "Sends pending readings and alerts in batches and refreshes rules and assignments"
                    tags "Application"
                }

                ruleEvaluator = component "Rule Evaluator" {
                    technology "Python domain service"
                    description "Checks thresholds by life stage and severity, and geofences, against the cached rules"
                    tags "DomainService"
                }

                edgeAggregates = component "Monitoring Aggregates" {
                    technology "TelemetryReading, MonitoringAlert, MonitoringRuleSet"
                    description "Readings with their sync status, alerts deduplicated by severity, and the cached rules"
                    tags "DomainAggregate"
                }

                edgeRepositories = component "Peewee Repositories" {
                    technology "Peewee ORM"
                    description "Readings, alerts, rule sets and collar assignments stored in SQLite"
                    tags "Infrastructure"
                }

                cloudAcl = component "ICHU Cloud Anti-Corruption Layer" {
                    technology "Python + requests"
                    description "Translates the camelCase cloud contract into the Monitoring language"
                    tags "ACL"
                }
            }

            edgeDatabase = container "Edge Database" {
                technology "SQLite"
                description "Local readings, alerts, synchronization state and cached rules"
                tags "Database,Edge"
            }

            backend = container "ICHU Web Service" {
                technology "ASP.NET Core Web API"
                description "Cloud REST API implemented as a modular monolith with seven bounded contexts"
                tags "Monolith,API"

                telemetryController = component "Telemetry Controller" {
                    technology "ASP.NET Core Controller"
                    description "Receives edge batches and serves the telemetry history"
                    tags "Interface"
                }

                alertsController = component "Alerts Controller" {
                    technology "ASP.NET Core Controller"
                    description "Lists alerts of a ranch and records their attention"
                    tags "Interface"
                }

                edgeGatewaysController = component "Edge Gateways Controller" {
                    technology "ASP.NET Core Controller"
                    description "Serves the monitoring rules and collar assignments to a gateway"
                    tags "Interface"
                }

                rulesControllers = component "Rules Controllers" {
                    technology "MonitoringThresholdsController, GeofencesController"
                    description "Manage thresholds by life stage and severity, and geofences"
                    tags "Interface"
                }

                edgeSyncService = component "Edge Synchronization Command Service" {
                    technology ".NET"
                    description "Stores readings and alerts of a batch and reports a result per entry"
                    tags "Application"
                }

                alertServices = component "Monitoring Alert Services" {
                    technology ".NET command and query services"
                    description "Query alerts and record their attention"
                    tags "Application"
                }

                ruleSetQueryService = component "Monitoring Rule Set Query Service" {
                    technology ".NET"
                    description "Builds the rule revision that a gateway downloads"
                    tags "Application"
                }

                monitoringAggregates = component "Monitoring Aggregates" {
                    technology "TelemetryReading, MonitoringAlert, MonitoringThreshold, Geofence"
                    description "Aggregates of the Operations & Monitoring context"
                    tags "DomainAggregate"
                }

                ruleRevisionService = component "Monitoring Rule Revision Service" {
                    technology ".NET domain service"
                    description "Computes the rule revision that tells a gateway its cache is outdated"
                    tags "DomainService"
                }

                outboundLookups = component "Context Lookups" {
                    technology "Cattle Information, IoT Assets and IAM facades"
                    description "Resolve cattle, device assignments, gateway keys and ranch permissions"
                    tags "ACL"
                }

                monitoringRepositories = component "Monitoring Repositories" {
                    technology "Entity Framework Core + Npgsql"
                    description "Repositories and unit of work of the monitoring schema"
                    tags "Infrastructure"
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
        cattleBandHardware -> ichu "Provides temperature, movement, position, pulse and methane index"
        ichu -> alertPanelHardware "Shows the alert state at the ranch"
        ichu -> firebaseAuthentication "Signs users in and verifies their tokens"
        ichu -> mapProvider "Displays positions and geofences"
        ichu -> paymentProvider "Charges subscriptions"
        alertPanelHardware -> fieldOperator "Warns about active alerts with LEDs, buzzer and LCD"

        visitor -> landingPageUxUi "Browses the public website" "HTTPS"
        ranchManager -> webApplication "Loads the UI from" "HTTPS"
        ranchManager -> spa "Manages cattle, subscriptions and indicators" "HTTPS"
        veterinarian -> webApplication "Loads the UI from" "HTTPS"
        veterinarian -> spa "Reviews authorized information" "HTTPS"
        veterinarian -> mobileApplication "Reviews authorized cattle during farm visits" "HTTPS"
        fieldOperator -> mobileApplication "Reviews cattle and alerts in the field" "HTTPS"
        landingPageUxUi -> webApplication "Links to the web application" "HTTPS"
        webApplication -> spa "Delivers"
        spa -> firebaseAuthentication "Signs the user in" "HTTPS"
        mobileApplication -> firebaseAuthentication "Signs the user in" "HTTPS"
        spa -> mapProvider "Loads map tiles" "HTTPS"
        spa -> backend "Calls the REST API with the Firebase ID token" "HTTPS / JSON"
        spa -> paymentProvider "Redirects the manager to the hosted Checkout page" "HTTPS"
        mobileApplication -> backend "Calls the REST API and polls pending alerts every 30 s" "HTTPS / JSON"
        cattleBandEmbeddedApp -> cattleBandHardware "Reads sensors, position and battery"
        cattleBandEmbeddedApp -> edgeGateway "POST /api/v1/monitoring/telemetry-readings with the device key" "HTTP / JSON over Wi-Fi"
        alertPanelEmbeddedApp -> edgeGateway "GET /api/v1/monitoring/alerts every 3 s" "HTTP / JSON over Wi-Fi"
        alertPanelEmbeddedApp -> alertPanelHardware "Drives the LEDs, buzzer and LCD" "GPIO / I2C"
        edgeGateway -> edgeDatabase "Stores readings, alerts and cached rules" "SQLite"
        edgeGateway -> backend "Synchronizes pending records and downloads rules and assignments" "HTTPS / JSON"
        backend -> cloudDatabase "Reads and writes cloud data" "Entity Framework Core / Npgsql"
        backend -> firebaseAuthentication "Verifies ID tokens" "HTTPS"
        backend -> paymentProvider "Creates Checkout sessions" "HTTPS"
        paymentProvider -> backend "Sends signed payment events" "HTTPS webhook"

        // Figura 4.7: Operations & Monitoring.
        edgeGateway -> telemetryController "POST /api/v1/telemetry/batch" "HTTPS / JSON"
        edgeGateway -> edgeGatewaysController "Downloads rules and collar assignments" "HTTPS / JSON"
        spa -> alertsController "Lists and attends alerts" "HTTPS / JSON"
        mobileApplication -> alertsController "Polls pending alerts" "HTTPS / JSON"
        spa -> rulesControllers "Manages thresholds and geofences" "HTTPS / JSON"
        telemetryController -> edgeSyncService "Invokes"
        alertsController -> alertServices "Invokes"
        edgeGatewaysController -> ruleSetQueryService "Invokes"
        rulesControllers -> monitoringRepositories "Stores thresholds and geofences"
        edgeSyncService -> outboundLookups "Authenticates the gateway and resolves collar assignments"
        edgeSyncService -> monitoringAggregates "Creates readings and alerts"
        edgeSyncService -> monitoringRepositories "Stores the batch"
        alertServices -> outboundLookups "Checks ranch permissions"
        alertServices -> monitoringAggregates "Records the attention of an alert"
        alertServices -> monitoringRepositories "Loads and stores alerts"
        ruleSetQueryService -> ruleRevisionService "Computes the rule revision"
        ruleSetQueryService -> monitoringRepositories "Loads thresholds and geofences"
        monitoringRepositories -> cloudDatabase "Reads and writes the monitoring schema" "Entity Framework Core / Npgsql"

        // Figura 4.8: firmware del collar inteligente.
        collarSketch -> collarDevice "Builds and starts"
        frameworkSensors -> collarDevice "Notifies sensor events"
        collarDevice -> temperatureProbe "Reads body temperature"
        collarDevice -> heartRateEstimator "Requests the heart rate"
        collarDevice -> activityIndexCalculator "Requests the activity index"
        collarDevice -> telemetryReading "Builds one reading per interval"
        collarDevice -> telemetryBuffer "Queues the reading"
        collarDevice -> telemetryPayload "Builds the request body"
        collarDevice -> httpGatewayClient "Sends the queued reading"
        frameworkSensors -> cattleBandHardware "Samples the MPU-6050, NEO-6M, MQ-2 and battery"
        temperatureProbe -> cattleBandHardware "Reads the DS18B20"
        heartRateEstimator -> cattleBandHardware "Samples the SP-203"
        httpGatewayClient -> monitoringBlueprint "POST /api/v1/monitoring/telemetry-readings" "HTTP / JSON over Wi-Fi"

        // Figura 4.9: pasarela de borde.
        alertPanelEmbeddedApp -> monitoringBlueprint "GET /api/v1/monitoring/alerts" "HTTP / JSON over Wi-Fi"
        monitoringBlueprint -> iamAcl "Authenticates the device key"
        monitoringBlueprint -> ingestionService "Submits the reading"
        synchronizeCommand -> synchronizationService "Runs a synchronization"
        ingestionService -> ruleEvaluator "Evaluates the reading"
        ingestionService -> edgeAggregates "Creates the reading and its alerts"
        ingestionService -> edgeRepositories "Stores the reading and alerts"
        ruleEvaluator -> edgeRepositories "Loads the cached rules and assignment"
        synchronizationService -> edgeRepositories "Loads pending records and stores refreshed rules"
        synchronizationService -> cloudAcl "Uploads batches and downloads rules"
        edgeRepositories -> edgeDatabase "Persists the monitoring data" "SQLite"
        cloudAcl -> backend "Synchronizes readings, alerts, rules and assignments" "HTTPS / JSON"

        production = deploymentEnvironment "Production" {
            deploymentNode "Ranch / Grazing Environment" {
                deploymentNode "Cattle Band Device" {
                    technology "ESP32-S3 DevKitC-1 + Wi-Fi"
                    containerInstance cattleBandEmbeddedApp
                }

                deploymentNode "Alert Panel Device" {
                    technology "ESP32 DevKitC + Wi-Fi"
                    containerInstance alertPanelEmbeddedApp
                }

                deploymentNode "Portable Edge Gateway Device" {
                    technology "Raspberry Pi or similar Linux computer with Wi-Fi"
                    containerInstance edgeGateway
                    containerInstance edgeDatabase
                }

                deploymentNode "Mobile User Device" {
                    technology "Android / iOS"
                    containerInstance mobileApplication
                }
            }

            deploymentNode "User Computer" {
                deploymentNode "Web Browser" {
                    technology "HTML, CSS and JavaScript execution"
                    containerInstance spa
                }
            }

            deploymentNode "GitHub Pages" {
                technology "Static HTTPS hosting"
                containerInstance landingPageUxUi
            }

            deploymentNode "Firebase Hosting" {
                technology "Static HTTPS hosting"
                containerInstance webApplication
            }

            deploymentNode "Render" {
                deploymentNode "Web Service" {
                    technology "Docker container with ASP.NET Core"
                    containerInstance backend
                }

                deploymentNode "Render PostgreSQL" {
                    technology "Managed PostgreSQL"
                    containerInstance cloudDatabase
                }
            }

            deploymentNode "External Service Providers" {
                deploymentNode "Google Firebase" {
                    technology "Managed identity service"
                    softwareSystemInstance firebaseAuthentication
                }

                deploymentNode "Stripe Platform" {
                    technology "Managed payment service"
                    softwareSystemInstance paymentProvider
                }

                deploymentNode "OpenStreetMap" {
                    technology "Public tile servers"
                    softwareSystemInstance mapProvider
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
            include *
            autoLayout lr
        }

        container ichu "ContainerDiagram" {
            title "ICHU - Container Diagram"
            description "Browser clients, static hosting, mobile, embedded, Edge, Web Service and databases"
            include *
            autoLayout lr
        }

        deployment * "Production" "ProductionDeployment" {
            title "ICHU - Production Deployment"
            description "Ranch devices, static hosting, Render and external providers"
            include *
            autoLayout lr
        }

        // Figuras 4.7 a 4.12: vistas de componentes y flujos dinámicos.
        component backend "OperationsMonitoringComponents" {
            title "Figura 4.7. Componentes del módulo Operations & Monitoring"
            description "Elaboración propia con Structurizr."
            include *
            autoLayout lr
        }

        component cattleBandEmbeddedApp "CattleBandComponents" {
            title "Figura 4.8. Componentes del firmware del collar inteligente"
            description "Elaboración propia con Structurizr."
            include *
            autoLayout lr
        }

        component edgeGateway "EdgeGatewayComponents" {
            title "Figura 4.9. Componentes de la pasarela de borde"
            description "Elaboración propia con Structurizr."
            include *
            autoLayout lr
        }

        dynamic ichu "ConnectedCattleMonitoringFlow" {
            title "Figura 4.10. Flujo completo cuando el gateway tiene Internet"
            description "Elaboración propia con Structurizr."
            cattleBandEmbeddedApp -> edgeGateway "1. Sends a reading every 10 s over local Wi-Fi"
            edgeGateway -> edgeDatabase "2. Stores the reading and the alerts raised by the cached rules"
            edgeGateway -> backend "3. Sends pending readings and alerts in the next 15 s batch"
            backend -> cloudDatabase "4. Stores telemetry and alerts"
            mobileApplication -> backend "5. Finds the new alert in its 30 s poll and shows a local notification"
            autoLayout lr
        }

        dynamic ichu "OfflineGrazingFlow" {
            title "Figura 4.11. Flujo completo durante el pastoreo sin cobertura"
            description "Elaboración propia con Structurizr."
            cattleBandEmbeddedApp -> edgeGateway "1. Sends a reading over local Wi-Fi"
            edgeGateway -> edgeDatabase "2. Stores the reading and raises alerts with the cached rules"
            alertPanelEmbeddedApp -> edgeGateway "3. Reads the active alerts every 3 s"
            alertPanelEmbeddedApp -> alertPanelHardware "4. Turns on the LED and buzzer of the alert level"
            autoLayout lr
        }

        dynamic ichu "EdgeGatewaySynchronization" {
            title "Figura 4.12. Sincronización al recuperar la conexión"
            description "Elaboración propia con Structurizr."
            edgeGateway -> backend "1. Uploads pending readings and alerts in batches and downloads rules and collar assignments"
            backend -> cloudDatabase "2. Stores the synchronized records"
            mobileApplication -> backend "3. Reads the synchronized alerts"
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
