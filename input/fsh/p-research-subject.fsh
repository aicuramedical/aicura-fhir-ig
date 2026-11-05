Profile: AicuraResearchSubject
Parent: ResearchSubject
Id: research-subject
Title: "AICURA ResearchSubject"
Description: "Constrained ResearchSubject profile linking an AICURA patient to a research study, including assigned and actual study arm."
* insert MetaProfile(research-subject)
* insert IdentifierSystem
// Must-support elements
* identifier MS
* identifier.type 1..1 MS
* identifier.type = $v2IdType#ANON
* identifier.type ^short = "Anonymised participant code (ANON), as in MII's study participant"
* identifier.type.text 1..1 MS
* status MS
* period MS
* study MS
* individual MS
* individual only Reference(Patient)
* assignedArm MS
* actualArm MS
// Custom extensions (age instead of dates)
* extension contains AicuraAgeAtResearch named ageAtResearch 0..1
