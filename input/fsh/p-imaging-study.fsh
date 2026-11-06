Invariant: aic-mr-1
Description: "An MR series carries the MR extension with a contrast weighting and a sequence name."
Severity: #error
Expression: "modality.code = 'MR' implies extension('http://aicuramedical.com/fhir/StructureDefinition/ModalityMR').where(extension('contrastWeighting').exists() and extension('sequenceName').exists()).exists()"

Invariant: aic-mr-2
Description: "The sequence name fits the contrast weighting: T1w needs an IR/MPRAGE-type sequence, T2w TSE or FSE, T2w FLAIR TSE or FSE, T2*w GRE or SWI. Other weightings are unrestricted; 'Unresolved Sequence Label' is always allowed."
Severity: #error
Expression: "extension('http://aicuramedical.com/fhir/StructureDefinition/ModalityMR').all(extension('contrastWeighting').value.coding.code.exists() implies (
  extension('sequenceName').value.coding.where(code = 'Unresolved Sequence Label').exists()
  or (extension('contrastWeighting').value.coding.where(code = 'T1w').exists() implies extension('sequenceName').value.coding.where(code in ('MPRAGE' | 'MP2RAGE' | 'IR-SPGR' | 'IR-FSPGR' | 'Accelerated IR-SPGR' | 'Accelerated IR-FSPGR' | 'TFE')).exists())
  and (extension('contrastWeighting').value.coding.where(code = 'T2w').exists() implies extension('sequenceName').value.coding.where(code in ('TSE' | 'FSE')).exists())
  and (extension('contrastWeighting').value.coding.where(code = 'T2w FLAIR').exists() implies extension('sequenceName').value.coding.where(code in ('TSE' | 'FSE')).exists())
  and (extension('contrastWeighting').value.coding.where(code = 'T2*w').exists() implies extension('sequenceName').value.coding.where(code in ('GRE' | 'SWI')).exists())))"

Invariant: aic-pt-1
Description: "A PET series carries the PET extension with a radiopharmaceutical."
Severity: #error
Expression: "modality.code = 'PT' implies extension('http://aicuramedical.com/fhir/StructureDefinition/ModalityPT').extension('radiopharmaceutical').exists()"

Invariant: aic-is-1
Description: "The Study Instance UID identifier holds the resource id as urn:oid:<id>."
Severity: #error
Expression: "identifier.where(type.coding.where(system = 'http://dicom.nema.org/resources/ontology/DCM' and code = '110180').exists()).all(value = 'urn:oid:' + %resource.id)"

Profile: AicuraImagingStudy
Parent: ImagingStudy
Id: imaging-study
Title: "AICURA ImagingStudy"
Description: "Constrained ImagingStudy profile for AICURA's medical imaging data model with series-level extensions for MR, PET and SPECT acquisition details."
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
* series.uid ^comment = "DICOM Series Instance UID. A result computed from this series references the ImagingStudy in derivedFrom and carries this UID in MII's series-UID extension (https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-series-uid). A reference to the series as a resource of its own (e.g. `ImagingSeries/` followed by the UID) is not valid FHIR."
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
* series.performer MS
* series.performer.actor MS
* series.performer.actor only Reference(AicuraDevice)
* series.performer.actor ^comment = "The scanner that acquired the series, described once as a Device (type Acquisition Equipment) and referenced from every series it acquired."
// Series extensions; value set bindings sit in the extensions
* series.extension contains
    AicuraVoxelResolution named voxelResolution 0..1 MS and
    AicuraSliceSpacing named sliceSpacing 0..1 MS and
    AicuraImageResolution named imageResolution 0..1 MS and
    AicuraIsotropicVoxelResolution named isotropicVoxelResolution 0..1 MS and
    AicuraIsotropicImageResolution named isotropicImageResolution 0..1 MS and
    AicuraNumberOfFrames named numberOfFrames 0..1 MS and
    AicuraModalityMR named modalityMR 0..1 MS and
    AicuraModalityPT named modalityPT 0..1 MS and
    AicuraModalityNM named modalityNM 0..1 MS and
    AicuraSeriesMedicationAdministration named medicationAdministration 0..* MS and
    AicuraDimension named dimension 0..1 MS and
    AicuraAgeAtImagingSeries named ageAtImagingSeries 0..1 MS and
    AicuraImagingSeriesSize named size 0..1 MS
