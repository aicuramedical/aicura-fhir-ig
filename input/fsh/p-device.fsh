Profile: AicuraDevice
Parent: Device
Id: device
Title: "AICURA Device"
Description: "Constrained Device profile for AICURA's clinical data model, representing imaging scanners (referenced from ImagingStudy.series.performer.actor), analysis software (referenced by derived results) and lab assay platforms (referenced from lab results, see AicuraAssayDevice), told apart by type."
* insert MetaProfile(device)
* insert IdentifierSystem
// Must-support elements
* identifier MS
* udiCarrier MS
* status MS
* manufacturer MS
* manufactureDate MS
* expirationDate MS
* lotNumber MS
* serialNumber MS
* deviceName MS
* modelNumber MS
* type 1..1 MS
* type from AicuraDeviceTypeVS (required)
* type ^comment = "Acquisition Equipment for a scanner, Processing Equipment for analysis software, Medical laboratory analyzer for a lab assay platform."
* version MS
* patient MS
* patient only Reference(Patient)
* owner MS
* location MS
* note MS
* safety MS
* parent MS
