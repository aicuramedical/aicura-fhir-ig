Extension: AicuraSliceSpacing
Id: SliceSpacing
Title: "Slice Spacing"
Description: "Distance between the centres of adjacent slices of an imaging series, in millimetres: DICOM Spacing Between Slices (0018,0088), or computed from the slice positions. It differs from the slice thickness when slices have gaps or overlap, and is needed to measure sizes and volumes correctly."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/SliceSpacing"
* insert ExtensionContext(ImagingStudy.series)
* value[x] only Quantity
* valueQuantity = $UCUM#mm
