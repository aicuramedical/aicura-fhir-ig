Extension: AicuraAgeAtProcedure
Id: AgeAtProcedure
Title: "Age at Procedure"
Description: "Patient age in whole years at the date of the procedure, recorded instead of the date itself."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtProcedure"
* insert ExtensionContext(Procedure)
* value[x] only integer
