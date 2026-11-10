Invariant: aic-vs-1
Description: "Systolic and diastolic blood pressure are the components of one blood pressure record (LOINC 85354-9), not records of their own."
Severity: #error
Expression: "code.coding.where(system = 'http://loinc.org' and (code = '8480-6' or code = '8462-4')).empty()"

Profile: NeuroPlusObservationVitalSign
Parent: http://hl7.org/fhir/StructureDefinition/vitalsigns
Id: observation-vital-sign
Title: "Neuro+ Vital Sign"
Description: "Vital sign (e.g. weight, height, heart rate) in Neuro+'s clinical data model. It derives from FHIR's vital-signs profile, so every record also meets that profile, and carries the rules all Neuro+ Observation profiles share. Blood pressure is one record of its own profile, Neuro+ Blood Pressure."
* insert MetaProfile(observation-vital-sign)
* insert ObservationCommon
* insert IdentifierSystem
* obeys aic-vs-1
