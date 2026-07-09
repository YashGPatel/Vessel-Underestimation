close all
clear

%% Run / output options  --  set to false to test-run without writing files
save_figs   = 1;    % write figure PDFs (exportgraphics)
save_tables = 1;    % write stats tables (xlsx/csv/mat)

%% Output directory for individual subplot PDFs
out_dir = 'C:\Users\BM-Optik01\ownCloud\Vessel Underestimation\figures';
if save_figs && ~exist(out_dir,'dir'); mkdir(out_dir); end

%% Plots
load('X:\results\Conrad\Vessel Width\vessel_width3_model.mat');
baseline = 1:40;
peak = 50:100;
post = 125:400;

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

% baseline = 1:133;
% peak = 134:266;
% post = 267:400;

ground_truth = info.ground_truth;
correction = info.correction;
        
for m = 1:length(vessel)
end
%different phases of contrast
for n = 1:3
    if n == 1
        range = baseline;
        name = 'baseline';
    elseif n == 2
        range = peak;
        name = 'peak';
    else
        range = post;
        name = 'post';
    end
    
    
    
%     figure; hold on;
%     errorbar(1:length(vessel),mean(g_mean_x.d_fwhm(:,range),2),std(g_mean_x.d_fwhm(:,range),[],2),'bo');
%     errorbar((1:length(vessel))+.1,mean(gg_mean_x.d_fwhm(:,range),2),std(gg_mean_x.d_fwhm(:,range),[],2),'co');
%     errorbar((1:length(vessel))+.2,mean(g_max_x.d_fwhm(:,range),2),std(g_max_x.d_fwhm(:,range),[],2),'ro');
%     errorbar((1:length(vessel))+.3,mean(gg_max_x.d_fwhm(:,range),2),std(gg_max_x.d_fwhm(:,range),[],2),'mo');
% 
%     figure; hold on;
%     errorbar(1:length(vessel),mean(g_mean_x.d_e2(:,range),2),std(g_mean_x.d_e2(:,range),[],2),'bo');
%     errorbar((1:length(vessel))+.1,mean(gg_mean_x.d_e2(:,range),2),std(gg_mean_x.d_e2(:,range),[],2),'co');
%     errorbar((1:length(vessel))+.2,mean(g_max_x.d_e2(:,range),2),std(g_max_x.d_e2(:,range),[],2),'ro');
%     errorbar((1:length(vessel))+.3,mean(gg_max_x.d_e2(:,range),2),std(gg_max_x.d_e2(:,range),[],2),'mo');
    
%     figure; hold on;
%     errorbar(ground_truth,correction'.*mean(g_mean_x.d_fwhm(:,range),2),correction'.*std(g_mean_x.d_fwhm(:,range),[],2),'bo');
%     errorbar(ground_truth,correction'.*mean(gg_mean_x.d_fwhm(:,range),2),correction'.*std(gg_mean_x.d_fwhm(:,range),[],2),'co');
%     errorbar(ground_truth,correction'.*mean(g_max_x.d_fwhm(:,range),2),correction'.*std(g_max_x.d_fwhm(:,range),[],2),'ro');
%     errorbar(ground_truth,correction'.*mean(gg_max_x.d_fwhm(:,range),2),correction'.*std(gg_max_x.d_fwhm(:,range),[],2),'mo');
%     plot(0:60,0:60,'k');
%     axis square
%     title(name);
% 
%     figure; hold on;
%     errorbar(ground_truth,correction'.*mean(g_mean_x.d_e2(:,range),2),correction'.*std(g_mean_x.d_e2(:,range),[],2),'bo');
%     errorbar(ground_truth,correction'.*mean(gg_mean_x.d_e2(:,range),2),correction'.*std(gg_mean_x.d_e2(:,range),[],2),'co');
%     errorbar(ground_truth,correction'.*mean(g_max_x.d_e2(:,range),2),correction'.*std(g_max_x.d_e2(:,range),[],2),'ro');
%     errorbar(ground_truth,correction'.*mean(gg_max_x.d_e2(:,range),2),correction'.*std(gg_max_x.d_e2(:,range),[],2),'mo');
%     plot(0:60,0:60,'k');
%     axis square
%     title(name);
end

% 
% %comparing phases of contrast
% for n = 1:3
%     if n == 1
%         range = baseline;
%         name = 'peak';
%     elseif n == 2
%         range = peak;
%         name = 'peak';
%     else
%         range = post;
%         name = 'post';
%     end
%     
% %     figure; hold on;
% %     errorbar(1:length(vessel),mean(g_mean_x.d_fwhm(:,range),2),std(g_mean_x.d_fwhm(:,range),[],2),'bo');
% %     errorbar((1:length(vessel))+.1,mean(gg_mean_x.d_fwhm(:,range),2),std(gg_mean_x.d_fwhm(:,range),[],2),'co');
% %     errorbar((1:length(vessel))+.2,mean(g_max_x.d_fwhm(:,range),2),std(g_max_x.d_fwhm(:,range),[],2),'ro');
% %     errorbar((1:length(vessel))+.3,mean(gg_max_x.d_fwhm(:,range),2),std(gg_max_x.d_fwhm(:,range),[],2),'mo');
% % 
% %     figure; hold on;
% %     errorbar(1:length(vessel),mean(g_mean_x.d_e2(:,range),2),std(g_mean_x.d_e2(:,range),[],2),'bo');
% %     errorbar((1:length(vessel))+.1,mean(gg_mean_x.d_e2(:,range),2),std(gg_mean_x.d_e2(:,range),[],2),'co');
% %     errorbar((1:length(vessel))+.2,mean(g_max_x.d_e2(:,range),2),std(g_max_x.d_e2(:,range),[],2),'ro');
% %     errorbar((1:length(vessel))+.3,mean(gg_max_x.d_e2(:,range),2),std(gg_max_x.d_e2(:,range),[],2),'mo');
%     figure; hold on;
%     errorbar(ground_truth,correction.*mean(g_mean_x.d_fwhm(:,range),2),correction.*std(g_mean_x.d_fwhm(:,range),[],2),'bo');
%     errorbar(ground_truth,correction.*mean(gg_mean_x.d_fwhm(:,range),2),std(gg_mean_x.d_fwhm(:,range),[],2),'co');
%     errorbar(ground_truth,correction.*mean(g_max_x.d_fwhm(:,range),2),std(g_max_x.d_fwhm(:,range),[],2),'ro');
%     errorbar(ground_truth,correction.*mean(gg_max_x.d_fwhm(:,range),2),std(gg_max_x.d_fwhm(:,range),[],2),'mo');
% 
%     figure; hold on;
%     errorbar(ground_truth,correction.*mean(g_mean_x.d_e2(:,range),2),std(g_mean_x.d_e2(:,range),[],2),'bo');
%     errorbar(ground_truth,correction.*mean(gg_mean_x.d_e2(:,range),2),std(gg_mean_x.d_e2(:,range),[],2),'co');
%     errorbar(ground_truth,correction.*mean(g_max_x.d_e2(:,range),2),std(g_max_x.d_e2(:,range),[],2),'ro');
%     errorbar(ground_truth,correction.*mean(gg_max_x.d_e2(:,range),2),std(gg_max_x.d_e2(:,range),[],2),'mo');
% end
%% comparing type across phases - Gaussian Model
CoV = [];
CoV_std = [];
R2 = [];
Slope = [];
RSME = [];
CoV_names = {};
CoV_ind = 1;

plot_range = [0 100];
figure; hold on;
%
disp('Max FWHM')
for n = 1:3
    if n == 1
        range = baseline;
        name = 'baseline';
        option = 'bo';
        option2 = 'b';
    elseif n == 2
        range = peak;
        name = 'peak';
        option = 'go';
        option2 = 'g';
    else
        range = post;
        name = 'post';
        option = 'ro';
        option2 = 'r';
    end
    x = plot_range(1):plot_range(2);
    fittedLinearModel = fitlm(ground_truth, correction'.*mean(g_max_x.d_fwhm(:,range),2),  'y ~ x1 - 1');
    plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
    t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
    t.Color = option2;
%     fittedLinearModel.Coefficients.Estimate
%     fittedLinearModel.Rsquared
    
    errorbar(ground_truth,correction'.*mean(g_max_x.d_fwhm(:,range),2),correction'.*std(g_max_x.d_fwhm(:,range),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
%     errorbar(ground_truth,correction'.*mean(g_mean_x.d_e2(:,range),2),correction'.*std(g_mean_x.d_e2(:,range),[],2),option);
    CoV(n,CoV_ind) = mean(std(g_max_x.d_fwhm(:,range),[],2)./mean(g_max_x.d_fwhm(:,range),2));
    CoV_std(n,CoV_ind) = std(std(g_max_x.d_fwhm(:,range),[],2)./mean(g_max_x.d_fwhm(:,range),2));
    R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
    RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
    Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
end
CoV_names{CoV_ind} = 'G Max FWHM';
CoV_ind = CoV_ind + 1;

plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
title('Max Projection - FWHM Diameter');
xlabel('Ground Truth Diameter (\mum)');
ylabel('Modeled Diameter (\mum)');
axis square
xlim([plot_range]);
ylim([plot_range]);
format_font();


figure; hold on;
%comparing type across phases
disp('Max e2')
for n = 1:3
    if n == 1
        range = baseline;
        name = 'baseline';
        option = 'bo';
        option2 = 'b';
    elseif n == 2
        range = peak;
        name = 'peak';
        option = 'go';
        option2 = 'g';
    else
        range = post;
        name = 'post';
        option = 'ro';
        option2 = 'r';
    end
    x = plot_range(1):plot_range(2);
    fittedLinearModel = fitlm(ground_truth, correction'.*mean(g_max_x.d_e2(:,range),2),  'y ~ x1 - 1');
    plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
    t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
    t.Color = option2;
%     fittedLinearModel.Coefficients.Estimate
%     fittedLinearModel.Rsquared.Ordinary
%     errorbar(ground_truth,correction'.*mean(g_max_x.d_fwhm(:,range),2),correction'.*std(g_mean_x.d_fwhm(:,range),[],2),option);
    errorbar(ground_truth,correction'.*mean(g_max_x.d_e2(:,range),2),correction'.*std(g_max_x.d_e2(:,range),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
    CoV(n,CoV_ind) = mean(std(g_max_x.d_e2(:,range),[],2)./mean(g_max_x.d_e2(:,range),2));
    CoV_std(n,CoV_ind) = std(std(g_max_x.d_e2(:,range),[],2)./mean(g_max_x.d_e2(:,range),2));
    R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
    RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
    Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
end
CoV_names{CoV_ind} = 'G Max e2';
CoV_ind = CoV_ind + 1;

plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
axis square
xlabel('Ground Truth Diameter (\mum)');
ylabel('Modeled Diameter (\mum)');
axis square
xlim([plot_range]);
ylim([plot_range]);
format_font();
xticks(0:20:100); yticks(0:20:100); set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'scatter_model_a.pdf'), 'ContentType','vector','BackgroundColor','white'); end

figure; hold on;
%comparing type across phases
disp('Mean FWHM')
for n = 1:3
    if n == 1
        range = baseline;
        name = 'peak';
        option = 'bo';
        option2 = 'b';
    elseif n == 2
        range = peak;
        name = 'peak';
        option = 'go';
        option2 = 'g';
    else
        range = post;
        name = 'post';
        option = 'ro';
        option2 = 'r';
    end
    x = plot_range(1):plot_range(2);
    fittedLinearModel = fitlm(ground_truth, correction'.*mean(g_mean_x.d_fwhm(:,range),2),  'y ~ x1 - 1');
    plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
    t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
    t.Color = option2;
%     fittedLinearModel.Coefficients.Estimate
%     fittedLinearModel.Rsquared
    
    errorbar(ground_truth,correction'.*mean(g_mean_x.d_fwhm(:,range),2),correction'.*std(g_mean_x.d_fwhm(:,range),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
%     errorbar(ground_truth,correction'.*mean(g_mean_x.d_e2(:,range),2),correction'.*std(g_mean_x.d_e2(:,range),[],2),option);
    CoV(n,CoV_ind) = mean(std(g_mean_x.d_fwhm(:,range),[],2)./mean(g_mean_x.d_fwhm(:,range),2));
    CoV_std(n,CoV_ind) = std(std(g_mean_x.d_fwhm(:,range),[],2)./mean(g_mean_x.d_fwhm(:,range),2));
    R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
    RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
    Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
end
CoV_names{CoV_ind} = 'G Mean FWHM';
CoV_ind = CoV_ind + 1;

plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
title('Mean Projection - FWHM Diameter');
xlabel('Ground Truth Diameter (\mum)');
ylabel('Modeled Diameter (\mum)');
axis square
xlim([plot_range]);
ylim([plot_range]);
format_font();

figure; hold on;
%comparing type across phases
disp('Mean e2')
for n = 1:3
    if n == 1
        range = baseline;
        name = 'peak';
        option = 'bo';
        option2 = 'b';
    elseif n == 2
        range = peak;
        name = 'peak';
        option = 'go';
        option2 = 'g';
    else
        range = post;
        name = 'post';
        option = 'ro';
        option2 = 'r';
    end
    x = plot_range(1):plot_range(2);
    fittedLinearModel = fitlm(ground_truth, correction'.*mean(g_mean_x.d_e2(:,range),2),  'y ~ x1 - 1');
    plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
    t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
    t.Color = option2;
%     fittedLinearModel.Coefficients.Estimate
%     fittedLinearModel.Rsquared
    
%     errorbar(ground_truth,correction'.*mean(g_max_x.d_fwhm(:,range),2),correction'.*std(g_mean_x.d_fwhm(:,range),[],2),option);
    errorbar(ground_truth,correction'.*mean(g_mean_x.d_e2(:,range),2),correction'.*std(g_mean_x.d_e2(:,range),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
    CoV(n,CoV_ind) = mean(std(g_mean_x.d_e2(:,range),[],2)./mean(g_mean_x.d_e2(:,range),2));
    CoV_std(n,CoV_ind) = std(std(g_mean_x.d_e2(:,range),[],2)./mean(g_mean_x.d_e2(:,range),2));
    R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
    RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
    Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
end
CoV_names{CoV_ind} = 'G Mean e2';
CoV_ind = CoV_ind + 1;

plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
xlabel('Ground Truth Diameter (\mum)');
ylabel('Modeled Diameter (\mum)');
axis square
xlim([plot_range]);
ylim([plot_range]);
format_font();
xticks(0:20:100); yticks(0:20:100); set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'scatter_model_d.pdf'), 'ContentType','vector','BackgroundColor','white'); end
%% comparing type across phases - Generalized Gaussian Model
plot_range = [0 100];
figure; hold on;
%
disp('Max FWHM')
for n = 1:3
    if n == 1
        range = baseline;
        name = 'peak';
        option = 'bo';
        option2 = 'b';
    elseif n == 2
        range = peak;
        name = 'peak';
        option = 'go';
        option2 = 'g';
    else
        range = post;
        name = 'post';
        option = 'ro';
        option2 = 'r';
    end
    x = plot_range(1):plot_range(2);
    fittedLinearModel = fitlm(ground_truth, correction'.*mean(gg_max_x.d_fwhm(:,range),2),  'y ~ x1 - 1');
    plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
    t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
    t.Color = option2;
%     fittedLinearModel.Coefficients.Estimate
%     fittedLinearModel.Rsquared
    
    errorbar(ground_truth,correction'.*mean(gg_max_x.d_fwhm(:,range),2),correction'.*std(gg_max_x.d_fwhm(:,range),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
%     errorbar(ground_truth,correction'.*mean(gg_mean_x.d_e2(:,range),2),correction'.*std(gg_mean_x.d_e2(:,range),[],2),option);
    CoV(n,CoV_ind) = mean(std(gg_max_x.d_fwhm(:,range),[],2)./mean(gg_max_x.d_fwhm(:,range),2));
    CoV_std(n,CoV_ind) = std(std(gg_max_x.d_fwhm(:,range),[],2)./mean(gg_max_x.d_fwhm(:,range),2));
    R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
    RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
    Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
end
CoV_names{CoV_ind} = 'GG Max FWHM';
CoV_ind = CoV_ind + 1;

plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
xlabel('Ground Truth Diameter (\mum)');
axis square
xlim([plot_range]);
ylim([plot_range]);
format_font();
ylabel('Modeled Diameter (\mum)','Color','w');   % reserve width to match panels a,d; hidden on white bg
xticks(0:20:100); yticks(0:20:100); set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'scatter_model_b.pdf'), 'ContentType','vector','BackgroundColor','white'); end


figure; hold on;
%comparing type across phases
disp('Max e2')
for n = 1:3
    if n == 1
        range = baseline;
        name = 'peak';
        option = 'bo';
        option2 = 'b';
    elseif n == 2
        range = peak;
        name = 'peak';
        option = 'go';
        option2 = 'g';
    else
        range = post;
        name = 'post';
        option = 'ro';
        option2 = 'r';
    end
    x = plot_range(1):plot_range(2);
    fittedLinearModel = fitlm(ground_truth, correction'.*mean(gg_max_x.d_e2(:,range),2),  'y ~ x1 - 1');
    plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
    t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
    t.Color = option2;
%     fittedLinearModel.Coefficients.Estimate
%     fittedLinearModel.Rsquared
%     errorbar(ground_truth,correction'.*mean(gg_max_x.d_fwhm(:,range),2),correction'.*std(gg_mean_x.d_fwhm(:,range),[],2),option);
    errorbar(ground_truth,correction'.*mean(gg_max_x.d_e2(:,range),2),correction'.*std(gg_max_x.d_e2(:,range),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
    CoV(n,CoV_ind) = mean(std(gg_max_x.d_e2(:,range),[],2)./mean(gg_max_x.d_e2(:,range),2));
    CoV_std(n,CoV_ind) = std(std(gg_max_x.d_e2(:,range),[],2)./mean(gg_max_x.d_e2(:,range),2));
    R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
    RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
    Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
end
CoV_names{CoV_ind} = 'GG Max e2';
CoV_ind = CoV_ind + 1;

plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
axis square
xlabel('Ground Truth Diameter (\mum)');
axis square
xlim([plot_range]);
ylim([plot_range]);
format_font();
ylabel('Modeled Diameter (\mum)','Color','w');   % reserve width to match panels a,d; hidden on white bg
xticks(0:20:100); yticks(0:20:100); set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'scatter_model_c.pdf'), 'ContentType','vector','BackgroundColor','white'); end

figure; hold on;
%comparing type across phases
disp('Mean FWHM')
for n = 1:3
    if n == 1
        range = baseline;
        name = 'peak';
        option = 'bo';
        option2 = 'b';
    elseif n == 2
        range = peak;
        name = 'peak';
        option = 'go';
        option2 = 'g';
    else
        range = post;
        name = 'post';
        option = 'ro';
        option2 = 'r';
    end
    x = plot_range(1):plot_range(2);
    fittedLinearModel = fitlm(ground_truth, correction'.*mean(gg_mean_x.d_fwhm(:,range),2),  'y ~ x1 - 1');
    plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
    t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
    t.Color = option2;
%     fittedLinearModel.Coefficients.Estimate
%     fittedLinearModel.Rsquared
    
    errorbar(ground_truth,correction'.*mean(gg_mean_x.d_fwhm(:,range),2),correction'.*std(gg_mean_x.d_fwhm(:,range),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
%     errorbar(ground_truth,correction'.*mean(gg_mean_x.d_e2(:,range),2),correction'.*std(gg_mean_x.d_e2(:,range),[],2),option);
    CoV(n,CoV_ind) = mean(std(gg_mean_x.d_fwhm(:,range),[],2)./mean(gg_mean_x.d_fwhm(:,range),2));
    CoV_std(n,CoV_ind) = std(std(gg_mean_x.d_fwhm(:,range),[],2)./mean(gg_mean_x.d_fwhm(:,range),2));
    R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
    RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
    Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
end
CoV_names{CoV_ind} = 'GG Mean FWHM';
CoV_ind = CoV_ind + 1;

plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
xlabel('Ground Truth Diameter (\mum)');
axis square
xlim([plot_range]);
ylim([plot_range]);
format_font();
ylabel('Modeled Diameter (\mum)','Color','w');   % reserve width to match panels a,d; hidden on white bg
xticks(0:20:100); yticks(0:20:100); set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'scatter_model_e.pdf'), 'ContentType','vector','BackgroundColor','white'); end

figure; hold on;
%comparing type across phases
disp('Mean e2')
for n = 1:3
    if n == 1
        range = baseline;
        name = 'peak';
        option = 'bo';
        option2 = 'b';
    elseif n == 2
        range = peak;
        name = 'peak';
        option = 'go';
        option2 = 'g';
    else
        range = post;
        name = 'post';
        option = 'ro';
        option2 = 'r';
    end
    x = plot_range(1):plot_range(2);
    fittedLinearModel = fitlm(ground_truth, correction'.*mean(gg_mean_x.d_e2(:,range),2),  'y ~ x1 - 1');
    plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
    t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
    t.Color = option2;
%     fittedLinearModel.Coefficients.Estimate
%     fittedLinearModel.Rsquared
    
%     errorbar(ground_truth,correction'.*mean(gg_max_x.d_fwhm(:,range),2),correction'.*std(gg_mean_x.d_fwhm(:,range),[],2),option);
    errorbar(ground_truth,correction'.*mean(gg_mean_x.d_e2(:,range),2),correction'.*std(gg_mean_x.d_e2(:,range),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
    CoV(n,CoV_ind) = mean(std(gg_mean_x.d_e2(:,range),[],2)./mean(gg_mean_x.d_e2(:,range),2));
    CoV_std(n,CoV_ind) = std(std(gg_mean_x.d_e2(:,range),[],2)./mean(gg_mean_x.d_e2(:,range),2));
    R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
    RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
    Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
end
CoV_names{CoV_ind} = 'GG Mean e2';
CoV_ind = CoV_ind + 1;

plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
xlabel('Ground Truth Diameter (\mum)');
axis square
xlim([plot_range]);
ylim([plot_range]);
format_font();
ylabel('Modeled Diameter (\mum)','Color','w');   % reserve width to match panels a,d; hidden on white bg
xticks(0:20:100); yticks(0:20:100); set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'scatter_model_f.pdf'), 'ContentType','vector','BackgroundColor','white'); end
%% Thresholding-Based
letters = {'a','b','c','d','e'};
for th = 1:length(bw_mean.thresh)
    figure; hold on;
    %comparing type across phases
    disp('Max bw')
    for n = 1:3
        if n == 1
            range = baseline;
            name = 'peak';
            option = 'bo';
            option2 = 'b';
            option3 = [0, 0.45, 0.74];
        elseif n == 2
            range = peak;
            name = 'peak';
            option = 'go';
            option2 = 'g';
            option3 = [.47, .67, .19];
        else
            range = post;
            name = 'post';
            option = 'ro';
            option2 = 'r';
            option3 = [.85, .33, .1];
        end
        x = plot_range(1):plot_range(2);
        fittedLinearModel = fitlm(ground_truth, correction'.*mean(bw_max.diameter(:,range,th),2),  'y ~ x1 - 1');
        plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
        t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
        t.Color = option2;
    %     fittedLinearModel.Coefficients.Estimate
    %     fittedLinearModel.Rsquared

    %     errorbar(ground_truth,correction'.*mean(gg_max_x.d_fwhm(:,range),2),correction'.*std(gg_mean_x.d_fwhm(:,range),[],2),option);
        errorbar(ground_truth,correction'.*mean(bw_max.diameter(:,range,th),2),correction'.*std(bw_max.diameter(:,range,th),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
        CoV(n,CoV_ind) = mean(std(bw_max.diameter(:,range,th),[],2)./mean(bw_max.diameter(:,range,th),2));
        CoV_std(n,CoV_ind) = std(std(bw_max.diameter(:,range,th),[],2)./mean(bw_max.diameter(:,range,th),2));
        R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
        RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
        Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
    end
    CoV_names{CoV_ind} = 'BW Max';
    CoV_ind = CoV_ind + 1;

    plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
    xlabel('Ground Truth Diameter (\mum)');
    yl_=ylabel('Measured Diameter (\mum)'); if th>1, set(yl_,'Color','w'); end   % visible only on panel a
    axis square
    xlim([plot_range]);
    ylim([plot_range]);
    format_font();
    xticks(0:20:100); yticks(0:20:100); set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal');
    if save_figs; exportgraphics(gcf, fullfile(out_dir, ['scatter_bw_mip_' letters{th} '.pdf']), 'ContentType','vector','BackgroundColor','white'); end
    
    figure; hold on;
    %comparing type across phases
    disp('Mean bw')
    for n = 1:3
        if n == 1
            range = baseline;
            name = 'peak';
            option = 'bo';
            option2 = 'b';
        elseif n == 2
            range = peak;
            name = 'peak';
            option = 'go';
            option2 = 'g';
        else
            range = post;
            name = 'post';
            option = 'ro';
            option2 = 'r';
        end
        x = plot_range(1):plot_range(2);
        fittedLinearModel = fitlm(ground_truth, correction'.*mean(bw_mean.diameter(:,range,th),2),  'y ~ x1 - 1');
        plot( x , fittedLinearModel.Coefficients.Estimate*x,option2)
        t = text(5,103 - 6*n,['m = ', num2str(fittedLinearModel.Coefficients.Estimate,'%.3f'), ', R^2 = ', num2str(fittedLinearModel.Rsquared.Ordinary,'%.3f')]);
        t.Color = option2;
    %     fittedLinearModel.Coefficients.Estimate
    %     fittedLinearModel.Rsquared

    %     errorbar(ground_truth,correction'.*mean(gg_max_x.d_fwhm(:,range),2),correction'.*std(gg_mean_x.d_fwhm(:,range),[],2),option);
        errorbar(ground_truth,correction'.*mean(bw_mean.diameter(:,range,th),2),correction'.*std(bw_mean.diameter(:,range,th),[],2),option,'MarkerSize',15,'LineWidth',1.5,'CapSize',15);
        CoV(n,CoV_ind) = mean(std(bw_mean.diameter(:,range,th),[],2)./mean(bw_mean.diameter(:,range,th),2));
        CoV_std(n,CoV_ind) = std(std(bw_mean.diameter(:,range,th),[],2)./mean(bw_mean.diameter(:,range,th),2));
        R2(n,CoV_ind) = fittedLinearModel.Rsquared.Ordinary;
        RMSE(n,CoV_ind) = fittedLinearModel.RMSE;
        Slope(n,CoV_ind) = fittedLinearModel.Coefficients.Estimate;
    end
    CoV_names{CoV_ind} = 'BW Mean';
    CoV_ind = CoV_ind + 1;
    
    plot(plot_range(1):plot_range(2),plot_range(1):plot_range(2),'k','LineWidth',4);
    xlabel('Ground Truth Diameter (\mum)');
    yl_=ylabel('Measured Diameter (\mum)'); if th>1, set(yl_,'Color','w'); end   % visible only on panel a
    axis square
    xlim([plot_range]);
    ylim([plot_range]);
    format_font();
    xticks(0:20:100); yticks(0:20:100); set(gca,'FontSize',28,'FontWeight','bold'); set([get(gca,'XLabel');get(gca,'YLabel')],'FontSize',38,'FontWeight','bold'); set(findobj(gca,'Type','text'),'FontSize',26,'FontWeight','normal');
    if save_figs; exportgraphics(gcf, fullfile(out_dir, ['scatter_bw_meip_' letters{th} '.pdf']), 'ContentType','vector','BackgroundColor','white'); end
end
%% Plot R2 and errors
x = [7:9 1:5];
x2 = [];
for n = 1:length(x)
    off = .22;
    x2 = [x2, x(n) - off, x(n), x(n) + off];
end

inds = [2, 5, 6, 9, 11, 13, 15, 17]; %max
figure; 
b = bar(x, R2(:,inds)','FaceColor','Flat');
b(2).CData = [.47, .67, .19];
b(3).CData = [.85, .33, .1];
b(1).CData = [0, 0, 1];
b(2).CData = [0, 1, 0];
b(3).CData = [1, 0, 0];
set(gcf,'Position',[100 100 650 420])
ylabel('R^2');
xticklabels({'BW-1', 'BW-2', 'BW-3', 'BW-4', 'BW-5', 'G-e2', 'GG-HM', 'GG-e2'});
ylim([0 1]);
format_font();
yticks(0:0.2:1); ax = gca; set(ax,'FontSize',12,'FontWeight','bold'); set(get(ax,'YLabel'),'FontSize',16,'FontWeight','bold','Color','k');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'cov_r2_c.pdf'), 'ContentType','vector','BackgroundColor','white'); end
% figure; bar(x, RMSE(:,inds)');
figure; 
b = bar(x, CoV(:,inds)','FaceColor','Flat');
b(2).CData = [.47, .67, .19];
b(3).CData = [.85, .33, .1];
b(1).CData = [0, 0, 1];
b(2).CData = [0, 1, 0];
b(3).CData = [1, 0, 0];
set(gcf,'Position',[100 100 650 420])
hold on; errorbar(x2, reshape(CoV(:,inds),[],1)', reshape(CoV_std(:,inds),[],1)','k.');
ylabel('CoV');
legend({'Pre-Contrast', 'Peak-Contrast', 'Post-Contrast'});
xticklabels({'BW-1', 'BW-2', 'BW-3', 'BW-4', 'BW-5', 'G-e2', 'GG-HM', 'GG-e2'});
ylim([0 .8]);
format_font();
yticks(0:0.2:0.8); ax = gca; set(ax,'FontSize',12,'FontWeight','bold'); set(get(ax,'YLabel'),'FontSize',16,'FontWeight','bold','Color','k'); set(findobj(gcf,'Type','legend'),'FontSize',11,'FontWeight','bold','Location','northeast');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'cov_r2_a.pdf'), 'ContentType','vector','BackgroundColor','white'); end

inds = [4, 7, 8, 10, 12, 14, 16, 18]; %mean
figure; b = bar(x, R2(:,inds)','FaceColor','Flat');
b(2).CData = [.47, .67, .19];
b(3).CData = [.85, .33, .1];
b(1).CData = [0, 0, 1];
b(2).CData = [0, 1, 0];
b(3).CData = [1, 0, 0];
set(gcf,'Position',[100 100 650 420])
ylabel('R^2');
xticklabels({'BW-1', 'BW-2', 'BW-3', 'BW-4', 'BW-5', 'G-e2', 'GG-HM', 'GG-e2'});
ylim([0 1]);
format_font();
yticks(0:0.2:1); ax = gca; set(ax,'FontSize',12,'FontWeight','bold'); set(get(ax,'YLabel'),'FontSize',16,'FontWeight','bold','Color','w');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'cov_r2_d.pdf'), 'ContentType','vector','BackgroundColor','white'); end
% figure; bar(x, RMSE(:,inds)');
figure; 
b = bar(x, CoV(:,inds)','FaceColor','Flat');
b(2).CData = [.47, .67, .19];
b(3).CData = [.85, .33, .1];
b(1).CData = [0, 0, 1];
b(2).CData = [0, 1, 0];
b(3).CData = [1, 0, 0];
set(gcf,'Position',[100 100 650 420])
hold on; errorbar(x2, reshape(CoV(:,inds),[],1)', reshape(CoV_std(:,inds),[],1)','k.');
ylabel('CoV');
xticklabels({'BW-1', 'BW-2', 'BW-3', 'BW-4', 'BW-5', 'G-e2', 'GG-HM', 'GG-e2'});
ylim([0 .8]);
format_font();
yticks(0:0.2:0.8); ax = gca; set(ax,'FontSize',12,'FontWeight','bold'); set(get(ax,'YLabel'),'FontSize',16,'FontWeight','bold','Color','w');
if save_figs; exportgraphics(gcf, fullfile(out_dir,'cov_r2_b.pdf'), 'ContentType','vector','BackgroundColor','white'); end

%% ======================================================================
%  Table 1 (accuracy / linearity) for the manuscript -> tables/accuracy_table.xlsx
%  Reproduces results.tex \label{tab:accuracy_linearity}: slope m, R^2 and CoV
%  for each method (BW-1..5, w_{1/e2,G}, FWHM_GG, w_{1/e2,GG}) x projection
%  (MIP = max, MeIP = mean) across Pre / Peak / Post contrast phases.
%  Column -> CoV_ind map (MIP,MeIP): BW1 (9,10) BW2 (11,12) BW3 (13,14)
%  BW4 (15,16) BW5 (17,18) G-e2 (2,4) FWHM-GG (5,7) GG-e2 (6,8).
%  Convert to the LaTeX table with:  python tables\accuracy_to_tex.py
% ======================================================================
tbl_dir  = 'C:\Users\BM-Optik01\ownCloud\Vessel Underestimation\tables';
col_inds = [9 10 11 12 13 14 15 16 17 18 2 4 5 7 6 8];   % table column order -> CoV_ind
colnames = {'BW1_MIP','BW1_MeIP','BW2_MIP','BW2_MeIP','BW3_MIP','BW3_MeIP', ...
            'BW4_MIP','BW4_MeIP','BW5_MIP','BW5_MeIP','G_MIP','G_MeIP', ...
            'FWHMGG_MIP','FWHMGG_MeIP','GGe2_MIP','GGe2_MeIP'};
phase_names  = {'Pre','Peak','Post'};
metric_names = {'Slope','R2','CoV'};
metric_src   = {Slope, R2, CoV};   % each is 3 (phase) x 18 (CoV_ind)

Metric = strings(0,1); Phase = strings(0,1); Mvals = [];
for mi = 1:numel(metric_src)
    src = metric_src{mi};
    for ph = 1:3
        Metric(end+1,1) = metric_names{mi};
        Phase(end+1,1)  = phase_names{ph};
        Mvals(end+1,:)  = src(ph, col_inds);
    end
end
accuracy_table = [table(Metric, Phase), array2table(Mvals, 'VariableNames', colnames)];

disp('=== Table 1 (accuracy/linearity): Slope, R^2, CoV by phase ===');
disp(accuracy_table);

if save_tables
    if ~exist(tbl_dir,'dir'); mkdir(tbl_dir); end
    writetable(accuracy_table, fullfile(tbl_dir,'accuracy_table.xlsx'));
    writetable(accuracy_table, fullfile(tbl_dir,'accuracy_table.csv'));
    save(fullfile(tbl_dir,'accuracy_table.mat'), 'accuracy_table');
    fprintf('Saved accuracy Table 1 to %s\n', fullfile(tbl_dir,'accuracy_table.xlsx'));
end

%% Mean intensity projections
% % % fits = {g_mean_x, gg_mean_x, g_max_x, gg_max_x};
% % % fit_names = {'G mean', 'GG mean', 'G max', 'GG max'};
% % % fit_models = {ft_g, ft_gg, ft_g, ft_gg};
% % % range = {baseline, peak, post};
% % % range_names = {'Baseline','Peak','Post'};
% % % line1 = {'b','g','r'};
% % % line2 = {'b--','g--','r--'};
% % % for f = 1:numel(fits)
% % %     for n = 1:size(vessel,2)
% % %         figure; hold on;
% % %         for r = 1:numel(range)
% % %         %     figure; imagesc(squeeze(max(vessel{n},[],1)));
% % %         %     figure; imagesc(squeeze(mean(vessel{n},1)));
% % %         %     figure; plot(squeeze(mean(mean(vessel{n}(:,:,baseline),1),3)),'b');
% % %         %     hold on; plot(squeeze(mean(mean(vessel{n}(:,:,post),1),3)),'g');
% % %         %     plot(squeeze(mean(mean(vessel{n}(:,:,peak),1),3)),'r');
% % %         %     
% % %             fdata = fits{f};
% % %             sground_truth(n) = ground_truth(n)./correction(n);
% % %             x = fdata.x{n};
% % %             temp = 0;
% % %             count = 0;
% % %             off = 0;
% % %             center = 0;
% % % %             figure; hold on;
% % %             for m = range{r}
% % %                 y_scale = fdata.scale(n,m);
% % %                 count = count + 1;
% % %                 cf = fdata.cf{n,m};
% % %                 if mod(f,2)
% % %                     temp = temp + feval(fit_models{f}, y_scale.*cf.A, cf.mu, cf.sigma, y_scale.*cf.C, x);
% % %                 else
% % %                     temp = temp + feval(fit_models{f}, y_scale.*cf.A, cf.mu, cf.alpha, cf.beta, y_scale.*cf.C, x);
% % %                 end
% % %                 off = off + y_scale.*cf.C;
% % %                 center = center + cf.mu;
% % %             end
% % %             center = center./count;
% % % %             plot([center - sground_truth(n)/2, center - sground_truth(n)/2], [0 1],'k');
% % % %             plot([center + sground_truth(n)/2, center + sground_truth(n)/2], [0 1],'k');
% % %             temp = temp - off;
% % %             scale = max(temp);
% % %             temp = temp./scale;
% % %             plot(x,temp,line1{r});
% % % 
% % %         %     figure;
% % %             temp = count.*squeeze(mean(mean(vessel{n}(:,:,range{r}),1),3));
% % % %             plot(x,temp,line2{r});
% % %             temp = temp - off;
% % %             temp = temp./(scale);
% % %             plot(x,temp,line2{r});
% % % 
% % %             xlim([min(x), max(x)]);
% % % %             plot(x,temp,line2{r});
% % %             xlabel('Lateral Position (\mum)');
% % %             ylabel('Angiogram Signal (AU)');
% % %             title(fit_names{f});
% % %             format_font();
% % %         end
% % %     end
% % % end
%% Mean Intensity Angiogram Projection
% % % for n = 1:size(vessel,2)
% % % %     figure; imagesc(squeeze(max(vessel{n},[],1)));
% % % %     figure; imagesc(squeeze(mean(vessel{n},1)));
% % % %     figure; plot(squeeze(mean(mean(vessel{n}(:,:,baseline),1),3)),'b');
% % % %     hold on; plot(squeeze(mean(mean(vessel{n}(:,:,post),1),3)),'g');
% % % %     plot(squeeze(mean(mean(vessel{n}(:,:,peak),1),3)),'r');
% % % %     
% % %     x = gg_mean_x.x{n};
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     for m = baseline
% % %         y_scale = gg_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = gg_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_gg, y_scale.*cf.A, cf.mu, cf.alpha, cf.beta, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %     end
% % % 
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % %     figure; hold on;
% % %     plot(x,temp,'b');
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,baseline),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % %     plot(x,temp,'b--');
% % % 
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     center = 0;
% % %     for m = peak
% % %         y_scale = gg_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = gg_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_gg, y_scale.*cf.A, cf.mu, cf.alpha, cf.beta, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %     end
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % % %     figure; hold on;
% % %     plot(x,temp,'g');
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,peak),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % %     plot(x,temp,'g--');
% % % 
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     for m = post
% % %         y_scale = gg_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = gg_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_gg, y_scale.*cf.A, cf.mu, cf.alpha, cf.beta, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %     end
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % % %     figure; hold on;
% % %     plot(x,temp,'r');
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,post),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % % 
% % %     xlim([min(x), max(x)]);
% % %     plot(x,temp,'r--');
% % %     xlabel('Lateral Position (\mum)');
% % %     ylabel('Angiogram Signal (AU)');
% % %     title('Mean Intensity Angiogram Projection');
% % %     format_font();
% % % end
%% Mean Intensity Angiogram Projection Scaled
% % % for n = 1:size(vessel,2)
% % % %     figure; imagesc(squeeze(max(vessel{n},[],1)));
% % % %     figure; imagesc(squeeze(mean(vessel{n},1)));
% % % %     figure; plot(squeeze(mean(mean(vessel{n}(:,:,baseline),1),3)),'b');
% % % %     hold on; plot(squeeze(mean(mean(vessel{n}(:,:,post),1),3)),'g');
% % % %     plot(squeeze(mean(mean(vessel{n}(:,:,peak),1),3)),'r');
% % % %     
% % %     sground_truth(n) = ground_truth(n)./correction(n);
% % %     x = g_mean_x.x{n};
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     center = 0;
% % %     figure; hold on;
% % %     for m = baseline
% % %         y_scale = g_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = g_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_g, y_scale.*cf.A, cf.mu, cf.sigma, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %         center = center + cf.mu;
% % %     end
% % %     center = center./count;
% % % %     plot([center - sground_truth(n)/2, center - sground_truth(n)/2], [0 1],'b');
% % % %     plot([center + sground_truth(n)/2, center + sground_truth(n)/2], [0 1],'b');
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % %     plot(x,temp,'b','LineWidth',2);
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,baseline),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % %     plot(x,temp,'b--','LineWidth',2);
% % % 
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     center = 0;
% % % %     figure; hold on;
% % %     for m = peak
% % %         y_scale = g_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = g_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_g, y_scale.*cf.A, cf.mu, cf.sigma, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %         center = center + cf.mu;
% % %     end
% % %     center = center./count;
% % % %     plot([center - sground_truth(n)/2, center - sground_truth(n)/2], [0 1],'g');
% % % %     plot([center + sground_truth(n)/2, center + sground_truth(n)/2], [0 1],'g');
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % % %     figure; hold on;
% % %     plot(x,temp,'g','LineWidth',2);
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,peak),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % %     plot(x,temp,'g--','LineWidth',2);
% % % 
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     center = 0;
% % % %     figure; hold on;
% % %     for m = post
% % %         y_scale = g_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = g_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_g, y_scale.*cf.A, cf.mu, cf.sigma, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %         center = center + cf.mu;
% % %     end
% % %     center = center./count;
% % % %     plot([center - sground_truth(n)/2, center - sground_truth(n)/2], [0 1],'r');
% % % %     plot([center + sground_truth(n)/2, center + sground_truth(n)/2], [0 1],'r');
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % % %     figure; hold on;
% % %     plot(x,temp,'r','LineWidth',2);
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,post),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % % 
% % %     xlim([min(x), max(x)]);
% % %     plot(x,temp,'r--','LineWidth',2);
% % %     xlabel('Lateral Position (\mum)');
% % %     ylabel('Angiogram Signal (AU)');
% % %     title('Mean Intensity Angiogram Projection');
% % %     format_font();
% % % end
%% Max Intensity Angiogram Projection Scaled
% % % for n = 1%:size(vessel,2)
% % % %     figure; imagesc(squeeze(max(vessel{n},[],1)));
% % % %     figure; imagesc(squeeze(mean(vessel{n},1)));
% % % %     figure; plot(squeeze(mean(mean(vessel{n}(:,:,baseline),1),3)),'b');
% % % %     hold on; plot(squeeze(mean(mean(vessel{n}(:,:,post),1),3)),'g');
% % % %     plot(squeeze(mean(mean(vessel{n}(:,:,peak),1),3)),'r');
% % % %     
% % %     sground_truth(n) = ground_truth(n)./correction(n);
% % %     x = g_max_x.x{n};
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     center = 0;
% % %     figure; hold on;
% % %     for m = baseline
% % %         y_scale = g_max_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = g_max_x.cf{n,m};
% % %         temp = temp + feval(ft_g, y_scale.*cf.A, cf.mu, cf.sigma, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %         center = center + cf.mu;
% % %     end
% % %     center = center./count;
% % % %     plot([center - sground_truth(n)/2, center - sground_truth(n)/2], [0 1],'b');
% % % %     plot([center + sground_truth(n)/2, center + sground_truth(n)/2], [0 1],'b');
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % %     plot(x,temp,'b','LineWidth',2);
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(max(vessel{n}(:,:,baseline),[],1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % %     plot(x,temp,'b--','LineWidth',2);
% % % 
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     center = 0;
% % % %     figure; hold on;
% % %     for m = peak
% % %         y_scale = g_max_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = g_max_x.cf{n,m};
% % %         temp = temp + feval(ft_g, y_scale.*cf.A, cf.mu, cf.sigma, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %         center = center + cf.mu;
% % %     end
% % %     center = center./count;
% % % %     plot([center - sground_truth(n)/2, center - sground_truth(n)/2], [0 1],'g');
% % % %     plot([center + sground_truth(n)/2, center + sground_truth(n)/2], [0 1],'g');
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % % %     figure; hold on;
% % %     plot(x,temp,'g','LineWidth',2);
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(max(vessel{n}(:,:,peak),[],1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % %     plot(x,temp,'g--','LineWidth',2);
% % % 
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     center = 0;
% % % %     figure; hold on;
% % %     for m = post
% % %         y_scale = g_max_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = g_max_x.cf{n,m};
% % %         temp = temp + feval(ft_g, y_scale.*cf.A, cf.mu, cf.sigma, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %         center = center + cf.mu;
% % %     end
% % %     center = center./count;
% % % %     plot([center - sground_truth(n)/2, center - sground_truth(n)/2], [0 1],'r');
% % % %     plot([center + sground_truth(n)/2, center + sground_truth(n)/2], [0 1],'r');
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % % %     figure; hold on;
% % %     plot(x,temp,'r','LineWidth',2);
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(max(vessel{n}(:,:,post),[],1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % % 
% % %     xlim([min(x), max(x)]);
% % %     plot(x,temp,'r--','LineWidth',2);
% % %     xlabel('Lateral Position (\mum)');
% % %     ylabel('Angiogram Signal (AU)');
% % %     title('Max Intensity Angiogram Projection');
% % %     format_font();
% % % end
%%
% % % for n = 1:size(vessel,2)
% % % %     figure; imagesc(squeeze(max(vessel{n},[],1)));
% % % %     figure; imagesc(squeeze(mean(vessel{n},1)));
% % % %     figure; plot(squeeze(mean(mean(vessel{n}(:,:,baseline),1),3)),'b');
% % % %     hold on; plot(squeeze(mean(mean(vessel{n}(:,:,post),1),3)),'g');
% % % %     plot(squeeze(mean(mean(vessel{n}(:,:,peak),1),3)),'r');
% % % %     
% % %     x = gg_mean_x.x{n};
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     for m = baseline
% % %         y_scale = gg_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = gg_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_gg, y_scale.*cf.A, cf.mu, cf.alpha, cf.beta, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %     end
% % % 
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % %     figure; hold on;
% % %     plot(x,temp,'b');
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,baseline),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % %     plot(x,temp,'b--');
% % % 
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     center = 0;
% % %     for m = peak
% % %         y_scale = gg_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = gg_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_gg, y_scale.*cf.A, cf.mu, cf.alpha, cf.beta, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %     end
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % % %     figure; hold on;
% % %     plot(x,temp,'g');
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,peak),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % %     plot(x,temp,'g--');
% % % 
% % %     temp = 0;
% % %     count = 0;
% % %     off = 0;
% % %     for m = post
% % %         y_scale = gg_mean_x.scale(n,m);
% % %         count = count + 1;
% % %         cf = gg_mean_x.cf{n,m};
% % %         temp = temp + feval(ft_gg, y_scale.*cf.A, cf.mu, cf.alpha, cf.beta, y_scale.*cf.C, x);
% % %         off = off + y_scale.*cf.C;
% % %     end
% % %     temp = temp - off;
% % %     scale = max(temp);
% % %     temp = temp./scale;
% % % %     figure; hold on;
% % %     plot(x,temp,'r');
% % % 
% % % %     figure;
% % %     temp = count.*squeeze(mean(mean(vessel{n}(:,:,post),1),3));
% % % %     plot(x,temp,'b--');
% % %     temp = temp - off;
% % %     temp = temp./(scale);
% % % 
% % %     xlim([min(x), max(x)]);
% % %     plot(x,temp,'r--');
% % %     xlabel('Lateral Position (\mum)');
% % %     ylabel('Angiogram Signal (AU)');
% % %     title('Mean Intensity Angiogram Projection');
% % %     format_font();
