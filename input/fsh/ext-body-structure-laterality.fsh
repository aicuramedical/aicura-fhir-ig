Extension: AicuraBodyStructureLaterality
Id: BodyStructureLaterality
Title: "Body Structure Laterality"
Description: "Body side (left, right, bilateral) of the body structure, kept apart from the position qualifiers in `locationQualifier`."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/BodyStructureLaterality"
* insert ExtensionContext(BodyStructure)
* value[x] only CodeableConcept
