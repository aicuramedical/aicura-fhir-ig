Invariant: aic-mr-1
Description: "An MR series carries a contrast and a sequence."
Severity: #error
Expression: "modality.code = 'MR' implies (extension('http://aicuramedical.com/fhir/StructureDefinition/Contrast').exists() and extension('http://aicuramedical.com/fhir/StructureDefinition/SeriesSequence').exists())"

Invariant: aic-mr-2
Description: "The sequence fits the contrast: T1w needs an IR/MPRAGE-type sequence, T2w TSE or FSE, T2w FLAIR FLAIR, TSE or FSE, T2*w GRE or SWI. Other contrasts are unrestricted; 'Unresolved Sequence Label' is always allowed."
Severity: #error
Expression: "extension('http://aicuramedical.com/fhir/StructureDefinition/Contrast').extension('contrast').value.code.exists() implies (
  extension('http://aicuramedical.com/fhir/StructureDefinition/SeriesSequence').extension('sequence').value.code = 'Unresolved Sequence Label'
  or ((extension('http://aicuramedical.com/fhir/StructureDefinition/Contrast').extension('contrast').value.code = 'T1w') implies extension('http://aicuramedical.com/fhir/StructureDefinition/SeriesSequence').extension('sequence').value.code in ('MPRAGE' | 'MP2RAGE' | 'IR-SPGR' | 'IR-FSPGR' | 'Accelerated IR-SPGR' | 'Accelerated IR-FSPGR' | 'TFE'))
  and ((extension('http://aicuramedical.com/fhir/StructureDefinition/Contrast').extension('contrast').value.code = 'T2w') implies extension('http://aicuramedical.com/fhir/StructureDefinition/SeriesSequence').extension('sequence').value.code in ('TSE' | 'FSE'))
  and ((extension('http://aicuramedical.com/fhir/StructureDefinition/Contrast').extension('contrast').value.code = 'T2w FLAIR') implies extension('http://aicuramedical.com/fhir/StructureDefinition/SeriesSequence').extension('sequence').value.code in ('FLAIR' | 'TSE' | 'FSE'))
  and ((extension('http://aicuramedical.com/fhir/StructureDefinition/Contrast').extension('contrast').value.code = 'T2*w') implies extension('http://aicuramedical.com/fhir/StructureDefinition/SeriesSequence').extension('sequence').value.code in ('GRE' | 'SWI')))"

Invariant: aic-pt-1
Description: "A PET series carries a tracer."
Severity: #error
Expression: "modality.code = 'PT' implies extension('http://aicuramedical.com/fhir/StructureDefinition/Tracer').exists()"

Invariant: aic-is-1
Description: "The Study Instance UID identifier holds the resource id as urn:oid:<id>."
Severity: #error
Expression: "identifier.where(type.coding.where(system = 'http://dicom.nema.org/resources/ontology/DCM' and code = '110180').exists()).all(value = 'urn:oid:' + %resource.id)"

Profile: AicuraImagingStudy
Parent: ImagingStudy
Id: imaging-study
Title: "AICURA ImagingStudy"
Description: "Constrained ImagingStudy profile for AICURA's medical imaging data model with series-level extensions for MRI/PET metadata."
* insert MetaProfile(imaging-study)
* insert IdentifierSystem
* obeys aic-is-1
* id 1..1 MS
* id ^comment = "The plain DICOM Study Instance UID, without the urn:oid: prefix (the id datatype allows no colons)."
* identifier 1..* MS
* identifier.value 1..1 MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "The DICOM Study Instance UID, as in HL7 Europe Imaging"
* identifier contains studyInstanceUid 1..1 MS
* identifier[studyInstanceUid] ^short = "DICOM Study Instance UID"
* identifier[studyInstanceUid].type 1..1 MS
* identifier[studyInstanceUid].type = $DICOM#110180 "Study Instance UID"
* identifier[studyInstanceUid].system 1..1 MS
* identifier[studyInstanceUid].system = "urn:dicom:uid"
* identifier[studyInstanceUid].value MS
* identifier[studyInstanceUid].value ^short = "urn:oid: followed by the Study Instance UID"
* status MS
* subject 1..1 MS
* subject only Reference(Patient)
* encounter MS
* started MS
* description MS
* endpoint MS
* endpoint ^comment = "Link to the study in the image archive. Where a series also carries an endpoint, clients fetch the images through the series endpoint."
* numberOfSeries MS
* numberOfInstances MS
* extension contains
    AicuraAgeAtImagingStudy named ageAtImagingStudy 0..1 MS
* series MS
* series obeys aic-mr-1 and aic-mr-2 and aic-pt-1
// Series backbone must-support
* series.uid MS
* series.uid ^comment = "DICOM Series Instance UID. A result computed from this series references the ImagingStudy in derivedFrom and carries this UID in MII's series-UID extension (https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-series-uid). A reference to the series as a resource of its own (e.g. ImagingSeries/<uid>) is not valid FHIR."
* series.number MS
* series.modality MS
* series.modality from AicuraImagingModalityVS (extensible)
* series.modality ^comment = "Code system is DICOM (http://dicom.nema.org/resources/ontology/DCM). The CID 29 web page URL identifies the value set, not the code system."
* series.description MS
* series.numberOfInstances MS
* series.started MS
* series.endpoint MS
* series.endpoint ^comment = "Link to the series in the image archive; preferred over the study endpoint when both exist."
* series.instance ^comment = "Not required: the profile catalogues series and points to the image archive, where single images are retrieved through the endpoints."
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
