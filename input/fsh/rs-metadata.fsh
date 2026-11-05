RuleSet: MetaProfile(profile)
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/{profile}"

// Every identifier names who issued it: an AICURA system per dataset and kind
// of number, or the number's global scheme.
RuleSet: IdentifierSystem
* identifier.system 1..1
* identifier.system ^short = "Issuer: http://aicuramedical.com/fhir/sid/<dataset>/<kind>, or the number's global scheme"

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
