Extension: NeuroPlusImageResolution
Id: ImageResolution
Title: "Image Resolution"
Description: "Matrix size of an imaging series: columns, rows and slices per volume. A series with several volumes (e.g. diffusion, functional or dynamic PET) counts the slices of one volume."
* ^url = "http://sphin-x.de/fhir/StructureDefinition/ImageResolution"
* insert ExtensionContext(ImagingStudy.series)
* extension contains
    valueX 1..1 and
    valueY 1..1 and
    valueZ 1..1
* extension[valueX].value[x] only integer
* extension[valueX] ^short = "Columns, DICOM (0028,0011)"
* extension[valueY].value[x] only integer
* extension[valueY] ^short = "Rows, DICOM (0028,0010)"
* extension[valueZ].value[x] only integer
* extension[valueZ] ^short = "Slices per volume (all slices divided by the number of time points), not the number of files"
* value[x] 0..0
