ValueSet: NeuroPlusBodyStructureVS
Id: neuroplus-body-structure
Title: "Neuro+ Body Structure ValueSet"
Description: "Anatomical structures for BodyStructure.location (neuroimaging focus): any SNOMED CT anatomical or acquired body structure, the main code system, and the Neuro+ codes of brain-atlas regions, mostly regions SNOMED CT does not name."
* ^experimental = false
// SNOMED CT: anatomical or acquired body structure and its descendants
* include codes from system $SCT where concept is-a #442083009
// Neuro+ region codes
* $NeuroPlusCoding#"Anterior cingulate cortex" "Anterior cingulate cortex"
* $NeuroPlusCoding#"Posterior cingulate cortex" "Posterior cingulate cortex"
* $NeuroPlusCoding#"Isthmus of cingulate gyrus" "Isthmus of cingulate gyrus"
* $NeuroPlusCoding#"Orbitofrontal cortex" "Orbitofrontal cortex"
* $NeuroPlusCoding#"Pericalcarine cortex" "Pericalcarine cortex"
* $NeuroPlusCoding#"Banks of superior temporal sulcus" "Banks of superior temporal sulcus"
* $NeuroPlusCoding#"Hemisphere white matter" "Hemisphere white matter"
* $NeuroPlusCoding#"Total brain gray matter" "Total brain gray matter"
* $NeuroPlusCoding#"Subcortical gray matter" "Subcortical gray matter"
* $NeuroPlusCoding#"White matter hypointensities" "White matter hypointensities"
* $NeuroPlusCoding#"Non-white matter hypointensities" "Non-white matter hypointensities"
* $NeuroPlusCoding#"Cerebral vasculature" "Cerebral vasculature"
* $NeuroPlusCoding#"Intracranial volume [ICV]" "Intracranial volume [ICV]"
