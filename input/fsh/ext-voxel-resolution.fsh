Extension: AicuraVoxelResolution
Id: VoxelResolution
Title: "Voxel Resolution"
Description: "Acquired voxel size of an imaging series, in millimetres: in-plane pixel spacing (x, y) and slice thickness (z). The distance between slice centres is a separate value (SliceSpacing). The slice thickness maps 1:1 to MII's series slice thickness (mii-ex-bildgebung-serie-schichtdicke)."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/VoxelResolution"
* insert ExtensionContext(ImagingStudy.series)
* extension contains
    valueX 1..1 and
    valueY 1..1 and
    valueZ 0..1
* extension[valueX] ^short = "Column spacing (horizontal), second value of DICOM Pixel Spacing (0028,0030), in mm"
* extension[valueX].value[x] only Quantity
* extension[valueX].valueQuantity = $UCUM#mm
* extension[valueY] ^short = "Row spacing (vertical), first value of DICOM Pixel Spacing (0028,0030), in mm"
* extension[valueY].value[x] only Quantity
* extension[valueY].valueQuantity = $UCUM#mm
* extension[valueZ] ^short = "Slice thickness, DICOM (0018,0050), in mm; omitted where the header has none"
* extension[valueZ].value[x] only Quantity
* extension[valueZ].valueQuantity = $UCUM#mm
* value[x] 0..0
