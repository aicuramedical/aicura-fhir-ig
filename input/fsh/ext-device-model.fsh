Extension: AicuraDeviceModel
Id: device-model
Title: "Device Model"
Description: "Model name of the imaging device used for this series."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/device-model"
* insert ExtensionContext(ImagingStudy.series)
* insert CodedWithText(deviceModel)
