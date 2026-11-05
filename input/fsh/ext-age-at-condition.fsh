Extension: AicuraAgeAtCondition
Id: AgeAtCondition
Title: "Age at Condition"
Description: "Patient age in whole years at the condition's onset date. Carries the same value as AgeOnset, which supersedes it."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtCondition"
* insert ExtensionContext(Condition)
* value[x] only integer
