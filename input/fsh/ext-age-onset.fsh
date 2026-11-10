Extension: AicuraAgeOnset
Id: AgeOnset
Title: "Age at Onset"
Description: "Patient age in whole years at the condition's onset date. Research datasets often shift or coarsen dates, so the age is recorded next to the date the data carries."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeOnset"
* insert ExtensionContext(Condition)
* value[x] only integer
