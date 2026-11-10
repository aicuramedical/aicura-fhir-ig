Extension: AicuraAcquisitionPlane
Id: AcquisitionPlane
Title: "Acquisition Plane"
Description: "Anatomical plane of image acquisition (axial, sagittal, coronal)."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/AcquisitionPlane"
* insert ExtensionContext(ImagingStudy.series)
* insert CodedWithText(acquisitionPlane)
* extension[acquisitionPlane].valueCoding from AicuraAcquisitionPlaneVS (extensible)
