Profile: AicuraPatient
Parent: Patient
Id: patient
Title: "AICURA Patient"
Description: "Constrained Patient profile for AICURA's clinical data model, the subject of record for observations, conditions, procedures, imaging studies, and research enrollment."
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
// Custom extensions (mirror US Core race/ethnicity without a US Core dependency)
* extension contains
    AicuraRace named race 0..1 MS and
    AicuraEthnicity named ethnicity 0..1 MS
* extension[race].valueCodeableConcept from AicuraRaceEthnicityVS (extensible)
* extension[ethnicity].valueCodeableConcept from AicuraRaceEthnicityVS (extensible)
