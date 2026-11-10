Profile: AicuraImagingStudy
Parent: ImagingStudy
Id: imaging-study
Title: "AICURA ImagingStudy"
Description: "Constrained ImagingStudy profile for AICURA's medical imaging data model with series-level extensions for MRI/PET metadata."
* insert MetaProfile(imaging-study)
* insert IdentifierSystem
* id 1..1 MS
* identifier 1..* MS
* identifier.value 1..1 MS
* status MS
* subject 1..1 MS
* subject only Reference(Patient)
* encounter MS
* started MS
* description MS
* endpoint MS
* numberOfSeries MS
* numberOfInstances MS
* extension contains
    AicuraAgeAtImagingStudy named ageAtImagingStudy 0..1 MS
* series MS
// Series backbone must-support
* series.uid MS
* series.number MS
* series.modality MS
* series.description MS
* series.numberOfInstances MS
* series.started MS
* series.endpoint MS
* series.bodySite MS
// Series extensions (all 0..1); value set bindings sit in the coded extensions
* series.extension contains
    AicuraVoxelResolution named voxelResolution 0..1 MS and
    AicuraImageResolution named imageResolution 0..1 MS and
    AicuraIsotropicVoxelResolution named isotropicVoxelResolution 0..1 MS and
    AicuraIsotropicImageResolution named isotropicImageResolution 0..1 MS and
    AicuraMagneticFieldStrength named magneticFieldStrength 0..1 MS and
    AicuraEchotime named echotime 0..1 MS and
    AicuraNumberOfFrames named numberOfFrames 0..1 MS and
    AicuraDeviceManufacturer named deviceManufacturer 0..1 MS and
    AicuraDeviceModel named deviceModel 0..1 MS and
    AicuraDeviceId named deviceId 0..1 MS and
    AicuraSeriesSequence named seriesSequence 0..1 MS and
    AicuraTracer named tracer 0..1 MS and
    AicuraContrast named contrast 0..1 MS and
    AicuraAcquisitionPlane named acquisitionPlane 0..1 MS and
    AicuraDimension named dimension 0..1 MS and
    AicuraAgeAtImagingSeries named ageAtImagingSeries 0..1 MS and
    AicuraImagingSeriesSize named size 0..1 MS
