Profile: AicuraProcedure
Parent: Procedure
Id: procedure
Title: "AICURA Procedure"
Description: "Procedure as in base FHIR R4B, with the patient's age at the procedure and the rules all AICURA profiles share. No AICURA study dataset provides procedures; the platform holds them from other clinical sources."
* insert MetaProfile(procedure)
* insert IdentifierSystem
// Custom extensions (age instead of dates)
* extension contains AicuraAgeAtProcedure named ageAtProcedure 0..1
