Profile: NeuroPlusMedicationStatement
Parent: MedicationStatement
Id: medication-statement
Title: "Neuro+ MedicationStatement"
Description: "Constrained MedicationStatement profile for Neuro+'s clinical data model, recording a patient's reported medication usage. This is the medication resource included in Neuro+'s FHIR Bundle export."
* insert MetaProfile(medication-statement)
* insert IdentifierSystem
// Must-support elements
* status MS
* statusReason MS
* category MS
* medication[x] MS
* subject MS
* subject only Reference(Patient)
* context MS
* effective[x] MS
* dateAsserted MS
* informationSource MS
* reasonCode MS
* reasonReference MS
* dosage MS
