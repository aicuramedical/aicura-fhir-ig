Extension: NeuroPlusSeriesMedicationAdministration
Id: SeriesMedicationAdministration
Title: "Series Medication Administration"
Description: "Links an imaging series to the record of a substance administered for it, a tracer or a contrast agent. The administration names the substance (Medication) and holds dose and injection time. One administration record serves all series acquired after the same injection."
* ^url = "http://sphin-x.de/fhir/StructureDefinition/SeriesMedicationAdministration"
* insert ExtensionContext(ImagingStudy.series)
* value[x] only Reference(NeuroPlusMedicationAdministration)
