// Rules every AICURA Observation profile shares, whatever its parent
// (AicuraObservation or FHIR's vital-signs profile).
RuleSet: ObservationCommon
* subject MS
* subject only Reference(Patient)
* extension contains AicuraAgeAtObservation named ageAtObservation 0..1 MS

// Requires one category code from the HL7 observation-category code system,
// in a slice named after it; further category codes stay allowed.
RuleSet: ObservationCategory(code)
* category 1..* MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains {code} 1..1 MS
* category[{code}] = $ObsCat#{code}
