Extension: AicuraObservationComponentBodyStructure
Id: ObservationComponentBodyStructure
Title: "Observation Component Body Structure"
Description: "The body structure (e.g. a brain region) the component's value refers to."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/ObservationComponentBodyStructure"
* insert ExtensionContext(Observation.component)
* value[x] only Reference(BodyStructure)
