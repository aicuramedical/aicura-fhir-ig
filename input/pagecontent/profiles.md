### Profiles

This IG defines thirteen FHIR R4B profiles:

#### AicuraImagingStudy

[AicuraImagingStudy](StructureDefinition-imaging-study.html) constrains ImagingStudy with must-support on identifier, status, subject, encounter, started, description, endpoint, series and its uid, number, modality, description, instance count, start, endpoint and body site; id, an identifier value and subject are required. It adds the patient's age at the study and 17 series-level extensions for imaging acquisition metadata including voxel resolution, image resolution, MRI sequence, contrast weighting, PET tracer, device information, age at the series and storage size.

#### AicuraObservation

[AicuraObservation](StructureDefinition-observation.html) constrains Observation with must-support on status, category, code, subject, effective, value, performer, derivedFrom, component, bodySite, interpretation, and method. The `code` element is bound to the [AicuraObservationCodeVS](ValueSet-aicura-observation-code.html) covering LOINC, SNOMED-CT, and AICURA custom observation codes. Extensions record the patient's age at the observation and link the Observation to the body structure its value refers to; on each component, extensions link the component's value to its body structure and to the device (analysis software) that produced it.

#### AicuraCondition

[AicuraCondition](StructureDefinition-condition.html) constrains Condition with must-support on clinicalStatus, verificationStatus, code, bodySite, subject, encounter, onset, recordedDate, and stage. The `code` element is bound to the [AicuraConditionCodeVS](ValueSet-aicura-condition-code.html) spanning SNOMED-CT, AICURA custom, and MedDRA codes. Extensions record the patient's age at the recorded date (`AgeRecorded`) and at onset (`AgeOnset`, and the older `AgeAtCondition` with the same value).

#### AicuraPatient

[AicuraPatient](StructureDefinition-patient.html) constrains Patient with must-support on identifier, gender, birthDate, and deceased. It adds `race` and `ethnicity` extensions bound to the [AicuraRaceEthnicityVS](ValueSet-aicura-race-ethnicity.html) (US CDC Race & Ethnicity code system); these mirror the US Core race/ethnicity extensions without taking a US Core dependency.

#### AicuraEncounter

[AicuraEncounter](StructureDefinition-encounter.html) constrains Encounter with must-support on status, class, type, subject, period, and location. The `class` element is bound to the [AicuraEncounterClassVS](ValueSet-aicura-encounter-class.html) (HL7 v3 ActCode). The `AgeAtEncounter` extension records the patient's age at the start of the encounter.

#### AicuraProcedure

[AicuraProcedure](StructureDefinition-procedure.html) leaves Procedure as in base FHIR R4B, without must-support flags or bindings. The `AgeAtProcedure` extension records the patient's age at the procedure. No AICURA study dataset provides procedures; the platform holds them from other clinical sources.

#### AicuraMedication

[AicuraMedication](StructureDefinition-medication.html) constrains Medication with must-support on code, status, manufacturer, form, amount, ingredient, and batch. It defines the medications referenced by medication statements.

#### AicuraMedicationStatement

[AicuraMedicationStatement](StructureDefinition-medication-statement.html) constrains MedicationStatement with must-support on status, statusReason, category, medication, subject, context, effective, dateAsserted, informationSource, reasonCode, reasonReference, and dosage. This is the medication resource included in AICURA's FHIR Bundle export.

#### AicuraResearchStudy

[AicuraResearchStudy](StructureDefinition-research-study.html) constrains ResearchStudy with must-support on identifier, title, status, primaryPurposeType, phase, category, focus, condition, period, description, sponsor, principalInvestigator, site, arm, and objective. It describes the studies (e.g. ADNI cohorts) that patients are enrolled in.

#### AicuraResearchSubject

[AicuraResearchSubject](StructureDefinition-research-subject.html) constrains ResearchSubject with must-support on identifier, status, period, study, individual, assignedArm, and actualArm. The `AgeAtResearch` extension records the patient's age at the start of the participation.

#### AicuraConsent

[AicuraConsent](StructureDefinition-consent.html) constrains Consent with must-support on status, scope, category, patient, dateTime, performer, organization, source, policy, policyRule, verification, and provision. It captures a patient's consent for research participation and data use.

#### AicuraDevice

[AicuraDevice](StructureDefinition-device.html) constrains Device with must-support on identifier, udiCarrier, status, manufacturer, manufactureDate, expirationDate, lotNumber, serialNumber, deviceName, modelNumber, type, version, patient, owner, location, note, safety, and parent. It represents imaging scanners and other devices referenced by clinical and imaging resources.

#### AicuraBodyStructure

[AicuraBodyStructure](StructureDefinition-body-structure.html) constrains BodyStructure with must-support on identifier, active, morphology, location, locationQualifier, description, and patient. The `location` and `locationQualifier` elements are bound to the [AicuraBodyStructureVS](ValueSet-aicura-body-structure.html) and [AicuraLocationQualifierVS](ValueSet-aicura-location-qualifier.html) respectively, and a custom `laterality` extension ([BodyStructureLaterality](StructureDefinition-BodyStructureLaterality.html), bound to [AicuraLateralityVS](ValueSet-aicura-laterality.html)) captures body side, which base BodyStructure does not model.
