Profile: NeuroPlusPatient
Parent: Patient
Id: patient
Title: "Neuro+ Patient"
Description: "Constrained Patient profile for Neuro+'s clinical data model, the subject of record for observations, conditions, procedures, imaging studies, and research enrollment."
* insert MetaProfile(patient)
* insert IdentifierSystem
// Must-support elements
* identifier MS
* identifier.type 1..1 MS
* identifier.type = $v3ObsValue#PSEUDED
* identifier.type ^short = "Pseudonym (PSEUDED), as in MII's pseudonymised Patient"
* identifier.type.text 1..1 MS
* gender MS
* birthDate MS
* deceased[x] MS
* deceased[x] ^short = "Date of death (deceasedDateTime), where the source reports a death"
* deceased[x] ^comment = "A death is recorded on the Patient record, as in base FHIR, with the date of death in deceasedDateTime at the precision the source gives. MII's separate vital-status Observation is not used: no source reports repeated vital-status checks, and follow-up states such as lost to follow-up belong to the study participation (ResearchSubject). An export to MII can derive that Observation from this field."
// Custom extensions (mirror US Core race/ethnicity without a US Core dependency)
* extension contains
    NeuroPlusRace named race 0..1 MS and
    NeuroPlusEthnicity named ethnicity 0..1 MS
* extension[race].valueCodeableConcept from NeuroPlusRaceEthnicityVS (extensible)
* extension[ethnicity].valueCodeableConcept from NeuroPlusRaceEthnicityVS (extensible)
