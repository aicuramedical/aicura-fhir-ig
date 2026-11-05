Profile: AicuraAssayDevice
Parent: AicuraDevice
Id: assay-device
Title: "AICURA Assay Device"
Description: "Lab assay platform (e.g. Roche Elecsys, Fujirebio Lumipulse, Quanterix SIMOA) in AICURA's clinical data model. One shared record per platform, referenced from every lab result it produced, so values from different assays for the same biomarker stay apart."
* insert MetaProfile(assay-device)
* type = $SCT#30234008 "Medical laboratory analyzer"
* type ^comment = "Always Medical laboratory analyzer: SNOMED CT has no concept for an assay or test kit, so the platform is told apart by manufacturer and deviceName."
* manufacturer 1..1
* manufacturer ^short = "Manufacturer of the platform, e.g. Roche, Fujirebio, Quanterix"
* deviceName 1..*
* deviceName.type = #manufacturer-name
* deviceName ^short = "Product name of the platform as the manufacturer names it, e.g. Elecsys, Lumipulse, SIMOA"
* version MS
* version ^short = "Assay generation, where known"
* patient 0..0
