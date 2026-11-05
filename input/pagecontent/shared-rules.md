### Shared Rules

These rules apply to all AICURA profiles.

#### Identifiers

Every identifier names who issued the number: `system` is required on every identifier in every profile. Together, `system` and `value` identify the number, so participant 123 of one study and participant 123 of another stay two people once the data leave the platform.

**Naming scheme.** AICURA defines one system per dataset and kind of number:

```
http://aicuramedical.com/fhir/sid/<dataset>/<kind>
```

- `<dataset>`: the dataset's short name in lower case, e.g. `adni`, `aibl`.
- `<kind>`: the kind of number in lower case, named as the dataset names it, e.g. `rid` for ADNI's participant number.

| Example | system | value |
|---------|--------|-------|
| ADNI participant | `http://aicuramedical.com/fhir/sid/adni/rid` | `123` |
| AIBL participant | `http://aicuramedical.com/fhir/sid/aibl/id` | `123` |

The examples illustrate the scheme; the systems per dataset are set with the conversion (to confirm).

**Global schemes.** A number that already has a global scheme keeps it. A DICOM Study Instance UID has the system `urn:dicom:uid` and the value `urn:oid:` followed by the UID.

**Identifier types.** Patients and study participants also say what kind of number they carry, with the types MII uses:

| Profile | identifier.type | Meaning |
|---------|-----------------|---------|
| [AicuraPatient](StructureDefinition-patient.html) | `http://terminology.hl7.org/CodeSystem/v3-ObservationValue#PSEUDED` | Pseudonym: the dataset's number replaces the person's identity |
| [AicuraResearchSubject](StructureDefinition-research-subject.html) | `http://terminology.hl7.org/CodeSystem/v2-0203#ANON` | Anonymised participant code |

Each type also carries a text. The conversion writes the code's display as the text (`pseudonymized`, `Anonymous identifier`; to confirm).
