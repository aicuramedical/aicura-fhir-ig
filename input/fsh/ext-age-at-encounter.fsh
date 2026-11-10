Extension: NeuroPlusAgeAtEncounter
Id: AgeAtEncounter
Title: "Age at Encounter"
Description: "Patient age in whole years at the start of the encounter. Research datasets often shift or coarsen dates, so the age is recorded next to the date the data carries."
* ^url = "http://sphin-x.de/fhir/StructureDefinition/AgeAtEncounter"
* insert ExtensionContext(Encounter)
* value[x] only integer
