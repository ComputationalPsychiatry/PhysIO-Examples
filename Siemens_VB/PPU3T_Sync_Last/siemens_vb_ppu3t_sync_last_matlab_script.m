%% Example script using PhysIO with Matlab only (no SPM needed)
%  For documentation of the parameters, see also tapas_physio_new (e.g., via edit tapas_physio_new)

%% Create default parameter structure with all fields
physio = tapas_physio_new();

%% Individual Parameter settings. Modify to your need and remove default settings
physio.save_dir = {'physio_out'};
physio.log_files.vendor = 'Siemens';
physio.log_files.cardiac = {'20191023_V02.puls'};
physio.log_files.respiration = {'20191023_V02.resp'};
physio.log_files.scan_timing = {'MR.27842.1611'};
physio.log_files.sampling_interval = 0.0025;
physio.log_files.align_scan = 'last';
physio.scan_timing.sqpar.Nslices = 24;
physio.scan_timing.sqpar.TR = 1.5;
physio.scan_timing.sqpar.Ndummies = 0;
physio.scan_timing.sqpar.Nscans = 382;
physio.scan_timing.sqpar.time_slice_to_slice = 0.0625;
physio.scan_timing.sqpar.onset_slice = 5;
physio.scan_timing.sync.method = 'scan_timing_log';
physio.preproc.cardiac.modality = 'PPU';
physio.preproc.cardiac.filter.include = false;
physio.preproc.cardiac.filter.type = 'butter';
physio.preproc.cardiac.filter.passband = [0.3 9];
physio.preproc.cardiac.initial_cpulse_select.method = 'auto_matched';
physio.preproc.cardiac.initial_cpulse_select.max_heart_rate_bpm = 120;
physio.preproc.cardiac.initial_cpulse_select.file = 'initial_cpulse_kRpeakfile.mat';
physio.preproc.cardiac.initial_cpulse_select.min = 0.4;
physio.preproc.cardiac.posthoc_cpulse_select.method = 'off';
physio.preproc.cardiac.posthoc_cpulse_select.percentile = 80;
physio.preproc.cardiac.posthoc_cpulse_select.upper_thresh = 60;
physio.preproc.cardiac.posthoc_cpulse_select.lower_thresh = 60;
physio.preproc.respiratory.filter.passband = [0.01 2];
physio.preproc.respiratory.despike = false;
physio.model.orthogonalise = 'none';
physio.model.censor_unreliable_recording_intervals = false;
physio.model.output_multiple_regressors = 'multiple_regressors.txt';
physio.model.output_physio = 'physio.mat';
physio.model.retroicor.include = true;
physio.model.retroicor.order.c = 3;
physio.model.retroicor.order.r = 4;
physio.model.retroicor.order.cr = 1;
physio.model.rvt.include = false;
physio.model.rvt.method = 'hilbert';
physio.model.rvt.delays = 0;
physio.model.hrv.include = false;
physio.model.hrv.delays = 0;
physio.model.noise_rois.include = false;
physio.model.noise_rois.thresholds = 0.9;
physio.model.noise_rois.n_voxel_crop = 0;
physio.model.noise_rois.n_components = 1;
physio.model.noise_rois.force_coregister = 1;
physio.model.movement.include = false;
physio.model.movement.order = 6;
physio.model.movement.censoring_threshold = 0.5;
physio.model.movement.censoring_method = 'FD';
physio.model.other.include = false;
physio.verbose.level = 2;
physio.verbose.process_log = cell(0, 1);
physio.verbose.fig_handles = zeros(1, 0);
physio.verbose.use_tabs = false;
physio.verbose.show_figs = true;
physio.verbose.save_figs = false;
physio.verbose.close_figs = false;
physio.ons_secs.c_scaling = 1;
physio.ons_secs.r_scaling = 1;
physio.write_bids.bids_step = 4;
physio.write_bids.bids_prefix = 'sub-control01_task-YOURTASK_run-1';
physio.version = 'R2024a-v9.0.1';

%% Run physiological recording preprocessing and noise modeling
physio = tapas_physio_main_create_regressors(physio);
