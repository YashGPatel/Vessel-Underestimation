% Vessel Profile Script  --  panels for gg_model.pdf
close all
clear

%% Run / output options  --  set to false to test-run without writing files
save_figs   = 1;    % write figure PDFs (exportgraphics)

%% Output directory for individual subplot PDFs
out_dir = 'C:\Users\BM-Optik01\ownCloud\Vessel Underestimation\figures';
if save_figs && ~exist(out_dir,'dir'); mkdir(out_dir); end

%% Plots
load('X:\results\Conrad\Vessel Width\vessel_width3_model.mat');

% Centred, symmetric profile with an unpinned beta (see notes below).
frame = 151;
vessel_num = 6;
% frame = 70;  vessel_num = 7;   % alternative: cleanest trace (SNR 92), beta 6.8
% frame = 80;  vessel_num = 2;   % previous selection - off-centre, beta pinned at 2
%
% beta is bounded to [2 20] in vessel_diameter_V5.m, so any frame reporting
% beta == 2 has the generalized Gaussian collapsed onto the plain Gaussian.
% Vessel 6 / frame 151: mu = +0.2 um (centred), beta = 9.9 (flat top),
% R^2 0.895 (GG) vs 0.821 (G) - the largest model gap in the dataset.

% As a reminder these are the general time ranges
% baseline = 1:40;
% peak = 50:100;
% post = 125:400;

% Generalized Gaussian
ft_gg = fittype( ...
    '(A.*exp(-(abs(x-mu)./alpha).^beta)+C)', ...
    'independent','x', ...
    'coeff', {'A','mu','alpha','beta','C'} ...
    );

% Normal Gaussian
ft_g = fittype( ...
    '(A.*exp(-(x-mu).^2./(2.*sigma.^2))+C)', ...
    'independent','x', ...
    'coeff', {'A','mu','sigma','C'} ...
    );

% --- Fig 3 (gg_model) styling helpers ---
figpos  = [100 100 900 700];    % uniform aspect for both gg_model panels
% Panels print ~4.75 cm wide from a ~605 pt PDF, i.e. everything on the page is
% ~0.22x these sizes: 32 -> 7 pt ticks, 40 -> 9 pt labels, 26 -> 5.8 pt legend.
fs_tick = 32;                   % tick labels
fs_lab  = 40;                   % axis labels
fs_leg  = 26;                   % legend entries
lw_data = 1.5;                  % raw angiogram projection
lw_fit  = 4;                    % model curves
head    = 1.75;                 % headroom above the data so the legend clears it
% style block is applied inline before each exportgraphics:
%   ticks fs_tick bold, axis labels fs_lab bold (forced black), legend fs_leg bold.

%% Variables for each fit

x = g_mean_x.x{vessel_num}; % in microns
x_up = min(x):0.1:max(x); % upsampled x range for models, spans the cropped data

%% Panel (a) - Generalized Gaussian shape vs beta

beta_list = 1:4;
x_beta = -100:0.1:100;

figure; hold on;
for n = 1:numel(beta_list)
    plot(x_beta, feval(ft_gg, 1, 0, 40, beta_list(n), 0, x_beta), 'LineWidth', lw_fit);
end
xlim([min(x_beta) max(x_beta)]);
ylim([0 1.45]);            % headroom so the legend clears the curves
xticks(-100:50:100);
yticks(0:0.2:1);
xlabel('Position (AU)');
ylabel('Signal (AU)');
lg = legend(compose('\\beta = %d', beta_list), 'Location','northeast');
lg.Box = 'on';
lg.ItemTokenSize = [22, 14];   % [width height] - keeps the key compact
format_font();
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',fs_tick,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',fs_lab,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',fs_lab,'FontWeight','bold','Color','k'); set(lg,'FontSize',fs_leg,'FontWeight','bold');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'gg_model_a.pdf'), 'ContentType','vector','BackgroundColor','white'); end

% --- unused panel (commented out) --- mean intensity projection, was gg_model_b.pdf
% figure; hold on;
% h_raw = plot(x, mean(vessel{vessel_num}(:,:,frame),1), 'k', 'LineWidth', lw_data);
%
% cf = gg_mean_x.cf{vessel_num, frame};
% y_up = gg_mean_x.scale(vessel_num, frame) .* feval(ft_gg, cf.A, cf.mu, cf.alpha, cf.beta, cf.C, x_up);
% h_gg = plot(x_up, y_up, 'r', 'LineWidth', lw_fit);
%
% cf = g_mean_x.cf{vessel_num, frame};
% y_up = g_mean_x.scale(vessel_num, frame) .* feval(ft_g, cf.A, cf.mu, cf.sigma, cf.C, x_up);
% h_g = plot(x_up, y_up, 'b', 'LineWidth', lw_fit);
%
% xlim([min(x) max(x)]);
% xlabel('Position (\mum)');
% ylabel('Angiogram Signal (AU)');
% lg = legend([h_raw h_gg h_g], {'Angiogram Projection','Generalised Gaussian','Gaussian'}, 'Location','northeast');
% lg.Box = 'on';
% format_font();
% set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',fs_tick,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',fs_lab,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',fs_lab,'FontWeight','bold','Color','k'); set(lg,'FontSize',fs_leg,'FontWeight','bold');
% if save_figs; exportgraphics(gcf, fullfile(out_dir,'gg_model_b.pdf'), 'ContentType','vector','BackgroundColor','white'); end

%% Panel (c) - Example fits, max intensity projection

% Raw Projection
y_raw = max(vessel{vessel_num}(:,:,frame),[],1);
figure; hold on;
h_raw = plot(x, y_raw, 'k', 'LineWidth', lw_data);

% Generalized Gaussian Model
cf = gg_max_x.cf{vessel_num, frame};
y_up = gg_max_x.scale(vessel_num, frame) .* feval(ft_gg, cf.A, cf.mu, cf.alpha, cf.beta, cf.C, x_up);
h_gg = plot(x_up, y_up, 'r', 'LineWidth', lw_fit);

% Gaussian Model
cf = g_max_x.cf{vessel_num, frame};
y_up = g_max_x.scale(vessel_num, frame) .* feval(ft_g, cf.A, cf.mu, cf.sigma, cf.C, x_up);
h_g = plot(x_up, y_up, 'b', 'LineWidth', lw_fit);

xlim([min(x) max(x)]);
ylim([0 head*max(y_raw)]);     % headroom so the legend clears the trace
xlabel('Position (\mum)');
ylabel('Angiogram Signal (AU)');
lg = legend([h_raw h_gg h_g], {'Angiogram Projection','Generalised Gaussian','Gaussian'}, 'Location','northeast');
lg.Box = 'on';
lg.ItemTokenSize = [22, 14];   % [width height] - keeps the key compact
format_font();
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',fs_tick,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',fs_lab,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',fs_lab,'FontWeight','bold','Color','k'); set(lg,'FontSize',fs_leg,'FontWeight','bold');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'gg_model_c.pdf'), 'ContentType','vector','BackgroundColor','white'); end

% The contrast time course that used to live here is panel (f) of the dycoct
% figure and now lives in DyCOCT_Figs.m.
