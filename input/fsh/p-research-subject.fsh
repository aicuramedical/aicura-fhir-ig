Profile: AicuraResearchSubject
Parent: ResearchSubject
Id: research-subject
Title: "AICURA ResearchSubject"
Description: "Constrained ResearchSubject profile linking an AICURA patient to a research study, including assigned and actual study arm. The data use agreement of the study dataset governs the use of the participant's data; the study datasets hold no consent per person, so their participants link no consent record."
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
// Not must-support: the study datasets hold no consent per person.
* consent ^comment = "Empty for the study datasets: they hold no consent per person, and each dataset's data use agreement governs the use of its data. No Consent record is created in its place, since it would claim a consent nobody documented. Where a source records consent per person, each consent is a Consent record referencing the patient, and this element links the consent to take part in the study; FHIR R4B allows one link, so further consents (e.g. for samples or future research) are found through Consent.patient."
// Custom extensions (age instead of dates)
* extension contains AicuraAgeAtResearch named ageAtResearch 0..1
