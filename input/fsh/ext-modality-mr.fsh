Extension: AicuraModalityMR
Id: ModalityMR
Title: "MR Acquisition"
Description: "Acquisition details of an MR series, filled from the DICOM header. Shaped like MII's MR extension (mii-ex-bildgebung-modalitaet-mr): its seven parts keep MII's names, types and units, so they map 1:1. AICURA adds three parts MII does not have: the sequence name, the contrast weighting and the acquisition plane."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/ModalityMR"
* insert ExtensionContext(ImagingStudy.series)
* extension contains
    magneticFieldStrength 0..1 and
    scanningSequence 0..* and
    scanningSequenceVariant 0..* and
    echoTime 0..1 and
    repetitionTime 0..1 and
    inversionTime 0..1 and
    flipAngle 0..1 and
    sequenceName 0..1 and
    contrastWeighting 0..1 and
    acquisitionPlane 0..1
// Parts shaped like MII's
* extension[magneticFieldStrength] ^short = "Magnetic field strength, DICOM (0018,0087), in tesla"
* extension[magneticFieldStrength].value[x] only Quantity
* extension[magneticFieldStrength].valueQuantity = $UCUM#T
* extension[scanningSequence] ^short = "Scanning technique, DICOM (0018,0020), one entry per value"
* extension[scanningSequence].value[x] only CodeableConcept
* extension[scanningSequence].valueCodeableConcept from $MIIScanningSequenceVS (required)
* extension[scanningSequenceVariant] ^short = "Sequence variant, DICOM (0018,0021), one entry per value"
* extension[scanningSequenceVariant].value[x] only CodeableConcept
* extension[scanningSequenceVariant].valueCodeableConcept from $MIIScanningSequenceVariantVS (required)
* extension[echoTime] ^short = "Echo time (TE), DICOM (0018,0081), in milliseconds"
* extension[echoTime].value[x] only Quantity
* extension[echoTime].valueQuantity = $UCUM#ms
* extension[repetitionTime] ^short = "Repetition time (TR), DICOM (0018,0080), in milliseconds"
* extension[repetitionTime].value[x] only Quantity
* extension[repetitionTime].valueQuantity = $UCUM#ms
* extension[inversionTime] ^short = "Inversion time (TI), DICOM (0018,0082), in milliseconds"
* extension[inversionTime].value[x] only Quantity
* extension[inversionTime].valueQuantity = $UCUM#ms
* extension[flipAngle] ^short = "Flip angle, DICOM (0018,1314), in degrees"
* extension[flipAngle].value[x] only Quantity
* extension[flipAngle].valueQuantity = $UCUM#deg
// AICURA parts
* extension[sequenceName] ^short = "Sequence name, e.g. MPRAGE, TSE, FLAIR"
* extension[sequenceName] ^definition = "The protocol-level sequence name by which neurodegeneration research selects cohorts. It is finer than the DICOM technique codes in scanningSequence and scanningSequenceVariant, which it complements."
* extension[sequenceName].value[x] only CodeableConcept
* extension[sequenceName].valueCodeableConcept from AicuraMRISequenceVS (required)
* extension[sequenceName].valueCodeableConcept.coding 1..1
* extension[sequenceName].valueCodeableConcept.text 1..1
* extension[contrastWeighting] ^short = "Contrast weighting, e.g. T1w, T2w, T2w FLAIR"
* extension[contrastWeighting] ^definition = "The image weighting, the first criterion imaging researchers select series by (e.g. T1w for volume measurements). Not to be confused with a contrast agent."
* extension[contrastWeighting].value[x] only CodeableConcept
* extension[contrastWeighting].valueCodeableConcept from AicuraMRIContrastVS (required)
* extension[contrastWeighting].valueCodeableConcept.coding 1..1
* extension[contrastWeighting].valueCodeableConcept.text 1..1
* extension[acquisitionPlane] ^short = "Acquisition plane: axial, sagittal or coronal"
* extension[acquisitionPlane].value[x] only CodeableConcept
* extension[acquisitionPlane].valueCodeableConcept from AicuraAcquisitionPlaneVS (extensible)
* extension[acquisitionPlane].valueCodeableConcept.coding 1..1
* extension[acquisitionPlane].valueCodeableConcept.text 1..1
* value[x] 0..0
