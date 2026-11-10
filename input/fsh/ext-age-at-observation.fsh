Extension: AicuraAgeAtObservation
Id: AgeAtObservation
Title: "Age at Observation"
Description: "Patient age in whole years at the observation's effective date, recorded instead of the date itself."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtObservation"
* insert ExtensionContext(Observation)
* value[x] only integer
