Extension: NeuroPlusImagingSeriesSize
Id: ImagingSeriesSize
Title: "Imaging Series Size"
Description: "Storage size of the imaging series files (UCUM, e.g. MiBy)."
* ^url = "http://sphin-x.de/fhir/StructureDefinition/ImagingSeriesSize"
* insert ExtensionContext(ImagingStudy.series)
* value[x] only Quantity
