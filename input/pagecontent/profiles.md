### Profiles

This IG defines eighteen FHIR R4B profiles. All of them follow the [Shared Rules](shared-rules.html), e.g. every identifier names its issuer in `system`.

#### AicuraImagingStudy

[AicuraImagingStudy](StructureDefinition-imaging-study.html) constrains ImagingStudy with must-support on identifier, status, subject, encounter, started, description, endpoint, series and its uid, number, modality, description, instance count, start, endpoint, body site and performer (the scanner); id, the Study Instance UID identifier and subject are required. It adds the patient's age at the study and series-level extensions for the acquisition details listed on the [Extensions](extensions.html) page. The sections below explain the rules that go beyond base FHIR.

##### Study identity

Every study carries its DICOM Study Instance UID as an identifier in the form FHIR uses for DICOM UIDs and HL7 Europe's imaging guide requires:

| Element | Value |
|---|---|
| `identifier.system` | `urn:dicom:uid` |
| `identifier.value` | `urn:oid:` followed by the UID, e.g. `urn:oid:2.25.123456789` |
| `identifier.type` | DICOM `110180` "Study Instance UID" (`http://dicom.nema.org/resources/ontology/DCM`) |

The resource `id` stays the plain UID, since the FHIR `id` datatype allows no colons. Invariant `aic-is-1` checks that the identifier and the id hold the same UID.

##### Images and the image archive

The profile catalogues the scans; it does not copy them. Single images (`series.instance`) are not required. The study (`endpoint`) and each series (`series.endpoint`) point to the image archive, and both links are must-support. Clients fetch the images from the archive; where both links exist, they use the series link.

##### MR acquisition details

Each MR series carries one extension, [ModalityMR](StructureDefinition-ModalityMR.html), with the acquisition details read from the DICOM header. Its first seven parts are shaped like MII's MR extension (`mii-ex-bildgebung-modalitaet-mr`): same names, types and units, so they map 1:1 to MII. Explicit units make scans from different studies comparable. The last three parts are AICURA's and have no MII counterpart.

| Part | Content | DICOM tag | Type |
|---|---|---|---|
| `magneticFieldStrength` | Magnetic field strength | (0018,0087) | Quantity, UCUM `T` |
| `scanningSequence` | Scanning technique (SE, IR, GR, EP, RM), one entry per value | (0018,0020) | CodeableConcept, MII value set (required) |
| `scanningSequenceVariant` | Sequence variant (SK, SS, SP, MP, ...), one entry per value | (0018,0021) | CodeableConcept, MII value set (required) |
| `echoTime` | Echo time (TE) | (0018,0081) | Quantity, UCUM `ms` |
| `repetitionTime` | Repetition time (TR) | (0018,0080) | Quantity, UCUM `ms` |
| `inversionTime` | Inversion time (TI) | (0018,0082) | Quantity, UCUM `ms` |
| `flipAngle` | Flip angle | (0018,1314) | Quantity, UCUM `deg` |
| `sequenceName` | Sequence name, e.g. MPRAGE, IR-SPGR, TSE | derived | CodeableConcept, [AicuraMRISequenceVS](ValueSet-aicura-mri-sequence.html) (required) |
| `contrastWeighting` | Contrast weighting, e.g. T1w, T2w, T2w FLAIR | derived | CodeableConcept, [AicuraMRIContrastVS](ValueSet-aicura-mri-contrast.html) (required) |
| `acquisitionPlane` | Axial, sagittal or coronal (SNOMED CT) | derived | CodeableConcept, [AicuraAcquisitionPlaneVS](ValueSet-aicura-acquisition-plane.html) (extensible) |

- **Sequence name next to the technique codes.** The DICOM technique codes say which physics class a sequence belongs to; they are too coarse to select cohorts. Neurodegeneration research selects series by sequence name ("3D T1 MPRAGE"), so the name is kept as its own part.
- **Contrast weighting** is the image weighting, the first criterion imaging researchers filter by (T1w for volume measurements, FLAIR for white-matter lesions). It is not the contrast agent, which is recorded through the series' link to the administration (below).
- **Coded AICURA parts** carry a coding and its label (`text`); both are required.
- **Rules:** an MR series carries the extension with a contrast weighting and a sequence name (`aic-mr-1`), and the sequence name fits the weighting (`aic-mr-2`): T1w needs an IR/MPRAGE-type sequence, T2w TSE or FSE, T2w FLAIR FLAIR, TSE or FSE, and T2\*w GRE or SWI. Other weightings accept any sequence; "Unresolved Sequence Label" is always allowed.

##### PET and SPECT: tracer and injection

PET and SPECT series carry their tracer details in [ModalityPT](StructureDefinition-ModalityPT.html) (modality PT) or [ModalityNM](StructureDefinition-ModalityNM.html) (modality NM, SPECT), shaped like MII's PET and NM extensions (`mii-ex-bildgebung-modalitaet-pt`, `-nm`). The first four parts keep MII's names, types and units; the last two are AICURA's.

| Part | Content | Type |
|---|---|---|
| `radiopharmaceutical` | Tracer | CodeableConcept, DICOM CID 4021 (PET) or CID 25 (SPECT), extensible; PubChem name as text |
| `radionuclide` | Radionuclide, e.g. 18F | CodeableConcept, DICOM CID 4020 (PET) or CID 18 (SPECT), extensible |
| `radionuclideTotalDose` | Administered activity | Quantity, UCUM `Bq` |
| `radionuclideHalfLife` | Half-life of the radionuclide | Quantity, UCUM `s` |
| `injectionTime` | Injection time, as DICOM Radiopharmaceutical Start DateTime (0018,1078) | dateTime |
| `acquisitionPlane` | Axial, sagittal or coronal (SNOMED CT) | CodeableConcept, [AicuraAcquisitionPlaneVS](ValueSet-aicura-acquisition-plane.html) (extensible) |

A PET series carries the extension with a tracer (`aic-pt-1`).

**Tracer coding.** The tracer is coded with its entry in the DICOM tracer list MII binds: CID 4021 for PET, CID 25 for SPECT (both extensible; code system as listed there, mostly SNOMED CT). A tracer the list has no code for is coded by its PubChem compound ID instead, and only then (`aic-tr-1`). The label (`text`) is the tracer's PubChem name. The same coding goes into `Medication.code` of the administered substance.

| Tracer | Code | PubChem compound ID | Label (PubChem name) |
|---|---|---|---|
| Fluorodeoxyglucose F-18 | SNOMED CT 35321007 | 68614 | Fludeoxyglucose F-18 |
| Flutemetamol F-18 | SNOMED CT 456997008 | 15950376 | Flutemetamol F-18 |
| Flortaucipir F-18 | SNOMED CT 879808000 | 70957463 | Flortaucipir F-18 |
| Florbetaben F-18 | SNOMED CT 712736002 | 11501341 | Florbetaben (18F) |
| Florbetapir F-18 | SNOMED CT 456995000 | 24822371 | Florbetapir F-18 |
| Pittsburgh Compound B (C-11) | DICOM 126500 | 2826731 | 11C-PiB |
| Izaflortaucipir (PI-2620) | UMLS C5433257 | 134202705 | Izaflortaucipir |
| Florbenazine (18F-FP-DTBZ) | UMLS C2934038 | 17755050 | Florbenazine F-18 |
| Florquinitau (MK-6240) | UMLS C4506764 | 118577045 | Florquinitau |
| Flutafuranol F-18 (NAV4694) | PubChem 44815683 (not in CID 4021) | 44815683 | Flutafuranol F 18 |
| Ioflupane I-123 (SPECT) | SNOMED CT 429296007 (CID 25) | 3086674 | Ioflupane I-123 |

Value sets: [AicuraPETTracerVS](ValueSet-aicura-pet-tracer.html), [AicuraSPECTTracerVS](ValueSet-aicura-spect-tracer.html), and [AicuraTracerPubChemVS](ValueSet-aicura-tracer-pubchem.html) for the PubChem IDs and names.

The injection itself is recorded once, as a [MedicationAdministration](StructureDefinition-medication-administration.html) that names the substance ([Medication](StructureDefinition-medication.html)) and holds dose (`dosage.dose`) and injection time (`effective[x]`). Each series points to it with the extension [SeriesMedicationAdministration](StructureDefinition-SeriesMedicationAdministration.html), so one record serves all series acquired after the same injection. Contrast agents use the same link.

Tracer, dose and injection time are therefore recorded twice: in the PET or SPECT extension, where MII systems expect them, and in the administration record. Both are filled from one source, the one known to be correct for the dataset: curated study data where available, the scanner header where its values have been checked. Scanner headers alone are not reliable for these values. Filled from one source, the two always agree.

The acquisition plane is a part of each modality extension (MR, PET, SPECT). Further modalities, such as CT, get a modality extension with the plane when a dataset needs one.

##### Geometry

Geometry is recorded once per series, the level researchers search at ("1 mm in every direction"), with sizes in UCUM millimetres:

| Extension | Content | Source |
|---|---|---|
| [VoxelResolution](StructureDefinition-VoxelResolution.html) x | Column spacing (horizontal) | second value of Pixel Spacing (0028,0030) |
| [VoxelResolution](StructureDefinition-VoxelResolution.html) y | Row spacing (vertical) | first value of Pixel Spacing (0028,0030) |
| [VoxelResolution](StructureDefinition-VoxelResolution.html) z | Slice thickness | Slice Thickness (0018,0050) |
| [SliceSpacing](StructureDefinition-SliceSpacing.html) | Distance between slice centres | Spacing Between Slices (0018,0088), or computed from the slice positions |
| [ImageResolution](StructureDefinition-ImageResolution.html) x, y | Columns, rows | Columns (0028,0011), Rows (0028,0010) |
| [ImageResolution](StructureDefinition-ImageResolution.html) z | Slices per volume | all slices divided by the number of time points |

- **Voxel size is the acquired resolution.** DICOM's Pixel Spacing lists the row spacing (vertical) first, so it maps to y, not x; x and y then match the columns and rows of ImageResolution.
- **Slice spacing is its own value.** It equals the slice thickness for contiguous 3D sequences such as MPRAGE, but differs when slices have gaps (common in 2D MR) or overlap (CT, PET reconstructions). Sizes and volumes are measured correctly only with the spacing.
- **Slices per volume, not files.** A multi-frame object holds a whole volume in one file, and a series with several volumes (diffusion, functional MR, dynamic PET) holds slices times volumes; neither is the slice count.
- **Missing values are omitted, never written as 0.** The isotropy flags ([IsotropicVoxelResolution](StructureDefinition-IsotropicVoxelResolution.html), [IsotropicImageResolution](StructureDefinition-IsotropicImageResolution.html)) are omitted when one of x, y, z is missing.
- The slice thickness maps 1:1 to MII's series slice thickness (`mii-ex-bildgebung-serie-schichtdicke`).

##### Scanner

Each scanner is described once, as an [AicuraDevice](StructureDefinition-device.html), and every series it acquired references it in `series.performer.actor`, as MII does. Questions such as "all scans from this scanner model" become direct, and scanner details are not copied into every series. The scanner's DICOM header values map to the Device as follows:

| DICOM attribute | Device element |
|---|---|
| Manufacturer (0008,0070) | `manufacturer` |
| Manufacturer's Model Name (0008,1090) | `deviceName` (type `model-name`) |
| Device Serial Number (0018,1000), where present | `serialNumber` |

Analysis software that produces results (e.g. FreeSurfer) is a Device too. `Device.type` is required and tells the two apart: DICOM `109101` "Acquisition Equipment" for a scanner, `109102` "Processing Equipment" for software ([AicuraDeviceTypeVS](ValueSet-aicura-device-type.html)).

##### Age at study and series

Research datasets usually remove dates to protect participants, so the patient's age at an event is what remains, and an age is easier to query than dates ("all scans between age 65 and 75"). The profile records the age in whole years at the study ([AgeAtImagingStudy](StructureDefinition-AgeAtImagingStudy.html), on `ImagingStudy`) and at each series ([AgeAtImagingSeries](StructureDefinition-AgeAtImagingSeries.html), on `ImagingStudy.series`), next to `started` and `series.started` where the data still carries dates. Neither MII nor base FHIR has such a field; the same pattern records the age at other events across the model.

##### Linking a result to a series

Almost every result in neurodegeneration imaging (a regional volume, a quality check) is computed from one series, not from the whole study. FHIR R4B cannot reference a single series: a reference targets a whole resource, and the series sits inside the ImagingStudy. A result computed from a series therefore carries two things:

- `Observation.derivedFrom` referencing the ImagingStudy, and
- MII's series-UID extension (`https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-series-uid`, `valueId`) holding the `series.uid` of that series, the DICOM Series Instance UID.

The extension is used exactly as the MII imaging module publishes it (this IG depends on `de.medizininformatikinitiative.kerndatensatz.bildgebung` 2026.0.0), so MII systems recognise the link. A reference to the series as a resource of its own, such as `ImagingSeries/<uid>`, is not valid FHIR. When the model moves to FHIR R6, the resource ImagingSelection takes the place of this pair.

#### AicuraObservation

[AicuraObservation](StructureDefinition-observation.html) is the common parent of the Observation profiles per kind of result (below). It constrains Observation with must-support on status, category, code, subject, effective, value, performer, derivedFrom, component, bodySite, interpretation, and method. The `code` element is bound to the [AicuraObservationCodeVS](ValueSet-aicura-observation-code.html) covering LOINC, SNOMED-CT, and AICURA custom observation codes. Extensions record the patient's age at the observation and link the Observation to the body structure its value refers to; on each component, an extension links the component's value to its body structure.

#### Observation profiles per kind of result

Each kind of result has its own Observation profile, so each kind can get the rules that fit it:

| Profile | Parent | Category | For |
|---------|--------|----------|-----|
| [AicuraObservationLab](StructureDefinition-observation-lab.html) | AicuraObservation | `laboratory` | Lab values, e.g. CSF and plasma biomarkers |
| [AicuraObservationScore](StructureDefinition-observation-score.html) | AicuraObservation | `survey` | Clinical scores from assessment instruments, clinician-rated or participant-reported |
| [AicuraObservationImagingMeasure](StructureDefinition-observation-imaging-measure.html) | AicuraObservation | `imaging` | Measures derived from images, e.g. brain-region volumes and PET SUVr |
| [AicuraObservationVitalSign](StructureDefinition-observation-vital-sign.html) | FHIR [vital signs](http://hl7.org/fhir/R4B/observation-vitalsigns.html) | `vital-signs` | Vital signs, e.g. weight, height and heart rate |

The category codes come from the HL7 [observation-category](http://terminology.hl7.org/CodeSystem/observation-category) code system; each profile requires its code and allows further categories. The lab, score and imaging profiles inherit all rules of AicuraObservation. The vital-sign profile derives from FHIR's vital-signs profile, as FHIR requires for vital signs, and repeats the rules all AICURA Observation profiles share: a Patient as subject and the patient's age at the observation. Results of a kind without its own profile (e.g. genetics) use AicuraObservation directly.

The lab profile follows the structure of the MII lab module (laboratory category, grouping of lab codes) but uses international codes and English displays instead of MII's German ones, and claims no conformance to MII's lab profiles.

#### AicuraObservationImagingMeasure

[AicuraObservationImagingMeasure](StructureDefinition-observation-imaging-measure.html) holds measures derived from images, such as brain-region volumes, surface areas, cortical thickness and PET values. It inherits all rules of AicuraObservation and requires the category `imaging`.

##### One Observation per image series, measure and atlas

Brain volumetry produces one value per brain region, often more than a hundred per image series. The values of one image series, one measure (e.g. volume) and one atlas (e.g. Desikan-Killiany) form one Observation:

- one component per brain region, holding the value (`component.valueQuantity`) and the link to its region (below);
- the analysis software, with its atlas, once on the Observation in `Observation.device`, referencing an [AicuraDevice](StructureDefinition-device.html) of type Processing Equipment;
- the image series once on the Observation (`derivedFrom` and MII's series-UID extension, see "Linking a result to a series" under AicuraImagingStudy).

FHIR leaves the choice between components and separate Observations to context, and components fit when one method, one software and one time apply to all values, as they do here. Separate Observations would repeat the same patient, time, image series and software on every value. MII requires a value on every Observation; an export to MII turns each component into an Observation of its own. A measure that comes as a single value (e.g. the intracranial volume of a study without a regional breakdown) is one Observation with `valueQuantity` and no components.

##### Link to the brain region

Each value points directly to the [AicuraBodyStructure](StructureDefinition-body-structure.html) of its brain region (structure, side and position):

| Value on | Extension |
|---|---|
| the Observation | [ObservationBodyStructure](StructureDefinition-ObservationBodyStructure.html) |
| a component | [ObservationComponentBodyStructure](StructureDefinition-ObservationComponentBodyStructure.html) |

FHIR R4B has no element that links an Observation to a BodyStructure; HL7's workaround is an extension inside `bodySite`, which MII uses. FHIR R5 and R6 add the direct link `Observation.bodyStructure`, and R6 deprecates `bodySite`. The AICURA extensions follow that newer design, so the move to R6 changes the format once: `ObservationBodyStructure` becomes `Observation.bodyStructure`. Components have no region element in any FHIR version, so `ObservationComponentBodyStructure` stays an extension. An export to MII moves the link into `bodySite`, with the region's SNOMED CT code there.

#### AicuraCondition

[AicuraCondition](StructureDefinition-condition.html) constrains Condition with must-support on clinicalStatus, verificationStatus, code, bodySite, subject, encounter, onset, recordedDate, and stage. The `code` element is bound to the [AicuraConditionCodeVS](ValueSet-aicura-condition-code.html) spanning SNOMED-CT, AICURA custom, and MedDRA codes. Extensions record the patient's age at the recorded date (`AgeRecorded`) and at onset (`AgeOnset`, and the older `AgeAtCondition` with the same value).

#### AicuraPatient

[AicuraPatient](StructureDefinition-patient.html) constrains Patient with must-support on identifier, gender, birthDate, and deceased. It adds `race` and `ethnicity` extensions bound to the [AicuraRaceEthnicityVS](ValueSet-aicura-race-ethnicity.html) (US CDC Race & Ethnicity code system); these mirror the US Core race/ethnicity extensions without taking a US Core dependency. Patient identifiers are typed as pseudonyms (`PSEUDED`).

#### AicuraEncounter

[AicuraEncounter](StructureDefinition-encounter.html) constrains Encounter with must-support on status, class, type, subject, period, and location. The `class` element is bound to the [AicuraEncounterClassVS](ValueSet-aicura-encounter-class.html) (HL7 v3 ActCode). The `AgeAtEncounter` extension records the patient's age at the start of the encounter.

#### AicuraProcedure

[AicuraProcedure](StructureDefinition-procedure.html) leaves Procedure as in base FHIR R4B apart from the [Shared Rules](shared-rules.html), without bindings or must-support flags of its own. The `AgeAtProcedure` extension records the patient's age at the procedure. No AICURA study dataset provides procedures; the platform holds them from other clinical sources.

#### AicuraMedication

[AicuraMedication](StructureDefinition-medication.html) constrains Medication with must-support on code, status, manufacturer, form, amount, ingredient, and batch. It defines the medications referenced by medication statements and administrations.

#### AicuraMedicationStatement

[AicuraMedicationStatement](StructureDefinition-medication-statement.html) constrains MedicationStatement with must-support on status, statusReason, category, medication, subject, context, effective, dateAsserted, informationSource, reasonCode, reasonReference, and dosage. This is the medication resource included in AICURA's FHIR Bundle export.

#### AicuraMedicationAdministration

[AicuraMedicationAdministration](StructureDefinition-medication-administration.html) constrains MedicationAdministration with must-support on status, medication, subject, context, effective, dosage, route and dose. It records a tracer or contrast agent administered for imaging; the medication is a reference to an [AicuraMedication](StructureDefinition-medication.html), and imaging series point to the administration through the [SeriesMedicationAdministration](StructureDefinition-SeriesMedicationAdministration.html) extension.

#### AicuraResearchStudy

[AicuraResearchStudy](StructureDefinition-research-study.html) constrains ResearchStudy with must-support on identifier, title, status, primaryPurposeType, phase, category, focus, condition, period, description, sponsor, principalInvestigator, site, arm, and objective. It describes the studies (e.g. ADNI cohorts) that patients are enrolled in.

#### AicuraResearchSubject

[AicuraResearchSubject](StructureDefinition-research-subject.html) constrains ResearchSubject with must-support on identifier, status, period, study, individual, assignedArm, and actualArm. Participant codes are typed as anonymised (`ANON`). The `AgeAtResearch` extension records the patient's age at the start of the participation.

#### AicuraConsent

[AicuraConsent](StructureDefinition-consent.html) constrains Consent with must-support on status, scope, category, patient, dateTime, performer, organization, source, policy, policyRule, verification, and provision. It captures a patient's consent for research participation and data use.

#### AicuraDevice

[AicuraDevice](StructureDefinition-device.html) constrains Device with must-support on identifier, udiCarrier, status, manufacturer, manufactureDate, expirationDate, lotNumber, serialNumber, deviceName, modelNumber, type, version, patient, owner, location, note, safety, and parent. It represents imaging scanners, referenced from `ImagingStudy.series.performer.actor`, and analysis software, referenced by derived results. `type` is required and bound to [AicuraDeviceTypeVS](ValueSet-aicura-device-type.html), which tells the two apart: Acquisition Equipment for a scanner, Processing Equipment for software.

#### AicuraBodyStructure

[AicuraBodyStructure](StructureDefinition-body-structure.html) constrains BodyStructure with must-support on identifier, active, morphology, location, locationQualifier, and description. It describes anatomical sites, mainly the brain regions that imaging-derived measures refer to. A brain region has three parts:

| Part | Element | Example | Value set |
|---|---|---|---|
| Structure | `location` | Anterior cingulate cortex | [AicuraBodyStructureVS](ValueSet-aicura-body-structure.html) (extensible) |
| Side | extension [BodyStructureLaterality](StructureDefinition-BodyStructureLaterality.html) | Left | [AicuraLateralityVS](ValueSet-aicura-laterality.html) (extensible) |
| Position | `locationQualifier` | Caudal | [AicuraLocationQualifierVS](ValueSet-aicura-location-qualifier.html) (extensible) |

##### Side and position

The side (left, right, bilateral) has its own field, the extension BodyStructureLaterality, apart from the position in `locationQualifier`. FHIR R4B and MII put both into `locationQualifier`; FHIR R5 and R6 give the side its own element, `includedStructure.laterality`, next to the position in `includedStructure.qualifier`. AICURA follows that separation in a flat form, since each region is one atlas structure with one side; the nested `includedStructure` serves regions made of several structures, which atlas regions are not. With the move to R6, `location` becomes `includedStructure.structure`, the extension `includedStructure.laterality` and `locationQualifier` `includedStructure.qualifier`. A reader that does not know the extension sees the side only in the region's name. An export to MII copies the side into `locationQualifier`.

##### Shared brain regions

A brain region from an atlas, such as the left hippocampus, is the same definition for every participant. Each region (structure, side and position) is therefore one BodyStructure, shared by all participants, and every measurement links to it. Region records carry no patient.

This is a known deviation from FHIR R4B, where `BodyStructure.patient` is required (1..1), as it is in R5 and in MII. FHIR R6 makes the patient optional (0..1), and AICURA follows R6 here. A profile cannot loosen a cardinality of base FHIR, so the profile keeps R4B's 1..1 and a validator reports region records as missing the patient; `patient` is not must-support. An export to MII creates one copy of each region per patient.

##### Region codes

SNOMED CT is the main code system for brain regions (`location`). Brain atlases such as Desikan-Killiany divide the brain more finely than SNOMED CT names it, so a region keeps one of three codings:

| Coding | When | Example |
|---|---|---|
| SNOMED CT concept of the region | SNOMED CT names the region | Hippocampus: SNOMED CT 5366008 |
| AICURA region code | SNOMED CT has no concept of the region; a few regions SNOMED CT names keep the AICURA code they have (e.g. Intracranial volume [ICV]) | Isthmus of cingulate gyrus |
| Broader SNOMED CT concept, with the position in `locationQualifier` | The atlas region is a part of a SNOMED CT structure | Corpus callosum (SNOMED CT 88442005) with the qualifier Mid-Anterior |

A broader SNOMED CT concept alone would give different regions the same code (caudal anterior, rostral anterior and posterior cingulate would all become "cingulate gyrus"), so it is used only together with a position that tells them apart. The exact region is defined by the atlas (on the analysis software's Device) and the region's label; a code approximates it. As in every coded field (see [Shared Rules](shared-rules.html)), several codes may sit next to each other, e.g. a broader SNOMED CT concept next to an AICURA code. MII requires a SNOMED CT code for every region; regions with only an AICURA code deviate from MII.

[AicuraBodyStructureVS](ValueSet-aicura-body-structure.html) holds every SNOMED CT anatomical or acquired body structure (`442083009` and its descendants) and the AICURA region codes. [AicuraLocationQualifierVS](ValueSet-aicura-location-qualifier.html) holds the position qualifiers: SNOMED CT qualifier values, and AICURA codes for Ventral, Mid-Anterior and Mid-Posterior, which SNOMED CT has no concept for.
