Extension: AicuraAgeAtProcedure
Id: AgeAtProcedure
Title: "Age at Procedure"
Description: "Patient age in whole years at the date of the procedure. Research datasets often shift or coarsen dates, so the age is recorded next to the date the data carries."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtProcedure"
* insert ExtensionContext(Procedure)
* value[x] only integer
