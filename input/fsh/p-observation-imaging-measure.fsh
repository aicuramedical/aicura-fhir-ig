Profile: AicuraObservationImagingMeasure
Parent: AicuraObservation
Id: observation-imaging-measure
Title: "AICURA Imaging-Derived Measure"
Description: "Measure derived from an image (e.g. a brain-region volume, cortical thickness or a PET SUVr) in AICURA's clinical data model. Region-wise measures are grouped: one Observation per image series, measure and atlas, with one component per brain region holding the value and its region."
* insert MetaProfile(observation-imaging-measure)
* insert ObservationCategory(imaging)
// One Observation per image series, measure and atlas
* component ^comment = "One component per brain region: the value and a link to its region. All components of one Observation share the image series, the measure, the time and the analysis software."
* component.code MS
* component.value[x] MS
* component.valueQuantity MS
// Region links point to the shared atlas regions
* extension[bodyStructure].value[x] only Reference(AicuraAtlasRegion)
* component.extension[bodyStructure].value[x] only Reference(AicuraAtlasRegion)
// Analysis software and its atlas, once for all values
* device MS
* device only Reference(AicuraDevice)
* device ^short = "Analysis software (with its atlas) that produced the values"
* device ^comment = "The atlas is the Device's brainAtlas property (see AicuraDevice)."
// Image series: the ImagingStudy in derivedFrom, the series UID in MII's extension
* extension contains $MIISeriesUID named seriesUid 0..1 MS
* extension[seriesUid] ^short = "DICOM Series Instance UID of the image series the values were computed from"
* derivedFrom ^comment = "The ImagingStudy the image series belongs to; the series itself is named by the seriesUid extension."
// Units in UCUM
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity ^short = "Value, unit in UCUM (e.g. cm3, cm2, cm)"
* component.valueQuantity.system = "http://unitsofmeasure.org"
* component.valueQuantity ^short = "Value of the region, unit in UCUM (e.g. cm3, cm2, cm)"
