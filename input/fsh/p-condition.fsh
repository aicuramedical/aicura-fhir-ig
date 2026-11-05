Profile: AicuraCondition
Parent: Condition
Id: condition
Title: "AICURA Condition"
Description: "Constrained Condition profile for AICURA's clinical data model, covering neurological, cardiovascular, and other disorders."
* insert MetaProfile(condition)
* insert IdentifierSystem
// Must-support elements
* clinicalStatus MS
* verificationStatus MS
* code MS
* code ^short = "Diagnosis: SNOMED CT where it has the concept, else an AICURA code"
* code ^comment = "Main code system SNOMED CT: every diagnosis carries its SNOMED CT concept where SNOMED CT has one, which keeps the neurodegenerative subtypes apart and fits MII's SNOMED CT slot. An AICURA code (https://aicuramedical.com/fhir/coding) is used only where SNOMED CT has no concept. ICD-10-GM and Orphanet codes may follow as further codings of the same diagnosis."
* bodySite MS
* subject MS
* subject only Reference(Patient)
* encounter MS
* onset[x] MS
* recordedDate MS
* stage MS
// Custom extensions (age instead of dates)
* extension contains
    AicuraAgeRecorded named ageRecorded 0..1 MS and
    AicuraAgeOnset named ageOnset 0..1 and
    AicuraAgeAtCondition named ageAtCondition 0..1
// ValueSet bindings
* code from AicuraConditionCodeVS (extensible)
