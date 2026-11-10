Extension: AicuraAgeAtEncounter
Id: AgeAtEncounter
Title: "Age at Encounter"
Description: "Patient age in whole years at the start of the encounter, recorded instead of the date itself."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtEncounter"
* insert ExtensionContext(Encounter)
* value[x] only integer
