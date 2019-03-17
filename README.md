Example Repository for TAPAS PhysIO Toolbox
===========================================

> Copyright (C) 2012-2019  
> Lars Kasper  
> <kasper@biomed.ee.ethz.ch>  
>  
> Translational Neuromodeling Unit (TNU)  
> Institute for Biomedical Engineering  
> University of Zurich and ETH Zurich  


Copying
-------

The PhysIO Toolbox is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program (see the file LICENSE).  If not, see
<http://www.gnu.org/licenses/>.

Purpose
-------

This is the Example Repository for the PhysIO Toolbox, holding all the example data 
from different vendors and corresponding example scripts that work with the toolbox.
 
The examples can be found in `tapas/examples/<tapasVersion>/PhysIO` as different subfolders (`vendor/device`) and shall be run directly from within these individual folders.

Each example script is saved in the respective folder with the logfile data. Three script types are saved with each example:
- SPM job (`*spm_job.mat`)
- editable SPM job (`*spm_job.m`)
- plain matlab script (`*matlab_script.m`)

The examples only run through, if you have also installed the code for the PhysIO Toolbox, avaliable as the [`physio-public`](https://tnurepository.ethz.ch/physio/physio-public) repository, 
which can be cloned from `git@tnurepository.ethz.ch:physio/physio-public.git`.

Installation
------------

1. Unzip the example files
2. Start Matlab
3. Make sure the PhysIO Toolbox code-folder is added to the matlab path
4. For use of the SPM Batch Editor:
    - Copy the PhysIO Toolbox code folder to `<yourSPMFolder>/toolbox/PhysIO`
    - Restart SPM or call `spm_jobman('initcfg')` 

Content
--------

The following datasets are available and can be downloaded with the toolbox in a specific repository [`physio-examples`](https://tnurepository.ethz.ch/physio/physio-examples) which can be cloned from `git@tnurepository.ethz.ch:physio/physio-examples.git`.

The following datasets are available to explore the read-in and modeling capabilities of PhysIO. They can be downloaded by running the function `tapas_download_example_data()` in Matlab, which is located in the `misc` subfolder of the TAPAS software release you downloaded (probably [here](https://translationalneuromodeling.github.io/tapas/#download)).


Brain Imaging Data Structure (BIDS)
-----------------------------------

### CPULSE 3T ###

Courtesy of Hrvoje Stojic, Max Planck UCL Centre for Computational Psychiatry
and Ageing Research, University College London

Vendor-computed (software: Spike2) cardiac pulse events from PPU (finger
plethysmograph) data, Siemens 3T scanner, Multiband CMRR sequence

Description: This datasets contains the (compressed) tab-separated value
(`.tsv.gz`) files as well as the meta-file (`.json`) holding sampling rate of
the physiological recording, and its relative onset to scanning, in adherence
with the [BIDS standard for peripheral recordings
files](https://bids-specification.readthedocs.io/en/latest/04-modality-specific-files/04-physiological-and-other-continous-recordings.html).

### PPU 3T ###

Courtesy of Hrvoje Stojic, Max Planck UCL Centre for Computational Psychiatry
and Ageing Research, University College London

PPU (finger plethysmograph) and breathing belt, Siemens 3T scanner, Nultiband CMRR sequence

Description: Similar to CPULSE3T (same acquisition system), but now with analog
data instead of vendor-detected pulses, data from different subject


General Electric
-----------------

### PPU 3T ###

Courtesy of Steffen Bollmann, Kinderspital Zurich and ETH Zurich

PPU (finger plethysmograph) and breathing belt, General Electric 3T
scanner

Description: Similar to PPU, but acquired on a GE system with two
separate output logfiles for pulse oximetry and breathing amplitude,
sampled with 40 Hz. The quality of the signal is particularly
challenging, stemming from a patient population.


Philips
-------

### ECG 3T ###

Courtesy of Sandra Iglesias, Translational Neuromodeling Unit, ETH &
University of Zurich

4-electrode ECG and breathing belt, Philips 3T Achieva scanner

Description: Standard example; shows how to use volume counting either
from beginning or end of run to synchronize physiological logfile with
acquisition onsets of fMRI scans.

### ECG 7T ###

Courtesy of Zina-Mary Manjaly, University Hospital Zurich

4-electrode ECG and breathing belt, Philips 7T Achieva scanner

Description: The ECG data for ultra-high field data is typically much
noisier than at 3 Tesla. Therefore, R-wave peaks are frequently missed
by prospective trigger detection and not marked correctly in the
logfile. This example shows how to select typical R-wave-peaks manually
and let the algorithm find the heartbeat events.

### PPU 3T ###

Courtesy of Diana Wotruba, University and University Hospital of Zurich

PPU (finger plethysmograph) and breathing belt, Philips 3T Achieva
scanner

Description: Similar to ECG3T, but a plethysmograph instead of an ECG
was used to monitor the cardiac pulsation. Example shows how to extract
heart and breathing rate.


Siemens - VB
-------------

Siemens has different physiological logfile formats, for which examples are provided here. A detailed description of these formats is on a different [wiki page](MANUAL_PART_READIN).

This is the older Siemens log file format (also available via *manual recording*), which is part of software release *VB*, and can be determined by the file extensions `.resp`, `.ecg`, `.puls`, in combination with an optional `.dcm` DICOM header file for the first acquired volume.

A lot of 7T scanners still use this format.

### ECG 3T ###

Courtesy of Miriam Sebold, Charite Berlin, and Quentin Huys, TNU Zurich

4-electrode ECG data, Siemens 3T scanner

Description: Similar to ECG 3T, but acquired on a Siemens system with only one logfile for ECG data. The quality of the signal is challenging, stemming from a patient population.

Siemens - HCP
-------------

The Human Connectome Project uses Siemens scanners, and the logfile format that comes with their published data seems to be pre-converted and custom (even though the documentation desribes the VB format). We have implemented an own reader for that and written a little tutorial for a single subject dataset of the HCP. 

https://github.com/translationalneuromodeling/tapas/issues/6#issuecomment-361001716

If you download the whole dataset (including functional image files), this example with the additional batches mentioned below also demonstrates how to use the toolbox for model assessment using statistical maps (F-contrasts).

### HCP (Subject 178748)

You will have to download the dataset from the [HCP](https://db.humanconnectome.org/) yourself, we just provide the matlab batches and the physiological logfile `tfMRI_MOTOR_LR_Physio_log.txt` here.

For consistency with the other example files, the batch files have been renamed compared to the blog entry:

- `batch_preproc.m` -> `batch_preproc.m` 
- `batch_physio.m` -> `siemens_hcp_ppu3t_spm_job.m` 
- `batch_glm.m` -> `batch_glm.m` 

If you want to run the preproc and glm batch, place them on the same level as the subject folder `178748` for the downloaded data. The physio-batch shall reside in the same folder as the physiological logfile `tfMRI_MOTOR_LR_Physio_log.txt`.

Siemens - VD/VE Tics
--------------------

This is the most recent logfile format of Siemens, included in Software releases *VD*, *VE* and sometimes referred to as the *Tics* format, because all time stamps in all files refer to the same reference point (start of the day) and count in the same intervals or "*tics*" of 2.5 ms from there.

You will recognize this file format via the extensions `_Info.log` (or `_AcquisitionInfo.log`), `_RESP.log`, `_ECG.log` and `_PULS.log`. Sometimes, it is also written into the DICOM header (`.dcm`) file of your functional data directly. In this case, use [extractCMRRPhysio.m](https://github.com/CMRR-C2P/MB) to convert it to the above separate files before using PhysIO.

Most modern Siemens scanners, such as the Prisma or 7T Terra, use this format.

There are a couple of variants for this format around (e.g., with the WIP Multiband Protocol that is distributed to multiple sites), and PhysIO tries to support all of them. 

### PPU 3T ###

Courtesy of Saskia Bollmann, Centre for Advanced Imaging, University of Queensland, Brisbane, Australia

Pulse oximetry and breathing belt data, Siemens Prisma 3T, logfile version `EJA_1`, multi-echo fMRI (3 echoes)

The UUID and date/time stamps were altered for anonymization.