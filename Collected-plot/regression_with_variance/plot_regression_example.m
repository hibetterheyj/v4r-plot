%% Reference 参考
% 1. writematrix (2019a)
% https://ww2.mathworks.cn/help/matlab/ref/writematrix.html
% 2. writematrix (2019a)
% https://ww2.mathworks.cn/help/matlab/ref/writetable.html

%% Data preparation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   o X:         N x M array representing M datapoints of N dimensions.
%   o y_est:     P x M array representing the retrieved M datapoints of 
%                P dimensions, i.e. expected means.
%   o var_est:   P x P x M array representing the M expected covariance 
%                matrices retrieved. 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Code 代码
addpath('../');
clc;clear;close all;

saveFileName = 'regression_data_example';
saveFileType = 'png'; % pdf/png

% load the data
load('regression_data.mat');
% main function
plot_regression(X, y, y_true, y_est, var_est, '1D Linear Dataset');
% minimize unnecessary boundaries
tightfig;

% 输出保存
switch saveFileType
    case 'pdf'
        saveas(gcf,[saveFileName '.pdf']); % pdf
    case 'png'
        saveas(gcf,saveFileName,'png'); % png
    otherwise
        disp('Type error !')
end