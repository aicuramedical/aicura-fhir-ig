Extension: AicuraBodyStructureLaterality
Id: BodyStructureLaterality
Title: "Body Structure Laterality"
Description: "Body side (left, right, bilateral) of the body structure, kept apart from the position qualifiers in `locationQualifier`, as FHIR R5 and R6 separate side and position. Replaced by R6's `BodyStructure.includedStructure.laterality` with the move to R6."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/BodyStructureLaterality"
* insert ExtensionContext(BodyStructure)
* value[x] only CodeableConcept
