RuleSet: MetaProfile(profile)
* ^url = "http://aicuramedical.com/fhir/StructureDefinition/{profile}"

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
