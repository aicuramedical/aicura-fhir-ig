Extension: AicuraAgeAtImagingSeries
Id: AgeAtImagingSeries
Title: "Age at Imaging Series"
Description: "Patient age in whole years at the date of the imaging series. Research datasets usually remove dates to protect participants, so the age is what remains; it is also easier to query than dates. Recorded next to any date the data still carries."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtImagingSeries"
* insert ExtensionContext(ImagingStudy.series)
* value[x] only integer
