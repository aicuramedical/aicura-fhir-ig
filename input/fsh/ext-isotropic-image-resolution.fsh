Extension: NeuroPlusIsotropicImageResolution
Id: IsotropicImageResolution
Title: "Isotropic Image Resolution"
Description: "Whether the matrix size is isotropic: x, y and z of ImageResolution are equal. Omitted when one of them is missing."
* ^url = "http://sphin-x.de/fhir/StructureDefinition/IsotropicImageResolution"
* insert ExtensionContext(ImagingStudy.series)
* value[x] only boolean
