Extension: NeuroPlusNumberOfFrames
Id: NumberOfFrames
Title: "Number of Frames"
Description: "Number of frames (slices/timepoints) in this imaging series."
* ^url = "http://sphin-x.de/fhir/StructureDefinition/NumberOfFrames"
* insert ExtensionContext(ImagingStudy.series)
* value[x] only integer
