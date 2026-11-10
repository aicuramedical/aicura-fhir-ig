Profile: AicuraConsent
Parent: Consent
Id: consent
Title: "AICURA Consent"
Description: "Constrained Consent profile for AICURA's clinical data model, for sources that record consent per person (e.g. consents to take part in a trial, to give samples or to future research). Each consent is one Consent record referencing the patient, so a person may have several; the participation links the consent to take part. The study datasets hold no consent per person and carry no Consent records: each dataset's data use agreement governs the use of its data."
* insert MetaProfile(consent)
* insert IdentifierSystem
// Must-support elements
* status MS
* scope MS
* category MS
* patient MS
* patient only Reference(Patient)
* dateTime MS
* performer MS
* organization MS
* source[x] MS
* policy MS
* policyRule MS
* verification MS
* provision MS
