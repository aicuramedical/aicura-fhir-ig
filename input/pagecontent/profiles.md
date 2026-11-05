### Profiles

This IG defines seventeen FHIR R4B profiles. All of them follow the [Shared Rules](shared-rules.html), e.g. every identifier names its issuer in `system`.

#### AicuraImagingStudy

[AicuraImagingStudy](StructureDefinition-imaging-study.html) constrains ImagingStudy with must-support on identifier, status, subject, encounter, started, description, endpoint, series and its uid, number, modality, description, instance count, start, endpoint and body site; id, an identifier value and subject are required. It adds the patient's age at the study and 17 series-level extensions for imaging acquisition metadata including voxel resolution, image resolution, MRI sequence, contrast weighting, PET tracer, device information, age at the series and storage size.

##### Linking a result to a series

Almost every result in neurodegeneration imaging (a regional volume, a quality check) is computed from one series, not from the whole study. FHIR R4B cannot reference a single series: a reference targets a whole resource, and the series sits inside the ImagingStudy. A result computed from a series therefore carries two things:

- `Observation.derivedFrom` referencing the ImagingStudy, and
- MII's series-UID extension (`https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-ex-bildgebung-series-uid`, `valueId`) holding the `series.uid` of that series, the DICOM Series Instance UID.

The extension is used exactly as the MII imaging module publishes it (this IG depends on `de.medizininformatikinitiative.kerndatensatz.bildgebung` 2026.0.0), so MII systems recognise the link. A reference to the series as a resource of its own, such as `ImagingSeries/<uid>`, is not valid FHIR. When the model moves to FHIR R6, the resource ImagingSelection takes the place of this pair.

#### AicuraObservation

[AicuraObservation](StructureDefinition-observation.html) is the common parent of the Observation profiles per kind of result (below). It constrains Observation with must-support on status, category, code, subject, effective, value, performer, derivedFrom, component, bodySite, interpretation, and method. The `code` element is bound to the [AicuraObservationCodeVS](ValueSet-aicura-observation-code.html) covering LOINC, SNOMED-CT, and AICURA custom observation codes. Extensions record the patient's age at the observation and link the Observation to the body structure its value refers to; on each component, extensions link the component's value to its body structure and to the device (analysis software) that produced it.

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

#### AicuraCondition

[AicuraCondition](StructureDefinition-condition.html) constrains Condition with must-support on clinicalStatus, verificationStatus, code, bodySite, subject, encounter, onset, recordedDate, and stage. The `code` element is bound to the [AicuraConditionCodeVS](ValueSet-aicura-condition-code.html) spanning SNOMED-CT, AICURA custom, and MedDRA codes. Extensions record the patient's age at the recorded date (`AgeRecorded`) and at onset (`AgeOnset`, and the older `AgeAtCondition` with the same value).

#### AicuraPatient

[AicuraPatient](StructureDefinition-patient.html) constrains Patient with must-support on identifier, gender, birthDate, and deceased. It adds `race` and `ethnicity` extensions bound to the [AicuraRaceEthnicityVS](ValueSet-aicura-race-ethnicity.html) (US CDC Race & Ethnicity code system); these mirror the US Core race/ethnicity extensions without taking a US Core dependency. Patient identifiers are typed as pseudonyms (`PSEUDED`).

#### AicuraEncounter

[AicuraEncounter](StructureDefinition-encounter.html) constrains Encounter with must-support on status, class, type, subject, period, and location. The `class` element is bound to the [AicuraEncounterClassVS](ValueSet-aicura-encounter-class.html) (HL7 v3 ActCode). The `AgeAtEncounter` extension records the patient's age at the start of the encounter.

#### AicuraProcedure

[AicuraProcedure](StructureDefinition-procedure.html) leaves Procedure as in base FHIR R4B apart from the [Shared Rules](shared-rules.html), without bindings or must-support flags of its own. The `AgeAtProcedure` extension records the patient's age at the procedure. No AICURA study dataset provides procedures; the platform holds them from other clinical sources.

#### AicuraMedication

[AicuraMedication](StructureDefinition-medication.html) constrains Medication with must-support on code, status, manufacturer, form, amount, ingredient, and batch. It defines the medications referenced by medication statements.

#### AicuraMedicationStatement

[AicuraMedicationStatement](StructureDefinition-medication-statement.html) constrains MedicationStatement with must-support on status, statusReason, category, medication, subject, context, effective, dateAsserted, informationSource, reasonCode, reasonReference, and dosage. This is the medication resource included in AICURA's FHIR Bundle export.

#### AicuraResearchStudy

[AicuraResearchStudy](StructureDefinition-research-study.html) constrains ResearchStudy with must-support on identifier, title, status, primaryPurposeType, phase, category, focus, condition, period, description, sponsor, principalInvestigator, site, arm, and objective. It describes the studies (e.g. ADNI cohorts) that patients are enrolled in.

#### AicuraResearchSubject

[AicuraResearchSubject](StructureDefinition-research-subject.html) constrains ResearchSubject with must-support on identifier, status, period, study, individual, assignedArm, and actualArm. Participant codes are typed as anonymised (`ANON`). The `AgeAtResearch` extension records the patient's age at the start of the participation.

#### AicuraConsent

[AicuraConsent](StructureDefinition-consent.html) constrains Consent with must-support on status, scope, category, patient, dateTime, performer, organization, source, policy, policyRule, verification, and provision. It captures a patient's consent for research participation and data use.

#### AicuraDevice

[AicuraDevice](StructureDefinition-device.html) constrains Device with must-support on identifier, udiCarrier, status, manufacturer, manufactureDate, expirationDate, lotNumber, serialNumber, deviceName, modelNumber, type, version, patient, owner, location, note, safety, and parent. It represents imaging scanners and other devices referenced by clinical and imaging resources.

#### AicuraBodyStructure

[AicuraBodyStructure](StructureDefinition-body-structure.html) constrains BodyStructure with must-support on identifier, active, morphology, location, locationQualifier, description, and patient. The `location` and `locationQualifier` elements are bound to the [AicuraBodyStructureVS](ValueSet-aicura-body-structure.html) and [AicuraLocationQualifierVS](ValueSet-aicura-location-qualifier.html) respectively, and a custom `laterality` extension ([BodyStructureLaterality](StructureDefinition-BodyStructureLaterality.html), bound to [AicuraLateralityVS](ValueSet-aicura-laterality.html)) captures body side, which base BodyStructure does not model.
