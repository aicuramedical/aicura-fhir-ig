Profile: AicuraBodyStructure
Parent: BodyStructure
Id: body-structure
Title: "AICURA BodyStructure"
Description: "Constrained BodyStructure profile for AICURA's clinical data model, describing anatomical sites (neuroimaging focus) with a custom laterality extension. Brain regions are shared by all participants and carry no patient: allowed from FHIR R6 on, a known deviation from R4B, where patient is required."
* insert MetaProfile(body-structure)
* insert IdentifierSystem
// Must-support elements
* identifier MS
* active MS
* morphology MS
* location MS
* locationQualifier MS
* description MS
// Brain regions are shared records without a patient (R6: patient 0..1).
// R4B's cardinality 1..1 is kept, since a profile cannot loosen it.
* patient ^comment = "Not set on brain regions: one record per region (structure, side, position) is shared by all participants. This deviates from FHIR R4B, where patient is 1..1, and follows FHIR R6, where it is 0..1."
// Custom extension (BodyStructure has no base laterality element)
* extension contains AicuraBodyStructureLaterality named laterality 0..1 MS
* extension[laterality].valueCodeableConcept from AicuraLateralityVS (extensible)
* extension[laterality] ^comment = "The side only, never in locationQualifier. FHIR R6: includedStructure.laterality."
* locationQualifier ^comment = "The position only (e.g. caudal, rostral); the side goes into the laterality extension. FHIR R6: includedStructure.qualifier."
// ValueSet bindings
* location from AicuraBodyStructureVS (extensible)
* locationQualifier from AicuraLocationQualifierVS (extensible)
