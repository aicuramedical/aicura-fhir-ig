Extension: AicuraDimension
Id: Dimension
Title: "Dimension"
Description: "Dimensionality of the imaging series (2D or 3D)."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/Dimension"
* insert ExtensionContext(ImagingStudy.series)
* insert CodedWithText(dimension)
* extension[dimension].valueCoding from AicuraDimensionVS (extensible)
