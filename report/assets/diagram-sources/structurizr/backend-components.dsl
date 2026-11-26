// Generated from the ichu-web-service code: one component per controller, service, facade, adapter and repository.
beOperationsMonitoringContextFacade = component "OperationsMonitoringContextFacade" {
    technology ".NET context facade"
    description "Implements the read contract of the context over the monitoring repositories."
    tags "ACL,BC:OperationsMonitoring"
}

beEdgeSynchronizationCommandService = component "EdgeSynchronizationCommandService" {
    technology ".NET command service"
    description "Synchronizes the batches sent by Edge Gateways."
    tags "Application,BC:OperationsMonitoring"
}

beGeofenceCommandService = component "GeofenceCommandService" {
    technology ".NET command service"
    description "Defines and redefines the geofences of a ranch."
    tags "Application,BC:OperationsMonitoring"
}

beLivestockOperationCommandService = component "LivestockOperationCommandService" {
    technology ".NET command service"
    description "Registers field events, clinical interventions and the offline batches of the mobile application."
    tags "Application,BC:OperationsMonitoring"
}

beMonitoringAlertCommandService = component "MonitoringAlertCommandService" {
    technology ".NET command service"
    description "Attends alerts and synchronizes the alerts and alert changes sent by Edge Gateways."
    tags "Application,BC:OperationsMonitoring"
}

beMonitoringThresholdCommandService = component "MonitoringThresholdCommandService" {
    technology ".NET command service"
    description "Configures the thresholds of a ranch."
    tags "Application,BC:OperationsMonitoring"
}

beTelemetryReadingCommandService = component "TelemetryReadingCommandService" {
    technology ".NET command service"
    description "Synchronizes the readings relayed by Edge Gateways."
    tags "Application,BC:OperationsMonitoring"
}

beWaterTroughReadingCommandService = component "WaterTroughReadingCommandService" {
    technology ".NET command service"
    description ""
    tags "Application,BC:OperationsMonitoring"
}

beCattleInformationCattleLookup = component "CattleInformationCattleLookup" {
    technology ".NET outbound service"
    description "Resolves animals and lots through the Cattle Information facade, so that IoT Assets never holds Cattle entities."
    tags "ACL,BC:IoTAssets"
}

beIamOperationsMonitoringAccessControl = component "IamOperationsMonitoringAccessControl" {
    technology ".NET outbound service"
    description "Implements with the IAM context facade, translating each monitoring permission to the IAM access scope that grants it."
    tags "ACL,BC:OperationsMonitoring"
}

beIoTAssetsDeviceAttributionLookup = component "IoTAssetsDeviceAttributionLookup" {
    technology ".NET outbound service"
    description "Attributes a reading through the IoT Assets facade, which knows the assignment that covered the capture instant."
    tags "ACL,BC:OperationsMonitoring"
}

beIoTAssetsEdgeDeviceAssignmentLookup = component "IoTAssetsEdgeDeviceAssignmentLookup" {
    technology ".NET outbound service"
    description "Joins the collars that IoT Assets assigns to animals with the active animals of Cattle Information, so that the collars of exited animals are left out"
    tags "ACL,BC:OperationsMonitoring"
}

beEdgeDeviceAssignmentQueryService = component "EdgeDeviceAssignmentQueryService" {
    technology ".NET query service"
    description "Publishes the collar assignments of a ranch to its Edge Gateways, under the same gateway checks as the monitoring rules."
    tags "Application,BC:OperationsMonitoring"
}

beGeofenceQueryService = component "GeofenceQueryService" {
    technology ".NET query service"
    description "Reads the geofences of a ranch for accounts that may read its monitoring."
    tags "Application,BC:OperationsMonitoring"
}

beLivestockOperationQueryService = component "LivestockOperationQueryService" {
    technology ".NET query service"
    description "Reads the livestock operations of an animal for accounts that may read its monitoring."
    tags "Application,BC:OperationsMonitoring"
}

beMonitoringAlertQueryService = component "MonitoringAlertQueryService" {
    technology ".NET query service"
    description "Reads the alerts of a ranch for accounts that may read its monitoring."
    tags "Application,BC:OperationsMonitoring"
}

beMonitoringRuleSetQueryService = component "MonitoringRuleSetQueryService" {
    technology ".NET query service"
    description "Publishes the rules of a ranch to its Edge Gateways by revision."
    tags "Application,BC:OperationsMonitoring"
}

beMonitoringThresholdQueryService = component "MonitoringThresholdQueryService" {
    technology ".NET query service"
    description "Reads the thresholds of a ranch for accounts that may read its monitoring."
    tags "Application,BC:OperationsMonitoring"
}

beReproductiveHistoryQueryService = component "ReproductiveHistoryQueryService" {
    technology ".NET query service"
    description "Reads the reproductive history of an animal for accounts that may read its ranch monitoring."
    tags "Application,BC:OperationsMonitoring"
}

beTelemetryReadingQueryService = component "TelemetryReadingQueryService" {
    technology ".NET query service"
    description "Reads the telemetry of an animal for accounts that may read its monitoring."
    tags "Application,BC:OperationsMonitoring"
}

beWaterTroughMonitoringQueryService = component "WaterTroughMonitoringQueryService" {
    technology ".NET query service"
    description ""
    tags "Application,BC:OperationsMonitoring"
}

beMonitoringRuleRevisionService = component "MonitoringRuleRevisionService" {
    technology ".NET domain service"
    description "Advances rule revisions through the rule set repository."
    tags "DomainService,BC:OperationsMonitoring"
}

beReproductiveHistoryCalculator = component "ReproductiveHistoryCalculator" {
    technology ".NET domain service"
    description "Derives the breeding history of a female."
    tags "DomainService,BC:OperationsMonitoring"
}

beIoTAssetsEdgeGatewayAuthenticator = component "IoTAssetsEdgeGatewayAuthenticator" {
    technology ".NET adapter"
    description "Reads the gateway key of the request and verifies it through the IoT Assets facade, which owns the gateway keys."
    tags "Infrastructure,BC:OperationsMonitoring"
}

beGeofenceRepository = component "GeofenceRepository" {
    technology "Entity Framework Core repository"
    description "Stores geofences with Entity Framework Core."
    tags "Infrastructure,BC:OperationsMonitoring"
}

beLivestockOperationRepository = component "LivestockOperationRepository" {
    technology "Entity Framework Core repository"
    description "Stores livestock operations with Entity Framework Core."
    tags "Infrastructure,BC:OperationsMonitoring"
}

beMonitoringAlertRepository = component "MonitoringAlertRepository" {
    technology "Entity Framework Core repository"
    description "Stores monitoring alerts with Entity Framework Core."
    tags "Infrastructure,BC:OperationsMonitoring"
}

beMonitoringRuleSetRepository = component "MonitoringRuleSetRepository" {
    technology "Entity Framework Core repository"
    description "Stores the rule revision counters of ranches with Entity Framework Core."
    tags "Infrastructure,BC:OperationsMonitoring"
}

beMonitoringThresholdRepository = component "MonitoringThresholdRepository" {
    technology "Entity Framework Core repository"
    description "Stores the thresholds of ranches with Entity Framework Core."
    tags "Infrastructure,BC:OperationsMonitoring"
}

beTelemetryReadingRepository = component "TelemetryReadingRepository" {
    technology "Entity Framework Core repository"
    description "Stores telemetry readings with Entity Framework Core."
    tags "Infrastructure,BC:OperationsMonitoring"
}

beWaterTroughReadingRepository = component "WaterTroughReadingRepository" {
    technology "Entity Framework Core repository"
    description ""
    tags "Infrastructure,BC:OperationsMonitoring"
}

beAlertsController = component "AlertsController" {
    technology "ASP.NET Core Controller"
    description "Lists the alerts of ranches and records the attention that authorized users give them."
    tags "Interface,BC:OperationsMonitoring"
}

beEdgeGatewaysController = component "EdgeGatewaysController" {
    technology "ASP.NET Core Controller"
    description "Publishes the monitoring rules and collar assignments to Edge Gateways."
    tags "Interface,BC:OperationsMonitoring"
}

beGeofencesController = component "GeofencesController" {
    technology "ASP.NET Core Controller"
    description "Defines, redefines and lists the geofences of lots."
    tags "Interface,BC:OperationsMonitoring"
}

beLivestockOperationsController = component "LivestockOperationsController" {
    technology "ASP.NET Core Controller"
    description "Registers field events and clinical interventions, synchronizes offline mobile batches, lists the operations of animals and exposes their reproductive"
    tags "Interface,BC:OperationsMonitoring"
}

beMonitoringThresholdsController = component "MonitoringThresholdsController" {
    technology "ASP.NET Core Controller"
    description "Configures and lists the normal ranges that ranches set for each life stage and metric."
    tags "Interface,BC:OperationsMonitoring"
}

beTelemetryController = component "TelemetryController" {
    technology "ASP.NET Core Controller"
    description "Receives the telemetry that Edge Gateways synchronize and returns the readings and latest indicators of animals."
    tags "Interface,BC:OperationsMonitoring"
}

beWaterControllersController = component "WaterControllersController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:OperationsMonitoring"
}

beWaterTroughMonitoringController = component "WaterTroughMonitoringController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:OperationsMonitoring"
}

beCattleInformationContextFacade = component "CattleInformationContextFacade" {
    technology ".NET context facade"
    description "Serves cross-context animal and lot queries behind the caller's ranch read access and returns immutable snapshots."
    tags "ACL,BC:CattleInformation"
}

beCattleCommandService = component "CattleCommandService" {
    technology ".NET command service"
    description "Checks access and the ear tag rule here and leaves the lifecycle rules to the aggregate."
    tags "Application,BC:CattleInformation"
}

beLotCommandService = component "LotCommandService" {
    technology ".NET command service"
    description "Changes lot membership after checking access."
    tags "Application,BC:CattleInformation"
}

beIamCattleAccessService = component "IamCattleAccessService" {
    technology ".NET outbound service"
    description "Implements with the IAM context facade, mapping the read and manage checks to the IAM access scopes that grant them."
    tags "ACL,BC:CattleInformation"
}

beIoTAssetsCattleProfileIntegrationService = component "IoTAssetsCattleProfileIntegrationService" {
    technology ".NET outbound service"
    description "Combines the current collar of an animal from IoT Assets with its last received reading from Operations and Monitoring."
    tags "ACL,BC:CattleInformation"
}

beCattleQueryService = component "CattleQueryService" {
    technology ".NET query service"
    description "Composes authorized animal profiles from local identity and external device data without storing copies."
    tags "Application,BC:CattleInformation"
}

beLotQueryService = component "LotQueryService" {
    technology ".NET query service"
    description "Checks ranch read access before retrieving lots and their stored memberships."
    tags "Application,BC:CattleInformation"
}

beCattleRepository = component "CattleRepository" {
    technology "Entity Framework Core repository"
    description "Tracks animals and their stage history in the shared context, filtering every query by ranch."
    tags "Infrastructure,BC:CattleInformation"
}

beLotRepository = component "LotRepository" {
    technology "Entity Framework Core repository"
    description "Tracks ranch lots and their memberships in the shared context, with a trusted lookup for a lot's owning ranch."
    tags "Infrastructure,BC:CattleInformation"
}

beCattleController = component "CattleController" {
    technology "ASP.NET Core Controller"
    description "Exposes ranch-authorized animal registration, profiles and lifecycle changes."
    tags "Interface,BC:CattleInformation"
}

beLotsController = component "LotsController" {
    technology "ASP.NET Core Controller"
    description "Exposes ranch-authorized management groups and membership changes without owning animal identity."
    tags "Interface,BC:CattleInformation"
}

beIoTAssetsContextFacade = component "IoTAssetsContextFacade" {
    technology ".NET context facade"
    description "Serves device facts to other contexts behind the caller's ranch access, as snapshots that expose plain identifiers."
    tags "ACL,BC:IoTAssets"
}

beDeviceCommandService = component "DeviceCommandService" {
    technology ".NET command service"
    description "Coordinates device changes."
    tags "Application,BC:IoTAssets"
}

beEdgeGatewayCommandService = component "EdgeGatewayCommandService" {
    technology ".NET command service"
    description "Registers and revokes edge gateways."
    tags "Application,BC:IoTAssets"
}

beWaterTroughCommandService = component "WaterTroughCommandService" {
    technology ".NET command service"
    description ""
    tags "Application,BC:IoTAssets"
}

beCattleDeactivatedEventHandler = component "CattleDeactivatedEventHandler" {
    technology ".NET event handler"
    description "Frees the collar of an animal after its exit is saved, so that the device can serve another target."
    tags "Application,BC:IoTAssets"
}

beIamIoTAssetsAccessService = component "IamIoTAssetsAccessService" {
    technology ".NET outbound service"
    description "Implements with the IAM context facade for user requests and with the device repository for edge gateway reports."
    tags "ACL,BC:IoTAssets"
}

beSubscriptionPlansEntitlementAdapter = component "SubscriptionPlansEntitlementAdapter" {
    technology ".NET outbound service"
    description "Turns the subscription entitlements of a ranch into the collar limit that IoT Assets enforces on assignments."
    tags "ACL,BC:IoTAssets"
}

beDeviceQueryService = component "DeviceQueryService" {
    technology ".NET query service"
    description ""
    tags "Application,BC:IoTAssets"
}

beEdgeGatewayQueryService = component "EdgeGatewayQueryService" {
    technology ".NET query service"
    description ""
    tags "Application,BC:IoTAssets"
}

beWaterTroughQueryService = component "WaterTroughQueryService" {
    technology ".NET query service"
    description ""
    tags "Application,BC:IoTAssets"
}

beDeviceAssignmentDomainService = component "DeviceAssignmentDomainService" {
    technology ".NET domain service"
    description "Applies the collar rules that depend on the ranch subscription before a device starts serving a target."
    tags "DomainService,BC:IoTAssets"
}

beEdgeGatewayRepository = component "EdgeGatewayRepository" {
    technology "Entity Framework Core repository"
    description ""
    tags "Infrastructure,BC:IoTAssets"
}

beIoTAssetsTransaction = component "IoTAssetsTransaction" {
    technology "Entity Framework Core repository"
    description ""
    tags "Infrastructure,BC:IoTAssets"
}

beIoTDeviceRepository = component "IoTDeviceRepository" {
    technology "Entity Framework Core repository"
    description ""
    tags "Infrastructure,BC:IoTAssets"
}

beWaterTroughRepository = component "WaterTroughRepository" {
    technology "Entity Framework Core repository"
    description ""
    tags "Infrastructure,BC:IoTAssets"
}

beDeviceAssignmentsController = component "DeviceAssignmentsController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:IoTAssets"
}

beDevicesController = component "DevicesController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:IoTAssets"
}

beRanchEdgeGatewaysController = component "RanchEdgeGatewaysController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:IoTAssets"
}

beWaterTroughsController = component "WaterTroughsController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:IoTAssets"
}

beNutritionPlanCommandService = component "NutritionPlanCommandService" {
    technology ".NET command service"
    description "Registers the nutrition plan of a lot."
    tags "Application,BC:Planning"
}

bePlannedActivityCommandService = component "PlannedActivityCommandService" {
    technology ".NET command service"
    description "Schedules activities, records their applications and schedules their follow-ups."
    tags "Application,BC:Planning"
}

bePlanningCampaignCommandService = component "PlanningCampaignCommandService" {
    technology ".NET command service"
    description "Creates campaigns after checking that the caller may manage the ranch plan."
    tags "Application,BC:Planning"
}

beWithdrawalPeriodCommandService = component "WithdrawalPeriodCommandService" {
    technology ".NET command service"
    description "Records withdrawal periods after checking clinical permission, the animal's ranch and the linked intervention."
    tags "Application,BC:Planning"
}

beCattleInformationPlanningCattleLookup = component "CattleInformationPlanningCattleLookup" {
    technology ".NET outbound service"
    description "Resolves animals through the Cattle Information facade, which hides animals of other ranches as unknown."
    tags "ACL,BC:Planning"
}

beCattleInformationPlanningLotLookup = component "CattleInformationPlanningLotLookup" {
    technology ".NET outbound service"
    description "Resolves a lot's owning ranch through the Cattle Information facade."
    tags "ACL,BC:Planning"
}

beIamPlanningAccessControl = component "IamPlanningAccessControl" {
    technology ".NET outbound service"
    description "Implements with the IAM context facade, translating each planning permission to the IAM access scope that grants it."
    tags "ACL,BC:Planning"
}

beOperationsMonitoringClinicalInterventionLookup = component "OperationsMonitoringClinicalInterventionLookup" {
    technology ".NET outbound service"
    description "Resolves clinical interventions through the Operations and Monitoring facade, so that field events never satisfy a clinical reference."
    tags "ACL,BC:Planning"
}

bePlanningGuard = component "PlanningGuard" {
    technology ".NET outbound service"
    description "Applies the checks that depend on other contexts, so every Planning use case refuses the same inputs with the same error."
    tags "ACL,BC:Planning"
}

beNutritionPlanQueryService = component "NutritionPlanQueryService" {
    technology ".NET query service"
    description "Reads the nutrition plans of a lot for accounts that may read their ranch."
    tags "Application,BC:Planning"
}

bePlannedActivityQueryService = component "PlannedActivityQueryService" {
    technology ".NET query service"
    description "Reads planned activities, their records and the calendar for accounts that may read their ranch."
    tags "Application,BC:Planning"
}

bePlanningCampaignQueryService = component "PlanningCampaignQueryService" {
    technology ".NET query service"
    description "Reads campaigns for accounts that may read their ranch."
    tags "Application,BC:Planning"
}

beWithdrawalPeriodQueryService = component "WithdrawalPeriodQueryService" {
    technology ".NET query service"
    description "Reads withdrawal periods of a ranch, optionally narrowed to one animal that the ranch holds."
    tags "Application,BC:Planning"
}

beNutritionPlanScheduler = component "NutritionPlanScheduler" {
    technology ".NET domain service"
    description "Decides whether a new nutrition plan can join the plans of its lot."
    tags "DomainService,BC:Planning"
}

beNutritionPlanRepository = component "NutritionPlanRepository" {
    technology "Entity Framework Core repository"
    description "Stores nutrition plans in the shared context."
    tags "Infrastructure,BC:Planning"
}

bePlannedActivityRepository = component "PlannedActivityRepository" {
    technology "Entity Framework Core repository"
    description "Stores planned activities with their application records and follow-ups, which are always loaded with their activity."
    tags "Infrastructure,BC:Planning"
}

bePlanningCampaignRepository = component "PlanningCampaignRepository" {
    technology "Entity Framework Core repository"
    description "Stores planning campaigns in the shared context, filtering every ranch query by its ranch."
    tags "Infrastructure,BC:Planning"
}

bePlanningTransaction = component "PlanningTransaction" {
    technology "Entity Framework Core repository"
    description "Runs a Planning operation in one serializable transaction."
    tags "Infrastructure,BC:Planning"
}

beWithdrawalPeriodRepository = component "WithdrawalPeriodRepository" {
    technology "Entity Framework Core repository"
    description "Stores withdrawal periods in the shared context, filtering every query by ranch."
    tags "Infrastructure,BC:Planning"
}

beNutritionPlansController = component "NutritionPlansController" {
    technology "ASP.NET Core Controller"
    description "Exposes the nutrition plans of a lot, and the plan in force on a day for accounts that may read the ranch."
    tags "Interface,BC:Planning"
}

bePlanningActivitiesController = component "PlanningActivitiesController" {
    technology "ASP.NET Core Controller"
    description "Exposes planned activities with their applications and follow-ups for the accounts that may access their ranch."
    tags "Interface,BC:Planning"
}

bePlanningCalendarController = component "PlanningCalendarController" {
    technology "ASP.NET Core Controller"
    description "Exposes the planned activities of an authorized ranch inside an inclusive UTC interval."
    tags "Interface,BC:Planning"
}

bePlanningCampaignsController = component "PlanningCampaignsController" {
    technology "ASP.NET Core Controller"
    description "Exposes the planning campaigns of the ranches the caller may access."
    tags "Interface,BC:Planning"
}

beWithdrawalPeriodsController = component "WithdrawalPeriodsController" {
    technology "ASP.NET Core Controller"
    description "Exposes withdrawal periods whose bounds an authorized caller supplies explicitly."
    tags "Interface,BC:Planning"
}

beIamAnalyticsAccessControl = component "IamAnalyticsAccessControl" {
    technology ".NET outbound service"
    description "Reads ranch access from IAM with the read scope, so analytics honors the same grants as the other read endpoints."
    tags "ACL,BC:DashboardAnalytics"
}

bePlatformAnalyticsSource = component "PlatformAnalyticsSource" {
    technology ".NET outbound service"
    description "Builds analytics snapshots from the facades of other contexts."
    tags "ACL,BC:DashboardAnalytics"
}

beSubscriptionPlansAnalyticsEntitlements = component "SubscriptionPlansAnalyticsEntitlements" {
    technology ".NET outbound service"
    description "Gates report exports on the plan feature that the subscription context defines, so the plan catalog stays the only source of entitlements."
    tags "ACL,BC:DashboardAnalytics"
}

beAnalyticsQueryService = component "AnalyticsQueryService" {
    technology ".NET query service"
    description "Checks access and source consistency before any indicator is calculated, so a caller never receives data it may not read."
    tags "Application,BC:DashboardAnalytics"
}

beExecutiveReportQueryService = component "ExecutiveReportQueryService" {
    technology ".NET query service"
    description "Generates executive reports after the format, access, entitlement and data checks, in that order, so a refused export never reaches the file."
    tags "Application,BC:DashboardAnalytics"
}

beAnalyticsDomainService = component "AnalyticsDomainService" {
    technology ".NET domain service"
    description ""
    tags "DomainService,BC:DashboardAnalytics"
}

beDashboardController = component "DashboardController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:DashboardAnalytics"
}

beEpidemiologicalCurveController = component "EpidemiologicalCurveController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:DashboardAnalytics"
}

bePortfolioController = component "PortfolioController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:DashboardAnalytics"
}

beReportsController = component "ReportsController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:DashboardAnalytics"
}

beTrendsController = component "TrendsController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:DashboardAnalytics"
}

beIamContextFacade = component "IamContextFacade" {
    technology ".NET context facade"
    description ""
    tags "ACL,BC:Iam"
}

beAccountCommandService = component "AccountCommandService" {
    technology ".NET command service"
    description "Coordinates registration and credential authentication."
    tags "Application,BC:Iam"
}

beHerdAdvisoryCommandService = component "HerdAdvisoryCommandService" {
    technology ".NET command service"
    description "Coordinates advisory requests and owner decisions."
    tags "Application,BC:Iam"
}

beProfessionalProfileCommandService = component "ProfessionalProfileCommandService" {
    technology ".NET command service"
    description "Coordinates professional profile completion."
    tags "Application,BC:Iam"
}

beAccountQueryService = component "AccountQueryService" {
    technology ".NET query service"
    description ""
    tags "Application,BC:Iam"
}

beAuthorizationQueryService = component "AuthorizationQueryService" {
    technology ".NET query service"
    description "Evaluates ranch-access queries with the repositories and the authorization rules."
    tags "Application,BC:Iam"
}

beHerdAdvisoryQueryService = component "HerdAdvisoryQueryService" {
    technology ".NET query service"
    description "Reads the advisory history of a ranch."
    tags "Application,BC:Iam"
}

beRanchQueryService = component "RanchQueryService" {
    technology ".NET query service"
    description "A malformed code gets the same answer as an unknown one, so codes cannot be probed by their format."
    tags "Application,BC:Iam"
}

beAuthorizationDomainService = component "AuthorizationDomainService" {
    technology ".NET domain service"
    description "An owner manages the ranch, and any member reads it."
    tags "DomainService,BC:Iam"
}

beHerdAdvisoryRepository = component "HerdAdvisoryRepository" {
    technology "Entity Framework Core repository"
    description "Stores herd advisories in the shared context."
    tags "Infrastructure,BC:Iam"
}

beRanchRegistrationRepository = component "RanchRegistrationRepository" {
    technology "Entity Framework Core repository"
    description "Stores ranch registrations and their memberships."
    tags "Infrastructure,BC:Iam"
}

beUserAccountRepository = component "UserAccountRepository" {
    technology "Entity Framework Core repository"
    description "Stores accounts in the shared context."
    tags "Infrastructure,BC:Iam"
}

beFirebaseAuthenticationHandler = component "FirebaseAuthenticationHandler" {
    technology ".NET adapter"
    description "Authenticates bearer identity tokens using the external identity provider."
    tags "Infrastructure,BC:Iam"
}

beHttpCurrentAccount = component "HttpCurrentAccount" {
    technology ".NET adapter"
    description "Resolves the request identity without trusting client-supplied account identifiers."
    tags "Infrastructure,BC:Iam"
}

beRandomRanchAccessCodeGenerator = component "RandomRanchAccessCodeGenerator" {
    technology ".NET adapter"
    description "Draws from the operating system's cryptographic generator, so that a code cannot be predicted from earlier codes."
    tags "Infrastructure,BC:Iam"
}

beFirebaseAuthenticationAcl = component "FirebaseAuthenticationAcl" {
    technology ".NET adapter"
    description "Adapts Firebase authentication to the IAM identity-provider port."
    tags "Infrastructure,BC:Iam"
}

beAccountsController = component "AccountsController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:Iam"
}

beHerdAdvisoriesController = component "HerdAdvisoriesController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:Iam"
}

beProfilesController = component "ProfilesController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:Iam"
}

beRanchesController = component "RanchesController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:Iam"
}

beVeterinaryAccessRequestsController = component "VeterinaryAccessRequestsController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:Iam"
}

beSubscriptionPlansContextFacade = component "SubscriptionPlansContextFacade" {
    technology ".NET context facade"
    description ""
    tags "ACL,BC:SubscriptionPlans"
}

beSubscriptionCommandService = component "SubscriptionCommandService" {
    technology ".NET command service"
    description "Requests, cancels, pays and activates subscriptions."
    tags "Application,BC:SubscriptionPlans"
}

beIamSubscriptionAccessService = component "IamSubscriptionAccessService" {
    technology ".NET outbound service"
    description "Implements with the IAM context facade, mapping the read and manage permissions to the IAM access scopes that grant them."
    tags "ACL,BC:SubscriptionPlans"
}

bePlanQueryService = component "PlanQueryService" {
    technology ".NET query service"
    description "Public read service of the plan catalog."
    tags "Application,BC:SubscriptionPlans"
}

beSubscriptionQueryService = component "SubscriptionQueryService" {
    technology ".NET query service"
    description ""
    tags "Application,BC:SubscriptionPlans"
}

beStripePaymentGateway = component "StripePaymentGateway" {
    technology ".NET adapter"
    description "Adapts Stripe Checkout and webhook verification to the payment port."
    tags "Infrastructure,BC:SubscriptionPlans"
}

bePlanRepository = component "PlanRepository" {
    technology "Entity Framework Core repository"
    description ""
    tags "Infrastructure,BC:SubscriptionPlans"
}

beSubscriptionRepository = component "SubscriptionRepository" {
    technology "Entity Framework Core repository"
    description ""
    tags "Infrastructure,BC:SubscriptionPlans"
}

bePlansController = component "PlansController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:SubscriptionPlans"
}

beQuotesController = component "QuotesController" {
    technology "ASP.NET Core Controller"
    description ""
    tags "Interface,BC:SubscriptionPlans"
}

beStripeWebhooksController = component "StripeWebhooksController" {
    technology "ASP.NET Core Controller"
    description "Receives the payment events of Stripe."
    tags "Interface,BC:SubscriptionPlans"
}

beSubscriptionsController = component "SubscriptionsController" {
    technology "ASP.NET Core Controller"
    description "Requests, reads and cancels the subscriptions of ranches."
    tags "Interface,BC:SubscriptionPlans"
}

