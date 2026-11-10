Extension: AicuraAgeAtImagingStudy
Id: AgeAtImagingStudy
Title: "Age at Imaging Study"
Description: "Patient age in whole years at the date of the imaging study. Research datasets usually remove dates to protect participants, so the age is what remains; it is also easier to query than dates. Recorded next to any date the data still carries."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtImagingStudy"
* insert ExtensionContext(ImagingStudy)
* value[x] only integer
