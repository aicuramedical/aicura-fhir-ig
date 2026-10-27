### Extensions

#### ImagingStudy series extensions

The following extensions are defined on `ImagingStudy.series` and capture imaging acquisition metadata.

| Extension | Type | Description |
|-----------|------|-------------|
| [VoxelResolution](StructureDefinition-VoxelResolution.html) | Complex (X/Y/Z decimal + unit) | Three-dimensional voxel resolution |
| [ImageResolution](StructureDefinition-ImageResolution.html) | Complex (X/Y/Z integer) | Three-dimensional image resolution |
| [IsotropicVoxelResolution](StructureDefinition-IsotropicVoxelResolution.html) | Boolean | Whether voxel resolution is isotropic |
| [IsotropicImageResolution](StructureDefinition-IsotropicImageResolution.html) | Boolean | Whether image resolution is isotropic |
| [MagneticFieldStrength](StructureDefinition-MagneticFieldStrength.html) | Decimal | MRI scanner field strength in Tesla |
| [Echotime](StructureDefinition-Echotime.html) | Decimal | Echo time (TE) in milliseconds |
| [NumberOfFrames](StructureDefinition-NumberOfFrames.html) | Integer | Number of frames/slices |
| [DeviceManufacturer](StructureDefinition-DeviceManufacturer.html) | Complex (Coding + label) | Imaging device manufacturer |
| [device-model](StructureDefinition-device-model.html) | Complex (Coding + label) | Imaging device model |
| [DeviceId](StructureDefinition-DeviceId.html) | String | Imaging device identifier |
| [SeriesSequence](StructureDefinition-SeriesSequence.html) | Complex (Coding + label) | MRI pulse sequence type |
| [Tracer](StructureDefinition-Tracer.html) | Complex (Coding + label) | PET radiotracer compound |
| [Contrast](StructureDefinition-Contrast.html) | Complex (Coding + label) | MRI contrast weighting |
| [AcquisitionPlane](StructureDefinition-AcquisitionPlane.html) | Complex (Coding + label) | Anatomical acquisition plane |
| [Dimension](StructureDefinition-Dimension.html) | Complex (Coding + label) | 2D or 3D dimensionality |
| [AgeAtImagingSeries](StructureDefinition-AgeAtImagingSeries.html) | Integer | Patient age at the series date |
| [ImagingSeriesSize](StructureDefinition-ImagingSeriesSize.html) | Quantity | Storage size of the series files |

The coded extensions carry a `Coding` and its label as two sub-extensions, both required.

#### ImagingStudy extensions

| Extension | Type | Description |
|-----------|------|-------------|
| [AgeAtImagingStudy](StructureDefinition-AgeAtImagingStudy.html) | Integer | Patient age at the study date |

#### Cross-resource extensions

These extensions are defined on the clinical and demographic profiles added alongside ImagingStudy.

| Extension | Context | Type | Description |
|-----------|---------|------|-------------|
| [Race](StructureDefinition-Race.html) | Patient | CodeableConcept | Patient race (US CDC Race & Ethnicity code system) |
| [Ethnicity](StructureDefinition-Ethnicity.html) | Patient | CodeableConcept | Patient ethnicity (US CDC Race & Ethnicity code system) |
| [Laterality](StructureDefinition-Laterality.html) | BodyStructure | CodeableConcept | Body side laterality (left, right, bilateral) |
