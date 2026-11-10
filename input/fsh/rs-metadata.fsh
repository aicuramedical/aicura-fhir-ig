// Canonical URL of the profile; every record names its profile and its source dataset.
RuleSet: MetaProfile(profile)
* ^url = "http://sphin-x.de/fhir/StructureDefinition/{profile}"
* meta.profile MS
* meta.profile ^short = "Neuro+ profile with IG version: <profile canonical>|<IG version>"
* meta.source MS
* meta.source ^short = "Source dataset and version: http://sphin-x.de/fhir/dataset/<dataset>#<version>"

// Every identifier names who issued it: a Neuro+ system per dataset and kind
// of number, or the number's global scheme.
RuleSet: IdentifierSystem
* identifier.system 1..1
* identifier.system ^short = "Issuer: http://sphin-x.de/fhir/sid/<dataset>/<kind>, or the number's global scheme"

RuleSet: ExtensionContext(path)
* ^context[+].type = #element
* ^context[=].expression = "{path}"

// Coded extensions: a Coding plus its label, both required.
RuleSet: CodedWithText(child)
* extension contains
    {child} 1..1 and
    text 1..1
* extension[{child}].value[x] only Coding
* extension[{child}] ^short = "Code"
* extension[text].value[x] only string
* extension[text] ^short = "Label"
* value[x] 0..0
