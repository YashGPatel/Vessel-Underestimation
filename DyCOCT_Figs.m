% DyC-OCT Script  --  panels for dycoct.pdf
% Panels a-e reproduce vessel_diameter_V5.m lines 140-173, panel f is the
% angiogram intensity time course. Run Build_DyCOCT_Angio.m first.
close all
clear

%% Run / output options  --  set to false to test-run without writing files
save_figs   = 1;    % write figure PDFs (exportgraphics)

%% Output directory for individual subplot PDFs
out_dir = 'C:\Users\BM-Optik01\ownCloud\Vessel Underestimation\figures';
if save_figs && ~exist(out_dir,'dir'); mkdir(out_dir); end

%% Data
load('X:\results\Conrad\Vessel Width\dycoct_angio.mat','angio');
load('X:\results\Conrad\Vessel Width\vessel_width3_model.mat','vessel','g_mean_x');

baseline = 1:40;
peak = 50:100;
post = 125:400;
phase_range = {baseline, peak, post};   % used by panels (d), (e) and (f)

vessel_num  = 6;        % panel (f); same vessel as the gg_model figure
depth_range = 1:55;     % surface layers for the en face over time (V5 l.165)

% Depth shown in the B-scan panels (a)-(c). The full 219 pixels is mostly
% empty above and below the tissue, and that dead space is what forces the
% stacked panels to be small. Cropping to the tissue makes each panel
% shorter, so the column can be widened for the same total height.
bscan_depth = 1:219;    % e.g. 1:120 once the tissue extent is confirmed

% Timing: 80 kHz A-scan rate, 8.2 ms inter-scan time, 5 B-scan repeats per
% angio frame -> 41 ms per frame, 16.4 s over the 400 frames. (Sanity check:
% 502 A-lines at 80 kHz is 6.3 ms of acquisition, so 8.2 ms is the B-scan
% period including flyback.) Set t_frame = 1 to plot frames instead.
n_rep   = 5;                % B-scan repeats per angio frame
t_scan  = 8.2e-3;           % inter-scan time (s), i.e. B-scan period
t_frame = n_rep * t_scan;

% Display ranges, all taken from vessel_diameter_V5.m
clim_bscan = [2e-6 4e-5];   % l.140-150
clim_mip   = [4e-6 8e-5];   % l.165
th_mip     = 3e-5;          % l.170

% --- Fig 2 (dycoct) styling helpers ---
% Panels print small, so image panels carry only a scale bar and panel (f)
% uses the same font scheme as the gg_model panels.
figpos  = [100 100 900 700];
% Panel (f) sits in a wide slot under (d)/(e). A wide, short canvas suits a
% time course and keeps its text large relative to the printed width, which
% a tall canvas squeezed into that slot would not.
figpos_f = [100 100 1100 520];
fs_tick = 32;                   % tick labels
fs_lab  = 40;                   % axis labels
% Panel (f) is set separately: it prints ~5.3cm wide from a 713pt pdf, a
% scale of 0.21, so the shared 40/32 landed at 8.5/6.8pt - heavy next to the
% plot. 32/28 gives ~6.8pt labels and ~6pt ticks.
fs_lab_f  = 32;                 % (f) axis labels
fs_tick_f = 28;                 % (f) tick labels
% In-image (a)-(c) labels, sized to match the (d)-(f) subcaptions.
% Printed size = fs_panel x (panel width / pdf width) = fs_panel x (143.7/527)
% = fs_panel x 0.273. The subcaptions are ~9pt bold serif, so 30 -> 8.2pt.
% Set slightly under 9pt on purpose: this is bold Helvetica, which reads
% larger than bold Times at the same point size.
% NOTE: tied to the panel width. At 0.38\linewidth the panel is 143.7pt; if
% that changes in results.tex, rescale by the same factor.
fs_panel = 30;
sb_um   = 100;                  % scale bar length (um), as stated in the caption
sb_lw   = 6;                    % scale bar thickness (points)
c_pre   = [0 0 1];              % pre-contrast  (blue)
c_peak  = [0 1 0];              % peak contrast (green)
c_post  = [1 0 0];              % post-contrast (red)

% Isotropic 2 um sampling: lateral and axial pitches match on this 2-D scan,
% so axis equal is correct for panels a-c. (The fitted x axis in the model
% file, mean(diff(g_mean_x.x{vessel_num})), is in microns and can be used to
% cross-check this.) A 3-D scan would need a separate slow-axis pitch.
px_um = 2;                      % um per pixel, lateral and axial

sb_px = sb_um / px_um;          % scale bar length in pixels

%% Panels (a)-(c) - B-scan angiograms at each contrast phase

phase_file  = {'dycoct_a.pdf', 'dycoct_b.pdf', 'dycoct_c.pdf'};

% Labels are drawn inside the images rather than set as LaTeX subcaptions:
% stacked top captions cost ~1.2 cm of white space between each pair of
% panels, which is more than half a panel height. The letters must stay in
% step with the \phantomsubcaption order in results.tex.
phase_label = {'(a) Pre-contrast', '(b) Peak contrast', '(c) Post-contrast'};
% White, not the phase colours: these sit on the dark top of the B-scan,
% where blue in particular would be unreadable. The phase colour coding is
% already carried by the boxes on (d)-(f).
phase_lcol  = {'w', 'w', 'w'};

% Colour per phase, matching the windows drawn on (d)-(f).
phase_ecol  = {c_pre, c_peak, c_post};

% Box over the depth slab that (d) and (e) project over: from the top of the
% image down to the last row of depth_range, in the coordinates of the
% displayed crop. Inset a little so no edge is half-clipped at the border.
y_slab  = depth_range(end) - bscan_depth(1) + 1;
box_in  = 2;

for p = 1:3
    figure;
    imagesc(mean(angio(bscan_depth,:,phase_range{p}),3), clim_bscan);
    colormap(gray)
    axis image   % equal aspect AND tight limits; axis equal pads the limits
                 % out to the figure shape, which puts anything positioned
                 % from xlim/ylim into blank space outside the image
    axis off
    hold on;
    xlb = xlim; ylb = ylim;
    rectangle('Position', [xlb(1)+box_in, ylb(1)+box_in, ...
        diff(xlb)-2*box_in, y_slab-ylb(1)-box_in], ...
        'EdgeColor', phase_ecol{p}, 'LineWidth', 3);
    % bottom left: the dark region below the bright band, and clear of the
    % scale bar in the bottom right
    text(0.02, 0.02, phase_label{p}, 'Units','normalized', ...
        'Color', phase_lcol{p}, 'FontSize', fs_panel, 'FontWeight','bold', ...
        'HorizontalAlignment','left', 'VerticalAlignment','bottom');
    % scale bar, bottom right
    yl = ylim; xl = xlim;
    x0 = xl(2) - 0.04*diff(xl) - sb_px;
    y0 = yl(2) - 0.08*diff(yl);
    hold on; plot([x0 x0+sb_px], [y0 y0], 'w', 'LineWidth', sb_lw);
    set(gcf,'Position',figpos);
    if save_figs; exportgraphics(gcf, fullfile(out_dir,phase_file{p}), 'ContentType','vector','BackgroundColor','white'); end
end

%% Panel (d) - MIP of the vessel cross-sections over time

mip_t = squeeze(max(angio(depth_range,:,:),[],1))';   % [time x lateral]

% y in seconds, x left in pixels so the lateral scale bar stays valid.
% imagesc keeps YDir reverse, so time runs downwards as on the slide.
x_img = [1 size(mip_t,2)];
t_img = t_frame * [1 size(mip_t,1)];

figure;
imagesc(x_img, t_img, mip_t, clim_mip);
colormap(gray)
hold on;
draw_phase_boxes(x_img, phase_range, {c_pre, c_peak, c_post}, t_frame);
add_scale_bar(sb_px, sb_lw, 'w');
style_time_axis(fs_tick, fs_lab, 'k');
set(gcf,'Position',figpos);
if save_figs; exportgraphics(gcf, fullfile(out_dir,'dycoct_d.pdf'), 'ContentType','vector','BackgroundColor','white'); end

%% Panel (e) - binarisation of the same

figure;
imagesc(x_img, t_img, mip_t > th_mip, [0 1]);
colormap(gray)
hold on;
draw_phase_boxes(x_img, phase_range, {c_pre, c_peak, c_post}, t_frame);
add_scale_bar(sb_px, sb_lw, 'w');   % matches the other panels; the bottom
                                    % right of the mask is background, so
                                    % white reads fine there
style_time_axis(fs_tick, fs_lab, 'w');   % same size as (d), invisible on paper
set(gcf,'Position',figpos);
if save_figs; exportgraphics(gcf, fullfile(out_dir,'dycoct_e.pdf'), 'ContentType','vector','BackgroundColor','white'); end

%% Panel (f) - angiogram signal over the contrast time course

y = squeeze(mean(mean(vessel{vessel_num},1),2));
t = t_frame * (1:numel(y));

figure; hold on;
plot(t, y, 'k', 'LineWidth', 2);
xlim([min(t) max(t)]);
pad = 0.08*range(y);
ylim([min(y)-pad, max(y)+pad]);

% same pre/peak/post windows as panels (d) and (e), spanning the full height
yb = ylim;
phase_col = {c_pre, c_peak, c_post};
for r = 1:3
    x0 = t_frame*phase_range{r}(1);
    x1 = t_frame*phase_range{r}(end);
    rectangle('Position', [x0, yb(1), x1-x0, diff(yb)], ...
        'EdgeColor', phase_col{r}, 'LineWidth', 3);
end

xlabel('Time (s)');
ylabel('OCTA Intensity (AU)');
format_font();
box on   % full frame, not just the x and y rulers
set(gcf,'Position',figpos_f); axf=gca; set(axf,'FontSize',fs_tick_f,'FontWeight','bold','Box','on','LineWidth',1.5); set(get(axf,'XLabel'),'FontSize',fs_lab_f,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',fs_lab_f,'FontWeight','bold','Color','k');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'dycoct_f.pdf'), 'ContentType','vector','BackgroundColor','white'); end

%% ---------------------------------------------------------------------
function draw_phase_boxes(x_img, ranges, colors, t_frame)
% Outlines the pre/peak/post windows on a [time x lateral] image whose
% vertical axis is in seconds.
for r = 1:numel(ranges)
    y0 = t_frame * (ranges{r}(1) - 0.5);
    h  = t_frame * numel(ranges{r});
    rectangle('Position', [x_img(1)-0.5, y0, diff(x_img)+1, h], ...
        'EdgeColor', colors{r}, 'LineWidth', 3);
end
end

function add_scale_bar(sb_px, sb_lw, col)
% Lateral scale bar, bottom right, in pixel units.
xl = xlim; yl = ylim;
x1 = xl(2) - 0.04*diff(xl);
y0 = yl(2) - 0.05*diff(yl);
plot([x1-sb_px x1], [y0 y0], col, 'LineWidth', sb_lw);
end

function style_time_axis(fs_tick, fs_lab, col)
% Time on y, lateral direction left to the scale bar rather than an axis.
% Pass col = 'w' to keep the axis - and therefore the exported bounding box -
% identical to the black version while rendering it invisible on the page.
% Panel (e) uses this so it matches (d) in size and the blank axis reads as
% spacing between the two, rather than shrinking either panel.
ax = gca;
ax.XTick = [];
ax.XColor = 'none';
ax.YColor = col;
ylabel('Time (s)');
box off
set(ax, 'FontSize', fs_tick, 'FontWeight', 'bold', 'TickDir', 'out', 'LineWidth', 1.5);
set(get(ax,'YLabel'), 'FontSize', fs_lab, 'FontWeight', 'bold', 'Color', col);
end
