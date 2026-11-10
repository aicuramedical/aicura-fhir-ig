Profile: NeuroPlusObservationLab
Parent: NeuroPlusObservation
Id: observation-lab
Title: "Neuro+ Lab Value"
Description: "Laboratory result (e.g. a CSF or plasma biomarker) in Neuro+'s clinical data model. It follows the structure of the MII lab module (laboratory category; MII's grouping code is added on export) but uses international codes and English displays instead of MII's German ones, and claims no conformance to MII's lab profiles."
* insert MetaProfile(observation-lab)
* insert ObservationCategory(laboratory)
// Assay platform and technique
* device MS
* device only Reference(NeuroPlusAssayDevice)
* device ^comment = "The assay platform that produced the value, one shared NeuroPlusAssayDevice record per platform. Assays measure the same biomarker on different scales; the link keeps their values apart and makes the platform searchable."
* method from NeuroPlusLabMethodVS (extensible)
* method ^comment = "The technique only (e.g. immunoassay, mass spectrometry). The platform goes to device, not into the method or its text."
// No body site or body-structure link: the sample type is part of the LOINC code, as in MII's lab profile
* bodySite 0..0
* extension[bodyStructure] 0..0
* component.extension[bodyStructure] 0..0
