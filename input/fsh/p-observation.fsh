Profile: AicuraObservation
Parent: Observation
Id: observation
Title: "AICURA Observation"
Description: "Common parent of AICURA's Observation profiles per kind of result: lab value, clinical score and imaging-derived measure. Results of a kind without its own profile (e.g. genetics) use it directly. The vital-sign profile shares its common rules but derives from FHIR's vital-signs profile."
* insert MetaProfile(observation)
* insert ObservationCommon
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
    AicuraObservationBodyStructure named bodyStructure 0..1 MS
* component.extension contains
    AicuraObservationComponentBodyStructure named bodyStructure 0..1 MS and
    AicuraObservationComponentDevice named device 0..1 MS
// ValueSet bindings
* code from AicuraObservationCodeVS (extensible)
