component backend "OperationsMonitoringComponents" {
    title "Componentes del módulo Operations & Monitoring"
    description "Elaboración propia con Structurizr."
    include "element.tag==BC:OperationsMonitoring"
    include beCattleInformationCattleLookup
    include beCattleInformationContextFacade
    include beIamContextFacade
    include beIoTAssetsContextFacade
    include cloudDatabase
    autoLayout lr
}

component backend "CattleInformationComponents" {
    title "Componentes del módulo Cattle Information"
    description "Elaboración propia con Structurizr."
    include "element.tag==BC:CattleInformation"
    include beIamContextFacade
    include beIoTAssetsContextFacade
    include beOperationsMonitoringContextFacade
    include cloudDatabase
    autoLayout lr
}

component backend "IoTAssetsComponents" {
    title "Componentes del módulo IoT Assets"
    description "Elaboración propia con Structurizr."
    include "element.tag==BC:IoTAssets"
    include beCattleInformationContextFacade
    include beIamContextFacade
    include beSubscriptionPlansContextFacade
    include cloudDatabase
    autoLayout lr
}

component backend "PlanningComponents" {
    title "Componentes del módulo Planning"
    description "Elaboración propia con Structurizr."
    include "element.tag==BC:Planning"
    include beCattleInformationContextFacade
    include beIamContextFacade
    include beOperationsMonitoringContextFacade
    include cloudDatabase
    autoLayout lr
}

component backend "DashboardAnalyticsComponents" {
    title "Componentes del módulo Dashboard & Analytics"
    description "Elaboración propia con Structurizr."
    include "element.tag==BC:DashboardAnalytics"
    include beCattleInformationContextFacade
    include beIamContextFacade
    include beOperationsMonitoringContextFacade
    include beSubscriptionPlansContextFacade
    autoLayout lr
}

component backend "IamComponents" {
    title "Componentes del módulo Identity & Access Management"
    description "Elaboración propia con Structurizr."
    include "element.tag==BC:Iam"
    include cloudDatabase
    include firebaseAuthentication
    autoLayout lr
}

component backend "SubscriptionPlansComponents" {
    title "Componentes del módulo Subscription Plans"
    description "Elaboración propia con Structurizr."
    include "element.tag==BC:SubscriptionPlans"
    include beIamContextFacade
    include cloudDatabase
    include paymentProvider
    autoLayout lr
}
