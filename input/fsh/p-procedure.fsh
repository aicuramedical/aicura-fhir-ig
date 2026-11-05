Profile: AicuraProcedure
Parent: Procedure
Id: procedure
Title: "AICURA Procedure"
Description: "Constrained Procedure profile for AICURA's clinical data model, covering diagnostic and therapeutic procedures performed on a patient."
* insert MetaProfile(procedure)
// Must-support elements
* status MS
* category MS
* code MS
* subject MS
* subject only Reference(Patient)
* encounter MS
* performed[x] MS
* performer MS
* location MS
* reasonCode MS
* reasonReference MS
* bodySite MS
* outcome MS
* complication MS
* followUp MS
* focalDevice MS
* usedReference MS
* usedCode MS
// Custom extensions (age instead of dates)
* extension contains AicuraAgeAtProcedure named ageAtProcedure 0..1
// ValueSet bindings
* bodySite from AicuraBodyStructureVS (extensible)
