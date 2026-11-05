Extension: AicuraObservationComponentDevice
Id: ObservationComponentDevice
Title: "Observation Component Device"
Description: "The device (e.g. the analysis software and its atlas) that produced the component's value."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/ObservationComponentDevice"
* insert ExtensionContext(Observation.component)
* value[x] only Reference(Device)
