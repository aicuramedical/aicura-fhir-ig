Extension: AicuraDeviceManufacturer
Id: DeviceManufacturer
Title: "Device Manufacturer"
Description: "Manufacturer of the imaging device used for this series."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/DeviceManufacturer"
* insert ExtensionContext(ImagingStudy.series)
* insert CodedWithText(deviceManufacturer)
* extension[deviceManufacturer].valueCoding from AicuraDeviceManufacturerVS (extensible)
