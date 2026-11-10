Extension: AicuraIsotropicVoxelResolution
Id: IsotropicVoxelResolution
Title: "Isotropic Voxel Resolution"
Description: "Whether the voxel size is isotropic: x, y and z of VoxelResolution are equal. Omitted when one of them is missing."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/IsotropicVoxelResolution"
* insert ExtensionContext(ImagingStudy.series)
* value[x] only boolean
