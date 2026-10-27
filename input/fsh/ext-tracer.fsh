Extension: AicuraTracer
Id: Tracer
Title: "PET Tracer"
Description: "Radiotracer compound used in this PET imaging series."
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/Tracer"
* insert ExtensionContext(ImagingStudy.series)
* insert CodedWithText(tracer)
* extension[tracer].valueCoding from AicuraPETTracerVS (required)
