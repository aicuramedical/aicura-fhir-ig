Extension: AicuraSeriesSequence
Id: SeriesSequence
Title: "Series Sequence"
Description: "MRI sequence type used for this imaging series (e.g., MPRAGE, TSE, FLAIR)."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/SeriesSequence"
* insert ExtensionContext(ImagingStudy.series)
* insert CodedWithText(sequence)
* extension[sequence].valueCoding from AicuraMRISequenceVS (required)
