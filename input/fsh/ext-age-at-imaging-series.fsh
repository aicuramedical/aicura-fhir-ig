Extension: AicuraAgeAtImagingSeries
Id: AgeAtImagingSeries
Title: "Age at Imaging Series"
Description: "Patient age at the date of the imaging series, recorded instead of the date itself."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AgeAtImagingSeries"
* insert ExtensionContext(ImagingStudy.series)
* value[x] only integer
