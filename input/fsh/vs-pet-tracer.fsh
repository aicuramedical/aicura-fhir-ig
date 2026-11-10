ValueSet: NeuroPlusPETTracerVS
Id: neuroplus-pet-tracer
Title: "Neuro+ PET Tracer ValueSet"
Description: "PET tracers used in Neuro+ imaging studies, coded with their entry in DICOM's PET tracer list (CID 4021), as MII binds it. A tracer the list has no code for is coded by its PubChem compound ID. The label (CodeableConcept.text) is the PubChem name, see NeuroPlusTracerPubChemVS."
* ^experimental = false
* $SCT#35321007 "Fluorodeoxyglucose F^18^"
* $SCT#456997008 "Flutemetamol F^18^"
* $SCT#879808000 "Flortaucipir F^18^"
* $SCT#712736002 "Florbetaben F^18^"
* $SCT#456995000 "Florbetapir F^18^"
* $DICOM#126500 "Pittsburgh compound B C^11^"
* $UMLS#C5433257 "PI-2620 F^18^" // Izaflortaucipir
* $UMLS#C2934038 "Fluoropropyl-dihydrotetrabenazine F^18^" // Florbenazine
* $UMLS#C4506764 "MK-6240 F^18^" // Florquinitau
* $PubChem#44815683 "Flutafuranol F 18" // not in CID 4021
* $NeuroPlusCoding#"Unresolved Tracer Label" "Unresolved Tracer Label"
