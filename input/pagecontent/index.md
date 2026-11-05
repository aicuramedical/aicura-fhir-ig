### AICURA FHIR Implementation Guide

This Implementation Guide (IG) formally profiles the FHIR R4B resources implemented by **AICURA Medical's** clinical data platform. The guide covers fourteen resource types in twenty profiles, with associated terminology and extensions.

#### Scope

| Resource | Profile | Description |
|----------|---------|-------------|
| ImagingStudy | [AicuraImagingStudy](StructureDefinition-imaging-study.html) | MRI, PET and SPECT imaging studies with series-level extensions for acquisition metadata |
| Observation | [AicuraObservation](StructureDefinition-observation.html) | Common parent of the Observation profiles per kind of result; used directly for kinds without their own profile (e.g. genetics) |
| Observation | [AicuraObservationLab](StructureDefinition-observation-lab.html) | Lab values |
| Observation | [AicuraObservationScore](StructureDefinition-observation-score.html) | Clinical scores |
| Observation | [AicuraObservationVitalSign](StructureDefinition-observation-vital-sign.html) | Vital signs, meeting FHIR's vital-signs profile |
| Observation | [AicuraObservationBloodPressure](StructureDefinition-observation-blood-pressure.html) | Blood pressure as one record with systolic and diastolic components, meeting FHIR's blood-pressure profile |
| Observation | [AicuraObservationImagingMeasure](StructureDefinition-observation-imaging-measure.html) | Imaging-derived measures |
| Condition | [AicuraCondition](StructureDefinition-condition.html) | Neurological, cardiovascular, and other clinical conditions |
| Patient | [AicuraPatient](StructureDefinition-patient.html) | Subject of record, with custom race and ethnicity extensions |
| Encounter | [AicuraEncounter](StructureDefinition-encounter.html) | Study visits and clinical contacts |
| Procedure | [AicuraProcedure](StructureDefinition-procedure.html) | Procedures as in base FHIR (no study dataset provides them) |
| Medication | [AicuraMedication](StructureDefinition-medication.html) | Medication definitions referenced by medication statements |
| MedicationAdministration | [AicuraMedicationAdministration](StructureDefinition-medication-administration.html) | Tracer or contrast agent administered for imaging, linked from the imaging series |
| MedicationStatement | [AicuraMedicationStatement](StructureDefinition-medication-statement.html) | Reported patient medication usage (the medication resource in the FHIR Bundle export) |
| ResearchStudy | [AicuraResearchStudy](StructureDefinition-research-study.html) | Research studies (e.g. ADNI cohorts) patients are enrolled in |
| ResearchSubject | [AicuraResearchSubject](StructureDefinition-research-subject.html) | Patient enrollment in a research study |
| Consent | [AicuraConsent](StructureDefinition-consent.html) | Patient consent for research participation and data use |
| Device | [AicuraDevice](StructureDefinition-device.html) | Imaging scanners, analysis software and lab assay platforms, told apart by device type |
| Device | [AicuraAssayDevice](StructureDefinition-assay-device.html) | Lab assay platforms, one shared record per platform, linked from each lab value |
| BodyStructure | [AicuraBodyStructure](StructureDefinition-body-structure.html) | Body structures of one person, with a laterality extension |
| BodyStructure | [AicuraAtlasRegion](StructureDefinition-atlas-region.html) | Brain regions as an atlas defines them, one record shared by all participants |

#### Shared rules

Rules that apply to all profiles, such as how identifiers name their issuer and how each record names its profile and source dataset, are on the [Shared Rules](shared-rules.html) page.

#### Extensions

The ImagingStudy profile includes custom extensions on `ImagingStudy.series` for detailed acquisition metadata such as the MR, PET and SPECT acquisition details, the link to the tracer or contrast administration, and voxel resolution, and one on `ImagingStudy` for the patient's age at the study. Additional custom extensions cover `Race` and `Ethnicity` on Patient, `BodyStructureLaterality` on BodyStructure, the patient's age at each event (observation, encounter, condition, participation, procedure), and the links from an Observation and its components to body structures. See [Extensions](extensions.html) for the full list.

#### Terminology

One AICURA CodeSystem (`https://aicuramedical.com/fhir/coding`) for all AICURA-specific codes and AICURA ValueSets define the codes for MRI sequences, contrasts, device types, lab methods, PET and SPECT tracers, observation types, condition codes, encounter classes, body structures, laterality, location qualifiers, and race/ethnicity. External terminologies (SNOMED-CT, LOINC, MedDRA, DICOM, UMLS, PubChem, HL7 v3 ActCode, and the US CDC Race & Ethnicity code system) are also referenced.

#### Authors

- AICURA Medical GmbH ([https://aicura-medical.com](https://aicura-medical.com))
