Profile: NeuroPlusProcedure
Parent: Procedure
Id: procedure
Title: "Neuro+ Procedure"
Description: "Procedure as in base FHIR R4B, with the patient's age at the procedure and the rules all Neuro+ profiles share. No Neuro+ study dataset provides procedures; the platform holds them from other clinical sources."
* insert MetaProfile(procedure)
* insert IdentifierSystem
// Custom extensions (age instead of dates)
* extension contains NeuroPlusAgeAtProcedure named ageAtProcedure 0..1
