Extension: NeuroPlusObservationBodyStructure
Id: ObservationBodyStructure
Title: "Observation Body Structure"
Description: "The body structure (e.g. a brain region) the observation's value refers to. A direct link, as FHIR R5 and R6 define it in Observation.bodyStructure; replaced by that element with the move to R6."
* ^url = "http://sphin-x.de/fhir/StructureDefinition/ObservationBodyStructure"
* insert ExtensionContext(Observation)
* value[x] only Reference(BodyStructure)
