Profile: NeuroPlusObservationScore
Parent: NeuroPlusObservation
Id: observation-score
Title: "Neuro+ Clinical Score"
Description: "Result of an assessment instrument (e.g. CDR, MMSE, ADAS-Cog, UPDRS) in Neuro+'s clinical data model, whether rated by a clinician or reported by the participant."
* insert MetaProfile(observation-score)
* insert ObservationCategory(survey)
// Every score is a quantity labelled with the UCUM annotation {score}
* value[x] only Quantity
* valueQuantity = $UCUM#"{score}"
* valueQuantity ^comment = "Every score, whole points or not, is a quantity with the UCUM code {score}. {score} is a UCUM annotation: text in braces labels the unit 1, so the value stays dimensionless. One value type serves all scores, including half-point (CDR) and decimal (ADAS-Cog) ones, which FHIR R4B can only hold as a quantity."
