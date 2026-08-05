% One-time reconstruction of the DyC-OCT angiogram used by DyCOCT_Figs.m.
%
% spectra.mat is a v5/v7 MAT-file, so matfile() partial loading is not
% available and both spectra variables must be loaded in full. The angiogram
% is then built in chunks along the frame axis: phase_err sums over depth
% only and every other operation is elementwise, so chunking is exact and
% keeps the temporaries small instead of allocating them over all frames.
%
% Run once. DyCOCT_Figs.m reads the cached result.

close all
clear

spectra_path = 'X:\root\processed\2018_10_30_SOD1_#17\2018_10_30_15_29_05\stage_2\spectra.mat';
out_path     = 'X:\results\Conrad\Vessel Width\dycoct_angio.mat';

chunk  = 50;    % frames per chunk - lower this if memory is tight
offset = 1;     % A-scan lag, as in vessel_diameter_V5.m

%% Load (only channel 0, as in vessel_diameter_V5.m)
fprintf('Loading spectra...\n'); t0 = tic;
load(spectra_path,'spectra0_a','spectra0_p');
sz = size(spectra0_a);
fprintf('  %.0f s | class %s | size %s\n', toc(t0), class(spectra0_a), mat2str(sz));

% Expected layout: [depth x lateral x frame x repeat], i.e. 2000 B-scans as
% 400 frames of 5 repeats. Check this before trusting the output.
if numel(sz) ~= 4
    error('Expected a 4-D spectra array, got %d dimensions.', numel(sz));
end
if sz(4) > sz(3)
    warning('Dimension 4 (%d) is larger than dimension 3 (%d) - frame and repeat axes may be swapped.', sz(4), sz(3));
end
nz = sz(1); nf = sz(3); nrep = sz(4);
fprintf('  %d frames x %d repeats\n', nf, nrep);

%% Angio, chunked over frames
angio = zeros(sz(1), sz(2), nf, 'single');
t0 = tic;
for i0 = 1:chunk:nf
    i1 = min(i0+chunk-1, nf);

    Ic = spectra0_a(:,:,i0:i1,:) .* exp(1i.*spectra0_p(:,:,i0:i1,:));
    phase_err = angle(sum(Ic(:,:,:,1:end-offset).*conj(Ic(:,:,:,1+offset:end))));
    speck_data = abs(Ic(:,:,:,1+offset:end) - ...
        Ic(:,:,:,1:end-offset).*conj(exp(1i*repmat(phase_err,[nz,1])))).^2;
    angio(:,:,i0:i1) = single(mean(speck_data,4));

    fprintf('  frames %4d-%4d (%.0f s elapsed)\n', i0, i1, toc(t0));
end
clear Ic phase_err speck_data spectra0_a spectra0_p

%% Cache
% -v7.3 so future scripts can partial-load this one, unlike spectra.mat.
fprintf('Saving %s ...\n', out_path);
save(out_path, 'angio', '-v7.3');
fprintf('Done. angio is %s, %.0f MB as single.\n', mat2str(size(angio)), numel(angio)*4/1e6);
