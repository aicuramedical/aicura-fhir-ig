Profile: NeuroPlusObservation
Parent: Observation
Id: observation
Title: "Neuro+ Observation"
Description: "Common parent of Neuro+'s Observation profiles per kind of result: lab value, clinical score and imaging-derived measure. Results of a kind without its own profile (e.g. genetics) use it directly. The vital-sign and blood-pressure profiles share its common rules but derive from FHIR's vital-signs profiles."
* insert MetaProfile(observation)
* insert ObservationCommon
* insert IdentifierSystem
// Must-support elements
* status MS
* category MS
* code MS
* encounter MS
* effective[x] MS
* value[x] MS
* performer MS
* derivedFrom MS
* component MS
* bodySite MS
* interpretation MS
* method MS
// Custom extensions
* extension contains
    NeuroPlusObservationBodyStructure named bodyStructure 0..1 MS
* component.extension contains
    NeuroPlusObservationComponentBodyStructure named bodyStructure 0..1 MS
// ValueSet bindings
* code from NeuroPlusObservationCodeVS (extensible)
