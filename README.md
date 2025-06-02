PhysIO Examples [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15579087.svg)](https://doi.org/10.5281/zenodo.15579087) | Code: [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15578837.svg)](https://doi.org/10.5281/zenodo.15578837) | Paper [![DOI](https://zenodo.org/badge/DOI/10.1016/j.jneumeth.2016.10.019.svg)](https://doi.org/10.1016/j.jneumeth.2016.10.019)

Example Repository for TAPAS PhysIO Toolbox
===========================================

All example data for the [TAPAS PhysIO Toolbox](https://github.com/ComputationalPsychiatry/PhysIO) is in this repository. You can download the examples by cloning this repository as

```
git clone https://github.com/ComputationalPsychiatry/PhysIO-Examples.git
```

The general folder structure is

```
<vendor>/<modality>/
```

where:

- `<vendor>` could be a scanner vendor (Siemens, Philips, GE...) or a manufacturer of peripheral devices (BioPac, ADInstruments), as well as a data standard (BIDS)
- `<modality>` describes the scan modality (3 Tesla, 7 Tesla) as well as the recording modality (PPU, ECG) combined, e.g., `PPU-3T`

- Within each of these folders, you will find:
    - the raw physiological logfiles
    - example scripts to run PhysIO in 3 formats:
        - SPM job (`*spm_job.mat`)
        - editable SPM job (`*spm_job.m`)
        - plain matlab script (`*matlab_script.m`)

 - Each example shall be run directly from within its individual folders.
     - The relative paths have been automatically updated, based on the template jobs in the [examples subfolder of the PhysIO code repository](https://github.com/ComputationalPsychiatry/PhysIO/tree/master/examples)
- A description of the individual examples (vendor, origin, etc.) is found on this [PhysIO Wiki Page - Examples](https://github.com/ComputationalPsychiatry/PhysIO/wiki/EXAMPLES)
