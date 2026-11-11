Profile: NeuroPlusEndpoint
Parent: Endpoint
Id: endpoint
Title: "Neuro+ Endpoint"
Description: "Constrained Endpoint profile for Neuro+'s clinical data model: the image archive a study or series points to (ImagingStudy.endpoint, ImagingStudy.series.endpoint). Clients fetch the images through it."
* insert MetaProfile(endpoint)
* insert IdentifierSystem
// Must-support elements
* status MS
* connectionType MS
* payloadType MS
* payloadMimeType MS
* address MS
