Extension: AicuraAgeAtObservation
Id: AgeAtObservation
Title: "Age at Observation"
Description: "Patient age in whole years at the observation's effective date. Research datasets often shift or coarsen dates, so the age is recorded next to the date the data carries."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtObservation"
* insert ExtensionContext(Observation)
* value[x] only integer
