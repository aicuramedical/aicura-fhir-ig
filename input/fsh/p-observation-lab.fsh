Profile: AicuraObservationLab
Parent: AicuraObservation
Id: observation-lab
Title: "AICURA Lab Value"
Description: "Laboratory result (e.g. a CSF or plasma biomarker) in AICURA's clinical data model. It follows the structure of the MII lab module (laboratory category, grouping of lab codes) but uses international codes and English displays instead of MII's German ones, and claims no conformance to MII's lab profiles."
* insert MetaProfile(observation-lab)
* insert ObservationCategory(laboratory)
// Assay platform and technique
* device MS
* device only Reference(AicuraAssayDevice)
* device ^comment = "The assay platform that produced the value, one shared AicuraAssayDevice record per platform. Assays measure the same biomarker on different scales; the link keeps their values apart and makes the platform searchable."
* method from AicuraLabMethodVS (extensible)
* method ^comment = "The technique only (e.g. immunoassay, mass spectrometry). The platform goes to device, not into the method or its text."
// No body site: the sample type is part of the LOINC code, as in MII's lab profile
* bodySite 0..0
