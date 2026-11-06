Profile: AicuraMedicationAdministration
Parent: MedicationAdministration
Id: medication-administration
Title: "AICURA MedicationAdministration"
Description: "Constrained MedicationAdministration profile for AICURA's clinical data model, recording a tracer or contrast agent administered for imaging. Imaging series point to it through the SeriesMedicationAdministration extension."
* insert MetaProfile(medication-administration)
* insert IdentifierSystem
// Must-support elements
* status MS
* medication[x] MS
* medication[x] only Reference(AicuraMedication)
* medication[x] ^comment = "The administered substance. For a tracer, Medication.code carries the same coding as the radiopharmaceutical part of the series' PET or SPECT extension."
* subject MS
* subject only Reference(Patient)
* context MS
* effective[x] MS
* effective[x] ^comment = "Injection time. Equals injectionTime in the series' PET or SPECT extension."
* dosage MS
* dosage.route MS
* dosage.dose MS
* dosage.dose ^comment = "Administered amount; for a radiopharmaceutical the activity in UCUM (e.g. MBq). The same activity as radionuclideTotalDose in the series' PET extension (in Bq) or SPECT extension (in MBq)."
