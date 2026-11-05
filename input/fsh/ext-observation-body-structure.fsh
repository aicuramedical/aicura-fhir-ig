Extension: AicuraObservationBodyStructure
Id: ObservationBodyStructure
Title: "Observation Body Structure"
Description: "The body structure (e.g. a brain region) the observation's value refers to."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/ObservationBodyStructure"
* insert ExtensionContext(Observation)
* value[x] only Reference(BodyStructure)
