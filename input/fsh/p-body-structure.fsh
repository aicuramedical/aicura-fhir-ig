Profile: AicuraBodyStructure
Parent: BodyStructure
Id: body-structure
Title: "AICURA BodyStructure"
Description: "Constrained BodyStructure profile for AICURA's clinical data model, describing anatomical sites (neuroimaging focus) with a custom laterality extension."
* insert MetaProfile(body-structure)
* insert IdentifierSystem
// Must-support elements
* identifier MS
* active MS
* morphology MS
* location MS
* locationQualifier MS
* description MS
* patient MS
* patient only Reference(Patient)
// Custom extension (BodyStructure has no base laterality element)
* extension contains AicuraBodyStructureLaterality named laterality 0..1 MS
* extension[laterality].valueCodeableConcept from AicuraLateralityVS (extensible)
* extension[laterality] ^comment = "The side only, never in locationQualifier. FHIR R6: includedStructure.laterality."
* locationQualifier ^comment = "The position only (e.g. caudal, rostral); the side goes into the laterality extension. FHIR R6: includedStructure.qualifier."
// ValueSet bindings
* location from AicuraBodyStructureVS (extensible)
* locationQualifier from AicuraLocationQualifierVS (extensible)
