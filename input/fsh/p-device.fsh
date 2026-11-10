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
// Analysis software: the atlas it divides the brain by
* property MS
* property ^slicing.discriminator.type = #pattern
* property ^slicing.discriminator.path = "type"
* property ^slicing.rules = #open
* property contains brainAtlas 0..1 MS
* property[brainAtlas] ^short = "Brain atlas of the analysis software"
* property[brainAtlas] ^comment = "The atlas that defines the brain regions of the software's results, e.g. Desikan-Killiany (system https://surfer.nmr.mgh.harvard.edu/fswiki/CorticalParcellation) or the FreeSurfer subcortical segmentation (https://surfer.nmr.mgh.harvard.edu/fswiki/SubcorticalSegmentation), with the atlas version."
* property[brainAtlas].type = $AicuraCoding#brain-atlas
* property[brainAtlas].valueCode 1..1 MS
