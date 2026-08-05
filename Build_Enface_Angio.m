% One-time reconstruction of the pre- and post-contrast angiogram volumes
% used by Enface_Figs.m (Fig. 2, enface_contrast).
%
% C57BL6_5, 2023-06-30, right eye, papilla-centred, 1 mm x 1 mm:
%   13_04_18  baseline  -> pre-contrast
%   13_08_30  contrast  -> post-contrast
% Each is 512 A-scans x 400 slow-axis positions x 5 repeats, so the volume has
% the same [z x fast x slow x repeat] layout as the DyC-OCT data and the same
% angiogram recipe applies, with the slow axis in place of time.
%
% As in Build_DyCOCT_Angio.m, the spectra are loaded whole (v7 MAT-files do
% not support partial loading) and the angiogram is built in chunks along the
% slow axis to keep the temporaries small.
%
% Run once. Enface_Figs.m reads the cached result.

close all
clear

root     = 'X:\root\processed\2023_06_30_C57BL6_5';
scans    = {'2023_06_30_13_04_18', '2023_06_30_13_08_30'};
names    = {'pre', 'post'};
out_path = 'X:\results\Conrad\Vessel Width\enface_angio.mat';

chunk  = 40;    % slow-axis positions per chunk - lower this if memory is tight
offset = 1;     % A-scan lag, as in vessel_diameter_V5.m

angio = struct();

for s = 1:numel(scans)
    spectra_path = fullfile(root, scans{s}, 'stage_2', 'spectra.mat');
    fprintf('[%s] loading %s\n', names{s}, spectra_path); t0 = tic;
    S = load(spectra_path, 'spectra0_a', 'spectra0_p');
    sz = size(S.spectra0_a);
    fprintf('  %.0f s | class %s | size %s\n', toc(t0), class(S.spectra0_a), mat2str(sz));

    if numel(sz) ~= 4
        error('Expected a 4-D spectra array for %s, got %d dimensions.', scans{s}, numel(sz));
    end

    % The DyC-OCT data is [z x fast x time x repeat], but these volumes are
    % stored [z x fast x repeat x slow]. Repeats are always the smaller of the
    % last two dimensions, so use that to tell the two layouts apart; getting
    % it wrong averages over the slow axis and yields a mean B-scan.
    rep_in_dim3 = sz(3) < sz(4);
    if rep_in_dim3
        ns = sz(4); nrep = sz(3);
        fprintf('  layout [z fast repeat slow]\n');
    else
        ns = sz(3); nrep = sz(4);
        fprintf('  layout [z fast slow repeat]\n');
    end
    nz = sz(1);
    fprintf('  %d fast x %d slow x %d repeats\n', sz(2), ns, nrep);

    vol = zeros(sz(1), sz(2), ns, 'single');
    t0 = tic;
    for i0 = 1:chunk:ns
        i1 = min(i0+chunk-1, ns);
        if rep_in_dim3   % permute the chunk only, not the whole array
            ca = permute(S.spectra0_a(:,:,:,i0:i1), [1 2 4 3]);
            cp = permute(S.spectra0_p(:,:,:,i0:i1), [1 2 4 3]);
        else
            ca = S.spectra0_a(:,:,i0:i1,:);
            cp = S.spectra0_p(:,:,i0:i1,:);
        end
        Ic = ca .* exp(1i.*cp);
        phase_err = angle(sum(Ic(:,:,:,1:end-offset).*conj(Ic(:,:,:,1+offset:end))));
        speck_data = abs(Ic(:,:,:,1+offset:end) - ...
            Ic(:,:,:,1:end-offset).*conj(exp(1i*repmat(phase_err,[nz,1])))).^2;
        vol(:,:,i0:i1) = single(mean(speck_data,4));
        fprintf('  slices %4d-%4d (%.0f s elapsed)\n', i0, i1, toc(t0));
    end
    clear ca cp Ic phase_err speck_data S

    angio.(names{s}) = vol;
    clear vol
end

fprintf('Saving %s ...\n', out_path);
save(out_path, '-struct', 'angio', '-v7.3');
fprintf('Done. pre %s, post %s\n', mat2str(size(angio.pre)), mat2str(size(angio.post)));
