function [] = plot_regression(X, y, y_true, y_est, var_est, figtitle)
%PLOT_REGRESSION Summary of this function goes here
%   Detailed explanation goes here
% with regression_data.mat
% plot_regression(X, y, y_true, y_est, var_est, '1D Linear Dataset');
%% Plot Ground Truth Datapoints
figure('Name', figtitle)
subplot(2,1,1)
options             = [];
options.points_size = 20;
options.labels      = zeros(size(X,1),1);
options.title       = 'Original data'; 
options.plot_figure = true;
ml_plot_data([X(:),y(:)],options); hold on;

% Plot True function
plot(X,y_true,'-k','LineWidth',2);
legend({'data','y = f(x)'}, 'Interpreter','latex')

%% Plot Datapoints
subplot(2,1,2)
options             = [];
options.points_size = 15;
options.plot_figure = true;
options.title       = 'Estimated y=f(x) from Gaussian Mixture Regression';
options.labels      = zeros(length(y_est),1);
ml_plot_data([X(:),y(:)],options); hold on;
title('Original data and true function')

% Plot True function 
plot(X,y_true,'-k','LineWidth',1); hold on;

% Plot Estimated function 
options             = [];
options.var_scale   = 2;
options.title       = 'Estimated y=f(x) from Gaussian Mixture Regression';
options.plot_figure = false;
ml_plot_gmr(X, y_est, var_est, options)
legend({'data','y = f(x)','$Var\{p(y|x)\}$','$+2\sigma\{p(y|x)\}$', ...
    '$-2\sigma\{p(y|x)\}$','$\hat{y} = E\{p(y|x)\}$' }, 'Interpreter','latex')
title('Estimated regression')
end

