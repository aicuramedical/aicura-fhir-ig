Extension: NeuroPlusAgeRecorded
Id: AgeRecorded
Title: "Age Recorded"
Description: "Patient age in whole years at the condition's recorded date. Research datasets often shift or coarsen dates, so the age is recorded next to the date the data carries."
* ^url = "http://sphin-x.de/fhir/StructureDefinition/AgeRecorded"
* insert ExtensionContext(Condition)
* value[x] only integer
