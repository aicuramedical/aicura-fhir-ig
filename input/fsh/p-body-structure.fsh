RuleSet: BodyStructureCommon
* insert IdentifierSystem
// Must-support elements
* identifier MS
* active MS
* morphology MS
* location MS
* locationQualifier MS
* description MS
// Custom extension (BodyStructure has no base laterality element)
* extension contains AicuraBodyStructureLaterality named laterality 0..1 MS
* extension[laterality].valueCodeableConcept from AicuraLateralityVS (extensible)
* extension[laterality] ^comment = "The side only, never in locationQualifier. FHIR R6: includedStructure.laterality."
* locationQualifier ^comment = "The position only (e.g. caudal, rostral); the side goes into the laterality extension. FHIR R6: includedStructure.qualifier."
// ValueSet bindings
* location from AicuraBodyStructureVS (extensible)
* locationQualifier from AicuraLocationQualifierVS (extensible)

Profile: AicuraBodyStructure
Parent: BodyStructure
Id: body-structure
Title: "AICURA BodyStructure"
Description: "A body structure of one person (e.g. a lesion), in AICURA's clinical data model, with a custom laterality extension. Brain regions from an atlas, which all participants share, use AicuraAtlasRegion instead."
* insert MetaProfile(body-structure)
* insert BodyStructureCommon
* patient MS
* patient only Reference(Patient)
* patient.reference 1..1

Profile: AicuraAtlasRegion
Parent: BodyStructure
Id: atlas-region
Title: "AICURA Atlas Region"
Description: "A brain region as an atlas defines it (structure, side and position), one record shared by all participants; imaging-derived measures link to it. It belongs to no single patient: FHIR R4B requires BodyStructure.patient, so the element carries only the data-absent-reason not-applicable. FHIR R6 makes patient optional; from then on the element is left out."
* insert MetaProfile(atlas-region)
* insert BodyStructureCommon
* patient only Reference(Patient)
* patient.reference 0..0
* patient.identifier 0..0
* patient.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named dataAbsentReason 1..1
* patient.extension[dataAbsentReason].valueCode = #not-applicable
* patient ^comment = "No patient: the region is shared by all participants. FHIR R4B requires the element, so it carries only the data-absent-reason not-applicable. FHIR R6 (patient 0..1): left out."
