Extension: AicuraObservationComponentBodyStructure
Id: ObservationComponentBodyStructure
Title: "Observation Component Body Structure"
Description: "The body structure (e.g. a brain region) the component's value refers to. A direct link in the shape of R6's Observation.bodyStructure; components have no such element in any FHIR version, so the extension stays after the move to R6."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/ObservationComponentBodyStructure"
* insert ExtensionContext(Observation.component)
* value[x] only Reference(BodyStructure)
