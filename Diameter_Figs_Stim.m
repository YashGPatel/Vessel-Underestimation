close all
clear

%% Output directory for individual subplot PDFs
out_dir = 'C:\Users\BM-Optik01\ownCloud\Vessel Underestimation\figures';
if ~exist(out_dir,'dir'); mkdir(out_dir); end

%% Plots
load('X:\results\Conrad\Vessel Width\vessel_width_stim_7.mat');
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

correction_gge2 = 1/1.0014;
correction_ge2 = 1/1.0372;
correction_bw = 1/0.86348;

% --- Fig 8 (flicker) styling helpers ---
figpos = [100 100 600 460];                                  % uniform aspect for all flicker panels
sigstars = @(pp) repmat('*',1,(pp<0.05)+(pp<0.01)+(pp<0.001));  % '' / * / ** / *** from a p-value
% style_ts / style_bar blocks are applied inline before each exportgraphics:
%   ticks 24 bold, axis labels 32 bold (forced black), annotations 24 bold.

for n = 1:size(g_mean_x.d_e2,1)
    bw_mean.intensity(n,:) = squeeze(mean(mean(vessel{n})));
end
%%
% load('X:\results\Conrad\Vessel Width\vessel_width_stim.mat');

range1 = 1:100;
range2 = 300:400;

x = .0077*5*(1:400);
x2 = [1.5, 4, 6.5, 9, 11.5];
% figure; plot(x,g_mean_x.d_e2','LineWidth',1);
figure; plot(x,correction_ge2.*repmat(info.correction,size(g_mean_x.d_e2,2),1).*g_mean_x.d_e2','LineWidth',1);
hold on;
plot([x(range1(end)), x(range1(end))], [0, 130], 'k--','LineWidth',2)
plot([x(range2(1)), x(range2(1))], [0, 130], 'k--','LineWidth',2)
ylim([0 90]);
xlim([0 x(end-1)]);
text(0.03, 0.06, 'Baseline', 'Units','normalized','FontSize',16,'FontWeight','bold','HorizontalAlignment','left','HandleVisibility','off');
text(0.97, 0.06, 'Post-Stim', 'Units','normalized','FontSize',16,'FontWeight','bold','HorizontalAlignment','right','HandleVisibility','off');
% xlim([0 15]);
xlabel('Time (s)');
% legend('Vessel 1','Vessel 2','Vessel 3','Vessel 4','Vessel 5');
ylabel('Diameter (\mum)')
format_font();
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',16,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',22,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',22,'FontWeight','bold','Color','k');
exportgraphics(gcf, fullfile(out_dir,'flicker_a.pdf'), 'ContentType','vector','BackgroundColor','white');


% range1 = 1:50;
% range2 = 350:400;
% x = [1, 2, 3.5, 4.5, 6, 7, 8.5, 9.5];
x = [1, 2, 3.5, 4.5, 6, 7, 8.5, 9.5, 11, 12];
means = [];
stds = [];
groups = [];
for n = 1:size(g_mean_x.d_e2,1)
    means = [means, info.correction(n).*mean(g_mean_x.d_e2(n,range1)), info.correction(n).*mean(g_mean_x.d_e2(n,range2))];
    stds = [stds, info.correction(n).*std(g_mean_x.d_e2(n,range1)), info.correction(n).*std(g_mean_x.d_e2(n,range2))];
    groups = [groups, 1, 2];
    100*(mean(g_mean_x.d_e2(n,range2))./mean(g_mean_x.d_e2(n,range1))-1)
    [~,p] = ttest2(g_mean_x.d_e2(n,range1), g_mean_x.d_e2(n,range2)); pvals(n) = p;
end

width1 = .2;
width2 = .4;
figure; 
bar(x([5, 9]), means([5, 9]),width1,'b'); hold on; 
bar(x([6, 10]), means([6, 10]),width1,'c'); 
bar(x([1, 3, 7]), means([1, 3, 7]),width2,'FaceColor',[.64,.08,.18]); 
bar(x([2, 4, 8]), means([2, 4, 8]),width2,'r'); 
errorbar(x, means, stds, 'k.','HandleVisibility','off','CapSize',12,'LineWidth',1.2);
scatter(x(1:2:9), info.diam, 'kx');
scatter(x(2:2:10), info.width_2.*info.diam./info.width, 'kx');
ylim([0 80]);
xlim([-.5 13.5]);
% legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
xticks([1.5, 4, 6.5, 9, 11.5]);
xticklabels({'1', '2', '3', '4', '5'});
xlabel('Vessel');
ylabel('Diameter (\mum)')
format_font();
xc = [1.5, 4, 6.5, 9, 11.5];
for n = 1:5
    yt = max(means(2*n-1)+stds(2*n-1), means(2*n)+stds(2*n)) + 3;
    s = sigstars(pvals(n));
    if ~isempty(s)
        plot([x(2*n-1) x(2*n)], [yt yt], 'k', 'LineWidth', 1.2, 'HandleVisibility','off');
        text(xc(n), yt+1, s, 'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',22,'FontWeight','bold');
    end
end
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',16,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',22,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',22,'FontWeight','bold','Color','k');
exportgraphics(gcf, fullfile(out_dir,'flicker_d.pdf'), 'ContentType','vector','BackgroundColor','white');

% --- unused plot (commented out) ---
% width1 = .2;
% width2 = .4;
% figure; 
% bar(x2([3, 5]), 100*(means([6, 10])./means([5, 9])-1),width1,'c'); hold on; 
% bar(x2([1, 2, 4]), 100*(means([2, 4, 8])./means([1, 3, 7])-1),width2,'r'); 
% xlim([-.5, 13.5]);
% ylim([-30 30]);
% % legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
% xticks([1.5, 4, 6.5, 9, 11.5]);
% xticklabels({'1', '2', '3', '4', '5'});
% xlabel('Vessel');
% ylabel('Diameter (\mum)')
% title('Binarized Angiogram');
% format_font();

colors = [0, .45, .74;
          0.85, .33, .1;
          .93, .69, .13;
          .49, .18, .56;
          .47, .67, .19];
figure; hold on; 
ints = 0:1e-7:1.2e-5;
for n = 1:5
    scatter(bw_mean.intensity(n,range1), g_mean_x.d_e2(n,range1))
end
% figure; hold on;
for n = 1:5
    p = polyfit(bw_mean.intensity(n,range1)', g_mean_x.d_e2(n,range1)',1)
    [rho,pval] = corr(bw_mean.intensity(n,range1)', g_mean_x.d_e2(n,range1)')
    rho_mat(n) = rho;
    p_mat(n) = pval;
    plot(ints, ints*p(1) + p(2), 'Color', colors(n,:))
    t = text(0.97, 0.97 - 0.075*(n-1), sprintf('\\rho = %+.3f', rho), 'Units','normalized', 'HorizontalAlignment','right', 'VerticalAlignment','top');
    t.Color = colors(n,:);
end
xlim([0 1.2e-5]); ylim([0 120]);
ylabel('Measured Diameter (\mum)');
xlabel('Angiogram Signal (AU) \times10^{-5}');
format_font();
axis square; set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal'); ax9=gca; ax9.XAxis.Exponent=-5; ax9.XAxis.SecondaryLabel.Visible='off'; xticks(0:0.2e-5:1.2e-5);
exportgraphics(gcf, fullfile(out_dir,'scatter_intensity_a.pdf'), 'ContentType','vector','BackgroundColor','white');
mean(rho_mat)

% width = .2;
% figure; 
% bar(x([1,5]), means([1,5]),width,'b'); hold on; 
% bar(x([2, 6]), means([2, 6]),width,'c'); 
% bar(x([3,7]), means([3,7]),width,'FaceColor',[.64,.08,.18]); 
% bar(x([4, 8]), means([4, 8]),width,'r'); 
% errorbar(x, means, stds, 'k.','HandleVisibility','off','CapSize',12,'LineWidth',1.2);
% ylim([0 80]);
% xlim([-.5 11]);
% legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
% xticks([1.5, 4, 6.5, 9]);
% xticklabels({'1', '2', '3', '4'});
% xlabel('Vessel');
% ylabel('Diameter (\mum)')
% format_font();
%% GG model
range1;
range2;
x = .0077*5*(1:400);
% figure; plot(x,gg_mean_x.d_e2','LineWidth',1);
figure; plot(x,correction_gge2.*repmat(info.correction,size(gg_mean_x.d_e2,2),1).*gg_mean_x.d_e2','LineWidth',1);
hold on;
plot([x(range1(end)), x(range1(end))], [0, 130], 'k--','LineWidth',2)
plot([x(range2(1)), x(range2(1))], [0, 130], 'k--','LineWidth',2)
ylim([0 90]);
xlim([0 x(end-1)]);
text(0.03, 0.06, 'Baseline', 'Units','normalized','FontSize',16,'FontWeight','bold','HorizontalAlignment','left','HandleVisibility','off');
text(0.97, 0.06, 'Post-Stim', 'Units','normalized','FontSize',16,'FontWeight','bold','HorizontalAlignment','right','HandleVisibility','off');
% xlim([0 15]);
xlabel('Time (s)');
ylabel('Diameter (\mum)')
format_font();
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',16,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',22,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',22,'FontWeight','bold','Color','w');
exportgraphics(gcf, fullfile(out_dir,'flicker_b.pdf'), 'ContentType','vector','BackgroundColor','white');

% range1 = 1:100;
% range2 = 300:400;
% range1 = 1:50;
% range2 = 350:400;
% x = [1, 2, 3.5, 4.5, 6, 7, 8.5, 9.5];
x = [1, 2, 3.5, 4.5, 6, 7, 8.5, 9.5, 11, 12];
means = [];
stds = [];
groups = [];
for n = 1:size(g_mean_x.d_e2,1)
    means = [means, info.correction(n).*mean(gg_mean_x.d_e2(n,range1)), info.correction(n).*mean(gg_mean_x.d_e2(n,range2))];
    stds = [stds, info.correction(n).*std(gg_mean_x.d_e2(n,range1)), info.correction(n).*std(gg_mean_x.d_e2(n,range2))];
    groups = [groups, 1, 2];
    100*(mean(gg_mean_x.d_e2(n,range2))./mean(gg_mean_x.d_e2(n,range1))-1)
    [~,p] = ttest2(gg_mean_x.d_e2(n,range1), gg_mean_x.d_e2(n,range2)); pvals(n) = p;
end

width1 = .2;
width2 = .4;
figure; 
bar(x([5, 9]), means([5, 9]),width1,'b'); hold on; 
bar(x([6, 10]), means([6, 10]),width1,'c'); 
bar(x([1, 3, 7]), means([1, 3, 7]),width2,'FaceColor',[.64,.08,.18]); 
bar(x([2, 4, 8]), means([2, 4, 8]),width2,'r'); 
scatter(x(1:2:9), info.diam, 'kx');
scatter(x(2:2:10), info.width_2.*info.diam./info.width, 'kx');
errorbar(x, means, stds, 'k.','HandleVisibility','off','CapSize',12,'LineWidth',1.2);
ylim([0 80]);
xlim([-.5 13.5]);
% legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
xticks([1.5, 4, 6.5, 9, 11.5]);
xticklabels({'1', '2', '3', '4', '5'});
xlabel('Vessel');
ylabel('Diameter (\mum)')
format_font();
xc = [1.5, 4, 6.5, 9, 11.5];
for n = 1:5
    yt = max(means(2*n-1)+stds(2*n-1), means(2*n)+stds(2*n)) + 3;
    s = sigstars(pvals(n));
    if ~isempty(s)
        plot([x(2*n-1) x(2*n)], [yt yt], 'k', 'LineWidth', 1.2, 'HandleVisibility','off');
        text(xc(n), yt+1, s, 'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',22,'FontWeight','bold');
    end
end
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',16,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',22,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',22,'FontWeight','bold','Color','w');
exportgraphics(gcf, fullfile(out_dir,'flicker_e.pdf'), 'ContentType','vector','BackgroundColor','white');

% --- unused plot (commented out) ---
% width1 = .2;
% width2 = .4;
% figure; 
% bar(x2([3, 5]), 100*(means([6, 10])./means([5, 9])-1),width1,'c'); hold on; 
% bar(x2([1, 2, 4]), 100*(means([2, 4, 8])./means([1, 3, 7])-1),width2,'r'); 
% xlim([-.5, 13.5]);
% ylim([-30 30]);
% % legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
% xticks([1.5, 4, 6.5, 9, 11.5]);
% xticklabels({'1', '2', '3', '4', '5'});
% xlabel('Vessel');
% ylabel('Diameter (\mum)')
% title('Binarized Angiogram');
% format_font();

colors = [0, .45, .74;
          0.85, .33, .1;
          .93, .69, .13;
          .49, .18, .56;
          .47, .67, .19];
figure; hold on; 
ints = 0:1e-7:1.2e-5;
for n = 1:5
    scatter(bw_mean.intensity(n,range1), gg_mean_x.d_e2(n,range1))
end
% figure; hold on;
for n = 1:5
    p = polyfit(bw_mean.intensity(n,range1)', gg_mean_x.d_e2(n,range1)',1)
    [rho,pval] = corr(bw_mean.intensity(n,range1)', gg_mean_x.d_e2(n,range1)')
    rho_mat(n) = rho;
    p_mat(n) = pval;
    plot(ints, ints*p(1) + p(2), 'Color', colors(n,:))
    t = text(0.97, 0.97 - 0.075*(n-1), sprintf('\\rho = %+.3f', rho), 'Units','normalized', 'HorizontalAlignment','right', 'VerticalAlignment','top');
    t.Color = colors(n,:);
end
xlim([0 1.2e-5]); ylim([0 120]);
ylabel('Measured Diameter (\mum)');
xlabel('Angiogram Signal (AU) \times10^{-5}');
format_font();
axis square; set(gca,'FontSize',28,'FontWeight','bold'); set(get(gca,'XLabel'),'FontSize',38,'FontWeight','bold','Color','k'); set(get(gca,'YLabel'),'FontSize',38,'FontWeight','bold','Color','w'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal'); ax9=gca; ax9.XAxis.Exponent=-5; ax9.XAxis.SecondaryLabel.Visible='off'; xticks(0:0.2e-5:1.2e-5);
exportgraphics(gcf, fullfile(out_dir,'scatter_intensity_b.pdf'), 'ContentType','vector','BackgroundColor','white');
mean(rho_mat)
% width = .2;
% figure; 
% bar(x([1,5]), means([1,5]),width,'b'); hold on; 
% bar(x([2, 6]), means([2, 6]),width,'c'); 
% bar(x([3,7]), means([3,7]),width,'FaceColor',[.64,.08,.18]); 
% bar(x([4, 8]), means([4, 8]),width,'r'); 
% errorbar(x, means, stds, 'k.','HandleVisibility','off','CapSize',12,'LineWidth',1.2);
% ylim([0 80]);
% xlim([-.5 11]);
% legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
% xticks([1.5, 4, 6.5, 9]);
% xticklabels({'1', '2', '3', '4'});
% xlabel('Vessel');
% ylabel('Diameter (\mum)')
% format_font();
%% BW Diameter
thresh = 5;
range1;
range2;
x = .0077*5*(1:400);
% figure; plot(x,bw_mean.diameter(:,:,thresh)','LineWidth',1);
figure; plot(x,correction_bw.*repmat(info.correction,size(g_mean_x.d_e2,2),1).*bw_mean.diameter(:,:,thresh)','LineWidth',1);
hold on;
plot([x(range1(end)), x(range1(end))], [0, 130], 'k--','LineWidth',2)
plot([x(range2(1)), x(range2(1))], [0, 130], 'k--','LineWidth',2)
ylim([0 90]);
xlim([0 x(end-1)]);
text(0.03, 0.06, 'Baseline', 'Units','normalized','FontSize',16,'FontWeight','bold','HorizontalAlignment','left','HandleVisibility','off');
text(0.97, 0.06, 'Post-Stim', 'Units','normalized','FontSize',16,'FontWeight','bold','HorizontalAlignment','right','HandleVisibility','off');
% xlim([0 15]);
xlabel('Time (s)');
ylabel('Diameter (\mum)')
format_font();
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',16,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',22,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',22,'FontWeight','bold','Color','w');
exportgraphics(gcf, fullfile(out_dir,'flicker_c.pdf'), 'ContentType','vector','BackgroundColor','white');
% range1 = 1:50;
% range2 = 350:400;
% x = [1, 2, 3.5, 4.5, 6, 7, 8.5, 9.5];
x = [1, 2, 3.5, 4.5, 6, 7, 8.5, 9.5, 11, 12];
means = [];
stds = [];
groups = [];

for n = 1:size(g_mean_x.d_e2,1)
    means = [means, correction_bw.*info.correction(n).*mean(bw_mean.diameter(n,range1,thresh)), correction_bw.*info.correction(n).*mean(bw_mean.diameter(n,range2,thresh))];
    stds = [stds, correction_bw.*info.correction(n).*std(bw_mean.diameter(n,range1,thresh)), correction_bw.*info.correction(n).*std(bw_mean.diameter(n,range2,thresh))];
    groups = [groups, 1, 2];
    100*(mean(bw_mean.diameter(n,range2,thresh))./mean(bw_mean.diameter(n,range1,thresh))-1)
    [~,p] = ttest2(bw_mean.diameter(n,range1,thresh), bw_mean.diameter(n,range2,thresh)); pvals(n) = p;
end

width1 = .2;
width2 = .4;
figure; 
bar(x([5, 9]), means([5, 9]),width1,'b'); hold on; 
bar(x([6, 10]), means([6, 10]),width1,'c'); 
bar(x([1, 3, 7]), means([1, 3, 7]),width2,'FaceColor',[.64,.08,.18]); 
bar(x([2, 4, 8]), means([2, 4, 8]),width2,'r'); 
scatter(x(1:2:9), info.diam, 'kx');
scatter(x(2:2:10), info.width_2.*info.diam./info.width, 'kx');
errorbar(x, means, stds, 'k.','HandleVisibility','off','CapSize',12,'LineWidth',1.2);
ylim([0 80]);
xlim([-.5 13.5]);
% legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
xticks([1.5, 4, 6.5, 9, 11.5]);
xticklabels({'1', '2', '3', '4', '5'});
xlabel('Vessel');
ylabel('Diameter (\mum)')
format_font();
xc = [1.5, 4, 6.5, 9, 11.5];
for n = 1:5
    yt = max(means(2*n-1)+stds(2*n-1), means(2*n)+stds(2*n)) + 3;
    s = sigstars(pvals(n));
    if ~isempty(s)
        plot([x(2*n-1) x(2*n)], [yt yt], 'k', 'LineWidth', 1.2, 'HandleVisibility','off');
        text(xc(n), yt+1, s, 'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',22,'FontWeight','bold');
    end
end
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',16,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',22,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',22,'FontWeight','bold','Color','w');
exportgraphics(gcf, fullfile(out_dir,'flicker_f.pdf'), 'ContentType','vector','BackgroundColor','white');


% --- unused plot (commented out) ---
% width1 = .2;
% width2 = .4;
% figure; 
% bar(x2([3, 5]), 100*(means([6, 10])./means([5, 9])-1),width1,'c'); hold on; 
% bar(x2([1, 2, 4]), 100*(means([2, 4, 8])./means([1, 3, 7])-1),width2,'r'); 
% xlim([-.5, 13.5]);
% ylim([-30 30]);
% % legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
% xticks([1.5, 4, 6.5, 9, 11.5]);
% xticklabels({'1', '2', '3', '4', '5'});
% xlabel('Vessel');
% ylabel('Diameter (\mum)')
% title('Binarized Angiogram');
% format_font();

% --- unused plot (commented out) ---
% figure; hold on; 
% for n = 1:5
%     scatter(bw_mean.intensity(n,:), bw_mean.diameter(n,:,thresh))
% end

colors = [0, .45, .74;
          0.85, .33, .1;
          .93, .69, .13;
          .49, .18, .56;
          .47, .67, .19];
figure; hold on; 
ints = 0:1e-7:1.2e-5;
for n = 1:5
    scatter(bw_mean.intensity(n,range1), bw_mean.diameter(n,range1,thresh))
end
% figure; hold on;
for n = 1:5
    p = polyfit(bw_mean.intensity(n,range1)', bw_mean.diameter(n,range1,thresh)',1)
    [rho,pval] = corr(bw_mean.intensity(n,range1)', bw_mean.diameter(n,range1,thresh)')
    rho_mat(n) = rho;
    p_mat(n) = pval;
    plot(ints, ints*p(1) + p(2), 'Color', colors(n,:))
    t = text(0.97, 0.97 - 0.075*(n-1), sprintf('\\rho = %+.3f', rho), 'Units','normalized', 'HorizontalAlignment','right', 'VerticalAlignment','top');
    t.Color = colors(n,:);
end
xlim([0 1.2e-5]); ylim([0 120]);
ylabel('Measured Diameter (\mum)');
xlabel('Angiogram Signal (AU) \times10^{-5}');
format_font();
axis square; set(gca,'FontSize',28,'FontWeight','bold'); set(get(gca,'XLabel'),'FontSize',38,'FontWeight','bold','Color','k'); set(get(gca,'YLabel'),'FontSize',38,'FontWeight','bold','Color','w'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal'); ax9=gca; ax9.XAxis.Exponent=-5; ax9.XAxis.SecondaryLabel.Visible='off'; xticks(0:0.2e-5:1.2e-5);
exportgraphics(gcf, fullfile(out_dir,'scatter_intensity_c.pdf'), 'ContentType','vector','BackgroundColor','white');
mean(rho_mat)
% width = .2;
% figure; 
% bar(x([1,5]), means([1,5]),width,'b'); hold on; 
% bar(x([2, 6]), means([2, 6]),width,'c'); 
% bar(x([3,7]), means([3,7]),width,'FaceColor',[.64,.08,.18]); 
% bar(x([4, 8]), means([4, 8]),width,'r'); 
% errorbar(x, means, stds, 'k.','HandleVisibility','off','CapSize',12,'LineWidth',1.2);
% ylim([0 80]);
% xlim([-.5 11]);
% legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
% xticks([1.5, 4, 6.5, 9]);
% xticklabels({'1', '2', '3', '4'});
% xlabel('Vessel');
% ylabel('Diameter (\mum)')
% format_font();
%% Intensity

range1;
range2;

for n = 1:size(g_mean_x.d_e2,1)
    bw_mean.intensity(n,:) = squeeze(mean(mean(vessel{n})));
end
x = .0077*5*(1:400);
figure; hold on;
plot(x,bw_mean.intensity(:,:)','LineWidth',1);
plot([x(range1(end)), x(range1(end))], [0, 12e-6], 'k--','LineWidth',2)
plot([x(range2(1)), x(range2(1))], [0, 12e-6], 'k--','LineWidth',2)
ylim([0 11e-6]);
xlim([0 x(end-1)]);
text(0.03, 0.06, 'Baseline', 'Units','normalized','FontSize',16,'FontWeight','bold','HorizontalAlignment','left','HandleVisibility','off');
text(0.97, 0.06, 'Post-Stim', 'Units','normalized','FontSize',16,'FontWeight','bold','HorizontalAlignment','right','HandleVisibility','off');
% legend moved to standalone key (flicker_legend.pdf) in the empty bottom-row cell
% xlim([0 15]);
xlabel('Time (s)');
ylabel('Angiogram Signal (AU)')
format_font();

% title('Int Flicker Stimulation');
format_font();
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',16,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',22,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',22,'FontWeight','bold','Color','k');
exportgraphics(gcf, fullfile(out_dir,'flicker_g.pdf'), 'ContentType','vector','BackgroundColor','white');

% range1 = 1:50;
% range2 = 350:400;
% x = [1, 2, 3.5, 4.5, 6, 7, 8.5, 9.5];
x = [1, 2, 3.5, 4.5, 6, 7, 8.5, 9.5, 11, 12];

means = [];
stds = [];
groups = [];
thresh = 1;
for n = 1:size(g_mean_x.d_e2,1)
    means = [means, mean(bw_mean.intensity(n,range1)), mean(bw_mean.intensity(n,range2))];
    stds = [stds, std(bw_mean.intensity(n,range1)), std(bw_mean.intensity(n,range2))];
    groups = [groups, 1, 2];
    100*(mean(bw_mean.intensity(n,range2))./mean(bw_mean.intensity(n,range1))-1)
    [~,p] = ttest2(bw_mean.intensity(n,range1), bw_mean.intensity(n,range2)); pvals(n) = p;
end

width1 = .2;
width2 = .4;
figure; 
bar(x([5, 9]), means([5, 9]),width1,'b'); hold on; 
bar(x([6, 10]), means([6, 10]),width1,'c'); 
bar(x([1, 3, 7]), means([1, 3, 7]),width2,'FaceColor',[.64,.08,.18]); 
bar(x([2, 4, 8]), means([2, 4, 8]),width2,'r'); 
errorbar(x, means, stds, 'k.','HandleVisibility','off','CapSize',12,'LineWidth',1.2);
% ylim([0 80]);
xlim([-.5 13.5]);
ylim([0, 11e-6]);
% legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
xticks([1.5, 4, 6.5, 9, 11.5]);
xticklabels({'1', '2', '3', '4', '5'});
xlabel('Vessel');
ylabel('Angiogram Signal (AU)')
format_font();
xc = [1.5, 4, 6.5, 9, 11.5];
for n = 1:5
    yt = max(means(2*n-1)+stds(2*n-1), means(2*n)+stds(2*n)) + 0.4e-6;
    s = sigstars(pvals(n));
    if ~isempty(s)
        plot([x(2*n-1) x(2*n)], [yt yt], 'k', 'LineWidth', 1.2, 'HandleVisibility','off');
        text(xc(n), yt+0.1e-6, s, 'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',22,'FontWeight','bold');
    end
end
set(gcf,'Position',figpos); axf=gca; set(axf,'FontSize',16,'FontWeight','bold'); set(get(axf,'XLabel'),'FontSize',22,'FontWeight','bold','Color','k'); set(get(axf,'YLabel'),'FontSize',22,'FontWeight','bold','Color','w');
exportgraphics(gcf, fullfile(out_dir,'flicker_h.pdf'), 'ContentType','vector','BackgroundColor','white');

%% Standalone shared legend for Fig 8 (placed in the empty bottom-row cell in LaTeX)
leg_colors = [0, .45, .74; 0.85, .33, .1; .93, .69, .13; .49, .18, .56; .47, .67, .19];
figure; hold on; axis off;
hL = gobjects(1,9);
for n = 1:5
    hL(n) = plot(nan, nan, '-', 'Color', leg_colors(n,:), 'LineWidth', 4, 'DisplayName', ['Vessel ' num2str(n)]);
end
hL(6) = plot(nan, nan, 's', 'MarkerFaceColor', [0 0 1],      'MarkerEdgeColor','k', 'MarkerSize', 14, 'LineStyle','none', 'DisplayName','Vein - Baseline');
hL(7) = plot(nan, nan, 's', 'MarkerFaceColor', [0 1 1],      'MarkerEdgeColor','k', 'MarkerSize', 14, 'LineStyle','none', 'DisplayName','Vein - Post-Stim');
hL(8) = plot(nan, nan, 's', 'MarkerFaceColor', [.64 .08 .18],'MarkerEdgeColor','k', 'MarkerSize', 14, 'LineStyle','none', 'DisplayName','Artery - Baseline');
hL(9) = plot(nan, nan, 's', 'MarkerFaceColor', [1 0 0],      'MarkerEdgeColor','k', 'MarkerSize', 14, 'LineStyle','none', 'DisplayName','Artery - Post-Stim');
lg = legend(hL, 'FontSize', 22, 'Location', 'west'); lg.Box = 'off';
set(gcf,'Position',[300 300 400 600]);
exportgraphics(gcf, fullfile(out_dir,'flicker_legend.pdf'), 'ContentType','vector','BackgroundColor','white');


% --- unused plot (commented out) ---
% width1 = .2;
% width2 = .4;
% figure; 
% bar(x2([3, 5]), 100*(means([6, 10])./means([5, 9])-1),width1,'c'); hold on; 
% bar(x2([1, 2, 4]), 100*(means([2, 4, 8])./means([1, 3, 7])-1),width2,'r'); 
% xlim([-.5, 13.5]);
% ylim([-30 30]);
% % legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
% xticks([1.5, 4, 6.5, 9, 11.5]);
% xticklabels({'1', '2', '3', '4', '5'});
% xlabel('Vessel');
% ylabel('Angiogram Signal (AU)')
% title('Angiogram Intensity');
% format_font();


% width = .2;
% figure; 
% bar(x([1,5]), means([1,5]),width,'b'); hold on; 
% bar(x([2, 6]), means([2, 6]),width,'c'); 
% bar(x([3,7]), means([3,7]),width,'FaceColor',[.64,.08,.18]); 
% bar(x([4, 8]), means([4, 8]),width,'r'); 
% errorbar(x, means, stds, 'k.','HandleVisibility','off','CapSize',12,'LineWidth',1.2);
% % ylim([0 80]);
% xlim([-.5 11]);
% legend('Vein - Pre', 'Vein - Post', 'Artery - Pre', 'Artery - Post');
% xticks([1.5, 4, 6.5, 9]);
% xticklabels({'1', '2', '3', '4'});
% xlabel('Vesse