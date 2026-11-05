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

#### Record metadata

Every record names the AICURA profile it follows and the dataset it comes from. `meta.profile` and `meta.source` are must-support in every profile; the conversion sets both.

- `meta.profile`: the canonical URL of the AICURA profile, with the IG version after a `|`.
- `meta.source`: the source dataset and its version, under the scheme `http://aicuramedical.com/fhir/dataset/<dataset>#<version>`.

For example, an ADNI patient record:

```json
"meta": {
  "profile": ["http://aicuramedical.com/fhir/StructureDefinition/patient|0.1.0"],
  "source": "http://aicuramedical.com/fhir/dataset/adni#2.0.0"
}
```

`<dataset>` is the same short name as in the identifier systems. A record that also meets an MII profile names that profile as well, once it does. Servers can then find records by profile (`_profile`) and by dataset version (`_source`).

#### Coded fields

A coded field (`CodeableConcept`) may carry several codes for the same meaning, from different code systems, next to one text; their order means nothing. Wherever a standard code (SNOMED CT, LOINC, ICD-10-GM) exists, it goes next to AICURA's own code, so one record can meet a standard's code list and keep the more precise code. No profile limits a coded field to one code.

Fields that base FHIR types as a single `Coding` (e.g. `Encounter.class`, `ImagingStudy.series.modality`) and AICURA's coded extensions, which carry a `Coding` and its label, hold one code each.

**Main code system per field.** The main code system is the one every record should carry for the field; other codes may go next to it.

| Field | Main code system | Next to it |
|-------|------------------|------------|
| `Condition.code` (diagnoses) | SNOMED CT | An AICURA code where SNOMED CT has no concept; ICD-10 and Orphanet as further codes later |
| `Observation.code`, lab value | LOINC | |
| `Observation.code`, vital sign | LOINC, as FHIR's vital-signs profile requires | |
| `Observation.code`, clinical score | LOINC where it has the score, else AICURA (to confirm) | |
| `Observation.code`, imaging-derived measure | To confirm | |
| `Observation.category` | HL7 observation-category | |
| `BodyStructure.location` (brain regions) | SNOMED CT | An AICURA code where SNOMED CT has no exact concept |
| PET and SPECT tracer | DICOM CID 4021 (PET) and CID 25 (SPECT), code system as listed (mostly SNOMED CT) | PubChem compound where the DICOM list has no code |
| `ImagingStudy.series.modality` | DICOM DCM (`http://dicom.nema.org/resources/ontology/DCM`) | |
