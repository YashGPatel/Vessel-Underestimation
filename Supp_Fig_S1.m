% Supplement Fig. S1 script  --  panels for supp_phase_*.png
% Crops the pre, peak and post panels of the ImageJ screenshot
% "Vessel diameter in different phases.png" to the same window around
% each annotated vessel box. The pixels and the ImageJ boxes are kept as
% they are; the panels are only cropped.
close all
clear

%% Run / output options  --  set to false to test-run without writing files
save_figs   = 1;    % write the cropped panels (imwrite)

%% Input and output
root    = 'C:\Users\BM-Optik01\ownCloud\Characterising Correcting Vessel Underestimation';
src     = fullfile(root, 'Vessel diameter in different phases.png');
out_dir = fullfile(root, 'figures');
if save_figs && ~exist(out_dir,'dir'); mkdir(out_dir); end

img = imread(src);

%% ImageJ box of each panel in the screenshot (pixel columns and rows)
%  [left top right bottom], read from the yellow box lines
panel_key = {'pre', 'peak', 'post'};
box = [182 288  430 528;    % pre
       599 288  847 528;    % peak
      1033 287 1281 527];   % post

%% Crop window around each box (pixels)
mx = 72;    % left and right of the box
my = 48;    % above and below the box

%% Crop and write
for k = 1:numel(panel_key)
    rows = (box(k,2)-my):(box(k,4)+my);
    cols = (box(k,1)-mx):(box(k,3)+mx);
    panel = img(rows, cols, :);
    if save_figs
        imwrite(panel, fullfile(out_dir, ['supp_phase_' panel_key{k} '.png']));
    end
end
