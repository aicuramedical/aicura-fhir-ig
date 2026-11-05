### Extensions

#### ImagingStudy series extensions

The following extensions are defined on `ImagingStudy.series` and capture imaging acquisition metadata.

| Extension | Type | Description |
|-----------|------|-------------|
| [VoxelResolution](StructureDefinition-VoxelResolution.html) | Complex (X/Y/Z decimal + unit) | Three-dimensional voxel resolution |
| [ImageResolution](StructureDefinition-ImageResolution.html) | Complex (X/Y/Z integer) | Three-dimensional image resolution |
| [IsotropicVoxelResolution](StructureDefinition-IsotropicVoxelResolution.html) | Boolean | Whether voxel resolution is isotropic |
| [IsotropicImageResolution](StructureDefinition-IsotropicImageResolution.html) | Boolean | Whether image resolution is isotropic |
| [NumberOfFrames](StructureDefinition-NumberOfFrames.html) | Integer | Number of frames/slices |
| [ModalityMR](StructureDefinition-ModalityMR.html) | Complex (10 parts) | MR acquisition details: field strength, technique codes, TE, TR, TI and flip angle (shaped like MII's MR extension, UCUM units), plus sequence name, contrast weighting and plane |
| [ModalityPT](StructureDefinition-ModalityPT.html) | Complex (6 parts) | PET tracer, radionuclide, dose and half-life (shaped like MII's PET extension, UCUM units), plus injection time and plane |
| [ModalityNM](StructureDefinition-ModalityNM.html) | Complex (6 parts) | SPECT (NM) tracer, radionuclide, dose and half-life (shaped like MII's NM extension, UCUM units), plus injection time and plane |
| [SeriesMedicationAdministration](StructureDefinition-SeriesMedicationAdministration.html) | Reference (MedicationAdministration) | The administration of a tracer or contrast agent for this series |
| [DeviceManufacturer](StructureDefinition-DeviceManufacturer.html) | Complex (Coding + label) | Imaging device manufacturer |
| [device-model](StructureDefinition-device-model.html) | Complex (Coding + label) | Imaging device model |
| [DeviceId](StructureDefinition-DeviceId.html) | String | Imaging device identifier |
| [Dimension](StructureDefinition-Dimension.html) | Complex (Coding + label) | 2D or 3D dimensionality |
| [AgeAtImagingSeries](StructureDefinition-AgeAtImagingSeries.html) | Integer | Patient age at the series date |
| [ImagingSeriesSize](StructureDefinition-ImagingSeriesSize.html) | Quantity | Storage size of the series files |

The coded extensions carry a `Coding` and its label as two sub-extensions, both required.

#### ImagingStudy extensions

| Extension | Type | Description |
|-----------|------|-------------|
| [AgeAtImagingStudy](StructureDefinition-AgeAtImagingStudy.html) | Integer | Patient age at the study date |

#### Observation extensions

These extensions link an Observation and its components to the body structure (e.g. a brain region) and the analysis software a value comes from, and record the patient's age at the observation.

| Extension | Context | Type | Description |
|-----------|---------|------|-------------|
| [AgeAtObservation](StructureDefinition-AgeAtObservation.html) | Observation | Integer | Patient age at the observation's effective date |
| [ObservationBodyStructure](StructureDefinition-ObservationBodyStructure.html) | Observation | Reference(BodyStructure) | Body structure the observation's value refers to |
| [ObservationComponentBodyStructure](StructureDefinition-ObservationComponentBodyStructure.html) | Observation.component | Reference(BodyStructure) | Body structure the component's value refers to |
| [ObservationComponentDevice](StructureDefinition-ObservationComponentDevice.html) | Observation.component | Reference(Device) | Device (analysis software) that produced the component's value |

#### Age at an event

Research datasets usually remove dates, so AICURA records the patient's age in whole years at each event in an extension of its own. Besides AgeAtImagingStudy, AgeAtImagingSeries and AgeAtObservation above, these are:

| Extension | Context | Type | Description |
|-----------|---------|------|-------------|
| [AgeAtEncounter](StructureDefinition-AgeAtEncounter.html) | Encounter | Integer | Patient age at the start of the encounter |
| [AgeRecorded](StructureDefinition-AgeRecorded.html) | Condition | Integer | Patient age at the condition's recorded date |
| [AgeOnset](StructureDefinition-AgeOnset.html) | Condition | Integer | Patient age at the condition's onset date |
| [AgeAtCondition](StructureDefinition-AgeAtCondition.html) | Condition | Integer | Patient age at the condition's onset date (same value as AgeOnset, which supersedes it) |
| [AgeAtResearch](StructureDefinition-AgeAtResearch.html) | ResearchSubject | Integer | Patient age at the start of the study participation |
| [AgeAtProcedure](StructureDefinition-AgeAtProcedure.html) | Procedure | Integer | Patient age at the date of the procedure |

#### Cross-resource extensions

These extensions are defined on the clinical and demographic profiles added alongside ImagingStudy.

| Extension | Context | Type | Description |
|-----------|---------|------|-------------|
| [Race](StructureDefinition-Race.html) | Patient | CodeableConcept | Patient race (US CDC Race & Ethnicity code system) |
| [Ethnicity](StructureDefinition-Ethnicity.html) | Patient | CodeableConcept | Patient ethnicity (US CDC Race & Ethnicity code system) |
| [BodyStructureLaterality](StructureDefinition-BodyStructureLaterality.html) | BodyStructure | CodeableConcept | Body side laterality (left, right, bilateral) |
