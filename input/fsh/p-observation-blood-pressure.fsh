Profile: AicuraObservationBloodPressure
Parent: http://hl7.org/fhir/StructureDefinition/bp
Id: observation-blood-pressure
Title: "AICURA Blood Pressure"
Description: "Blood pressure in AICURA's clinical data model: one record (LOINC 85354-9) with systolic (8480-6) and diastolic (8462-4) blood pressure as its two components. It derives from FHIR's blood-pressure profile, so every record also meets FHIR's vital-signs profiles, and carries the rules all AICURA Observation profiles share."
* insert MetaProfile(observation-blood-pressure)
* insert ObservationCommon
* insert IdentifierSystem
