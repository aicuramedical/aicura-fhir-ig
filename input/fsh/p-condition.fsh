Profile: NeuroPlusCondition
Parent: Condition
Id: condition
Title: "Neuro+ Condition"
Description: "Constrained Condition profile for Neuro+'s clinical data model, covering neurological, cardiovascular, and other disorders."
* insert MetaProfile(condition)
* insert IdentifierSystem
// Must-support elements
* clinicalStatus MS
* verificationStatus MS
* code MS
* code ^short = "Diagnosis: SNOMED CT where it has the concept, else a Neuro+ code"
* code ^comment = "Main code system SNOMED CT: every diagnosis carries its SNOMED CT concept where SNOMED CT has one, which keeps the neurodegenerative subtypes apart and fits MII's SNOMED CT slot. A Neuro+ code (https://sphin-x.de/fhir/coding) is used only where SNOMED CT has no concept. ICD-10-GM and Orphanet codes may follow as further codings of the same diagnosis. MedDRA and Neuro+ codes still in use for diagnoses SNOMED CT covers move to SNOMED CT."
* bodySite MS
* subject MS
* subject only Reference(Patient)
* encounter MS
// onset stays must-support as in MII's diagnosis profile, although no study dataset fills it yet
* onset[x] MS
* recordedDate MS
* recordedDate ^short = "Date of the visit at which the diagnosis was recorded"
* stage MS
* stage.summary MS
* stage.summary ^short = "Stage of the disease, e.g. SNOMED CT 288480009 Prodromal phase"
* stage.summary ^comment = "A prodromal disease is recorded as the disease it precedes in code (e.g. Parkinson's disease, synucleinopathy) with SNOMED CT 288480009 Prodromal phase as the stage summary, not as a diagnosis of its own. Base FHIR requires a summary or an assessment on every stage (con-1)."
// Custom extensions (age instead of dates)
* extension contains
    NeuroPlusAgeRecorded named ageRecorded 0..1 MS and
    NeuroPlusAgeOnset named ageOnset 0..1 and
    NeuroPlusAgeAtCondition named ageAtCondition 0..1
// ValueSet bindings
* code from NeuroPlusConditionCodeVS (extensible)
