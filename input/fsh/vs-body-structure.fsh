ValueSet: AicuraBodyStructureVS
Id: aicura-body-structure
Title: "AICURA Body Structure ValueSet"
Description: "Anatomical structures for BodyStructure.location (neuroimaging focus): any SNOMED CT anatomical or acquired body structure, the main code system, and the AICURA codes of brain-atlas regions, mostly regions SNOMED CT does not name."
* ^experimental = false
// SNOMED CT: anatomical or acquired body structure and its descendants
* include codes from system $SCT where concept is-a #442083009
// AICURA region codes
* $AicuraCoding#"Anterior cingulate cortex" "Anterior cingulate cortex"
* $AicuraCoding#"Posterior cingulate cortex" "Posterior cingulate cortex"
* $AicuraCoding#"Isthmus of cingulate gyrus" "Isthmus of cingulate gyrus"
* $AicuraCoding#"Orbitofrontal cortex" "Orbitofrontal cortex"
* $AicuraCoding#"Pericalcarine cortex" "Pericalcarine cortex"
* $AicuraCoding#"Banks of superior temporal sulcus" "Banks of superior temporal sulcus"
* $AicuraCoding#"Hemisphere white matter" "Hemisphere white matter"
* $AicuraCoding#"Total brain gray matter" "Total brain gray matter"
* $AicuraCoding#"Subcortical gray matter" "Subcortical gray matter"
* $AicuraCoding#"White matter hypointensities" "White matter hypointensities"
* $AicuraCoding#"Non-white matter hypointensities" "Non-white matter hypointensities"
* $AicuraCoding#"Cerebral vasculature" "Cerebral vasculature"
* $AicuraCoding#"Intracranial volume [ICV]" "Intracranial volume [ICV]"
