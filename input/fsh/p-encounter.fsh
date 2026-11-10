Profile: NeuroPlusEncounter
Parent: Encounter
Id: encounter
Title: "Neuro+ Encounter"
Description: "Constrained Encounter profile for Neuro+'s clinical data model, representing study visits and clinical contacts during which observations, conditions, procedures, and imaging studies are recorded."
* insert MetaProfile(encounter)
* insert IdentifierSystem
// Must-support elements
* status MS
* class MS
* type MS
* subject MS
* subject only Reference(Patient)
* period MS
* location MS
// Custom extensions (age instead of dates)
* extension contains NeuroPlusAgeAtEncounter named ageAtEncounter 0..1 MS
// ValueSet bindings
* class from NeuroPlusEncounterClassVS (extensible)
