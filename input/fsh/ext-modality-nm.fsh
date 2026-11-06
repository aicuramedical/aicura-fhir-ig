Extension: AicuraModalityNM
Id: ModalityNM
Title: "SPECT (NM) Acquisition"
Description: "Tracer and acquisition details of a SPECT series (modality NM). Shaped like MII's NM extension (mii-ex-bildgebung-modalitaet-nm): the parts radiopharmaceutical, radionuclide, radionuclideTotalDose and radionuclideHalfLife keep MII's names, types and units, so they map 1:1. AICURA adds the injection time and the acquisition plane. Tracer, dose and injection time are filled from the source known to be correct for the dataset (curated study data, or the scanner header where its values have been checked), the same source as the series' administration record (SeriesMedicationAdministration)."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/ModalityNM"
* insert ExtensionContext(ImagingStudy.series)
* obeys aic-tr-1
* extension contains
    radiopharmaceutical 0..1 and
    radionuclide 0..1 and
    radionuclideTotalDose 0..1 and
    radionuclideHalfLife 0..1 and
    injectionTime 0..1 and
    acquisitionPlane 0..1
// Parts shaped like MII's
* extension[radiopharmaceutical] ^short = "Tracer (radiopharmaceutical)"
* extension[radiopharmaceutical] ^definition = "The tracer, coded with its entry in DICOM's SPECT tracer list (DICOM CID 25; code system as listed there, mostly SNOMED CT), as MII binds it. A tracer the list has no code for is coded by its PubChem compound ID instead. The text is the tracer's PubChem name."
* extension[radiopharmaceutical].value[x] only CodeableConcept
* extension[radiopharmaceutical].valueCodeableConcept from $DicomCID25 (extensible)
* extension[radiopharmaceutical].valueCodeableConcept.coding 1..*
* extension[radiopharmaceutical].valueCodeableConcept.text 1..1
* extension[radiopharmaceutical].valueCodeableConcept.text ^short = "PubChem name of the tracer"
* extension[radionuclide] ^short = "Radionuclide, e.g. 18F"
* extension[radionuclide].value[x] only CodeableConcept
* extension[radionuclide].valueCodeableConcept from $DicomCID18 (extensible)
* extension[radionuclide].valueCodeableConcept.text MS
* extension[radionuclideTotalDose] ^short = "Administered activity, in megabecquerel"
* extension[radionuclideTotalDose].value[x] only Quantity
* extension[radionuclideTotalDose].valueQuantity = $UCUM#MBq "Megabecquerel"
* extension[radionuclideHalfLife] ^short = "Half-life of the radionuclide, in seconds"
* extension[radionuclideHalfLife].value[x] only Quantity
* extension[radionuclideHalfLife].valueQuantity = $UCUM#s "Seconds"
// AICURA parts
* extension[injectionTime] ^short = "Injection time (start of the administration)"
* extension[injectionTime] ^definition = "Date and time the radiopharmaceutical was injected, as DICOM Radiopharmaceutical Start DateTime (0018,1078). Equals the effective time of the linked administration record."
* extension[injectionTime].value[x] only dateTime
* extension[acquisitionPlane] ^short = "Acquisition plane: axial, sagittal or coronal"
* extension[acquisitionPlane].value[x] only CodeableConcept
* extension[acquisitionPlane].valueCodeableConcept from AicuraAcquisitionPlaneVS (extensible)
* extension[acquisitionPlane].valueCodeableConcept.coding 1..1
* extension[acquisitionPlane].valueCodeableConcept.text 1..1
* value[x] 0..0
