Extension: AicuraContrast
Id: Contrast
Title: "MRI Contrast"
Description: "MRI contrast weighting for this imaging series (e.g., T1w, T2w, FLAIR)."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/Contrast"
* insert ExtensionContext(ImagingStudy.series)
* insert CodedWithText(contrast)
* extension[contrast].valueCoding from AicuraMRIContrastVS (required)
