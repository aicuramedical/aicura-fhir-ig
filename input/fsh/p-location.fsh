Profile: NeuroPlusLocation
Parent: Location
Id: location
Title: "Neuro+ Location"
Description: "Constrained Location profile for Neuro+'s clinical data model: a study site, referenced from Encounter.location and ResearchStudy.site."
* insert MetaProfile(location)
* insert IdentifierSystem
// Must-support elements
* status MS
* address MS
* address.country MS
* managingOrganization MS
