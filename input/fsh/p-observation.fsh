Profile: AicuraObservation
Parent: Observation
Id: observation
Title: "AICURA Observation"
Description: "Constrained Observation profile for AICURA's clinical assessments, laboratory results, genetics, vital signs, and imaging-derived measurements."
* insert MetaProfile(observation)
// Must-support elements
* status MS
* category MS
* code MS
* subject MS
* subject only Reference(Patient)
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
    AicuraAgeAtObservation named ageAtObservation 0..1 MS and
    AicuraObservationBodyStructure named bodyStructure 0..1 MS
* component.extension contains
    AicuraObservationComponentBodyStructure named bodyStructure 0..1 MS and
    AicuraObservationComponentDevice named device 0..1 MS
// ValueSet bindings
* code from AicuraObservationCodeVS (extensible)
