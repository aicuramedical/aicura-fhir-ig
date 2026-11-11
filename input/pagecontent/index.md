### Neuro+ (hosted by sphin-X) FHIR Implementation Guide

This Implementation Guide (IG) formally profiles the FHIR R4B resources of the **Neuro+** data model for neurodegeneration research. The guide covers fourteen resource types in twenty-one profiles, with associated terminology and extensions.

#### Scope

| Resource | Profile | Description |
|----------|---------|-------------|
| ImagingStudy | [NeuroPlusImagingStudy](StructureDefinition-imaging-study.html) | MRI, PET and SPECT imaging studies with series-level extensions for acquisition metadata |
| Observation | [NeuroPlusObservation](StructureDefinition-observation.html) | Common parent of the Observation profiles per kind of result; used directly for kinds without their own profile (e.g. genetics) |
| Observation | [NeuroPlusObservationLab](StructureDefinition-observation-lab.html) | Lab values |
| Observation | [NeuroPlusObservationScore](StructureDefinition-observation-score.html) | Clinical scores |
| Observation | [NeuroPlusObservationVitalSign](StructureDefinition-observation-vital-sign.html) | Vital signs, meeting FHIR's vital-signs profile |
| Observation | [NeuroPlusObservationBloodPressure](StructureDefinition-observation-blood-pressure.html) | Blood pressure as one record with systolic and diastolic components, meeting FHIR's blood-pressure profile |
| Observation | [NeuroPlusObservationImagingMeasure](StructureDefinition-observation-imaging-measure.html) | Imaging-derived measures |
| Condition | [NeuroPlusCondition](StructureDefinition-condition.html) | Neurological, cardiovascular, and other clinical conditions |
| Patient | [NeuroPlusPatient](StructureDefinition-patient.html) | Subject of record, with custom race and ethnicity extensions |
| Encounter | [NeuroPlusEncounter](StructureDefinition-encounter.html) | Study visits and clinical contacts |
| Procedure | [NeuroPlusProcedure](StructureDefinition-procedure.html) | Procedures as in base FHIR (no study dataset provides them) |
| Medication | [NeuroPlusMedication](StructureDefinition-medication.html) | Medication definitions referenced by medication statements and administrations |
| MedicationAdministration | [NeuroPlusMedicationAdministration](StructureDefinition-medication-administration.html) | Tracer or contrast agent administered for imaging, linked from the imaging series |
| MedicationStatement | [NeuroPlusMedicationStatement](StructureDefinition-medication-statement.html) | Reported patient medication usage (the medication resource in the FHIR Bundle export) |
| ResearchStudy | [NeuroPlusResearchStudy](StructureDefinition-research-study.html) | Research studies (e.g. ADNI cohorts) patients are enrolled in; each dataset's data use agreement governs the use of its data |
| ResearchSubject | [NeuroPlusResearchSubject](StructureDefinition-research-subject.html) | Patient enrollment in a research study, without a consent link where the source holds no consent per person |
| Consent | [NeuroPlusConsent](StructureDefinition-consent.html) | Patient consent, for sources that record consent per person |
| Device | [NeuroPlusDevice](StructureDefinition-device.html) | Imaging scanners, analysis software and lab assay platforms, told apart by device type |
| Device | [NeuroPlusAssayDevice](StructureDefinition-assay-device.html) | Lab assay platforms, one shared record per platform, linked from each lab value |
| BodyStructure | [NeuroPlusBodyStructure](StructureDefinition-body-structure.html) | Body structures of one person, with a laterality extension |
| BodyStructure | [NeuroPlusAtlasRegion](StructureDefinition-atlas-region.html) | Brain regions as an atlas defines them, one record shared by all participants |

#### FHIR version and MII

The IG is written for FHIR R4B (4.3.0). Where it follows the Medical Informatics Initiative (MII) core data set, it uses MII's published artifacts directly, e.g. MII's MR code lists and series-UID extension, and therefore depends on the MII imaging module (`de.medizininformatikinitiative.kerndatensatz.bildgebung` 2026.0.0). MII publishes for FHIR R4 (4.0.1); the IG Publisher reports each R4 package in an R4B guide, which is expected here.

#### Shared rules

Rules that apply to all profiles, such as how identifiers name their issuer and how each record names its profile and source dataset, are on the [Shared Rules](shared-rules.html) page.

#### Extensions

The ImagingStudy profile includes custom extensions on `ImagingStudy.series` for detailed acquisition metadata such as the MR, PET and SPECT acquisition details, the link to the tracer or contrast administration, and voxel resolution, and one on `ImagingStudy` for the patient's age at the study. Additional custom extensions cover `Race` and `Ethnicity` on Patient, `BodyStructureLaterality` on BodyStructure, the patient's age at each event (observation, encounter, condition, participation, procedure), and the links from an Observation and its components to body structures. See [Extensions](extensions.html) for the full list.

#### Terminology

One Neuro+ CodeSystem (`https://sphin-x.de/fhir/coding`) for all Neuro+-specific codes and Neuro+ ValueSets define the codes for MRI sequences, contrasts, device types, lab methods, PET and SPECT tracers, observation types, condition codes, encounter classes, body structures, laterality, location qualifiers, and race/ethnicity. External terminologies (SNOMED CT, LOINC, MedDRA, DICOM, UMLS, PubChem, HL7 v3 ActCode, and the US CDC Race & Ethnicity code system) are also referenced.

#### Authors

Neuro+ is based on the FHIR implementation guide written by the authors listed below.

**AICURA Medical GmbH**

- Janis Reinelt (janis.reinelt@aicura-medical.com)
- Konstantin Thierbach (konstantin.thierbach@aicura-medical.com)
- Manuel Kienast (manuel.kienast@aicura-medical.com)
