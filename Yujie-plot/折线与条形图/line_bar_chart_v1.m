%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html

%% 说明
% 用于参数分析的折线图v2
% - 可以直接读入excel文件（TODO）

%% 正文
clear;clc;close all;
% 添加tightfig
addpath('../');

% saveFileName = 'horizontal_line_chart';
saveFileName = 'IRI_analysis';
saveFileType = 'png'; % pdf/png
% text_or_not = true; % true/false

%% 数据
% 手动输入
% 读取xlsx，TGRS-IBRI-MF.xlsx基本结构：
% frame	mu	lambda	gamma	Lrate	success	precision
C = readcell('./IRI0429.xls');
peakNum = 4;
start = 2; plot_length = 11; % 选择数量
frame = cell2mat(C(start:start+plot_length-1,1));
prec = cell2mat(C(start:start+plot_length-1,7));
succ = cell2mat(C(start:start+plot_length-1,6));

% 所选指标
x_param = frame;
y_param = succ; % prec/succ

% 最高点
% peak_prec = 8;
% peak_succ = 8;
% peak_vline_color = [217, 83, 25]/255;
baseline_color = [217, 83, 25]/255;

%% 正式画图
figureHCL = figure(301);
set(figureHCL,'position',[0 0 700 240]);
lineWidth = 2.5; % 画线的线粗
fontSize = 14;
tickFontSize = 12;
barWidth = 0.5;
h1=bar(x_param, y_param(1:end),barWidth,...
    'EdgeColor',[0.90,0.90,0.90],...
    'FaceColor',[0.90,0.90,0.90]); % 浅灰
    ...'EdgeColor',[0.99,0.70,0.90],...
    ...'FaceColor',[0.99,0.70,0.90]); % 浅蓝
    ...'EdgeColor',[0.99,0.97,0.60],...
    ...'FaceColor',[0.99,0.97,0.60]); % 浅黄
h1.FaceColor = 'flat';
% [0.89,0.76,0.70]; 浅红
h1.CData(peakNum,:) = [0.89,0.76,0.70]; 
hold on
% h1=plot(x_param, y_param(1:end), 'o-',...
%     'Color',[0,0.4,0.74],...
%     'LineWidth',lineWidth,...
%     'MarkerSize',8,...
%     'MarkerEdgeColor',[0,0.45,0.74]);
h2=plot(x_param, y_param(1:end), '-',...
     'Color',[0.93,0.49,0.18],...
    'LineWidth',lineWidth);
    

%设置x轴范围和刻度
set(gca,'XLim',[min(x_param)-0.5, max(x_param)+0.5]);%X轴的数据显示范围
% set(gca,'XTick',[1:plot_length]);%设置要显示坐标刻度
% set(gca,'XTickLabel',num2str(x_param,'%.2f'));
% set(gca,'TickLabelInterpreter','latex'); % 设置解析器为latex
% set(gca,'XTickLabel',{'KCC','TACF1','TACF2','TACF3','\textbf{TACF}'})
xLabelName1 = '\it{F}';

%设置y轴范围和刻度
if y_param == succ
    % succ [0.4511 0.4699] 0.475/0.465 0.491
    set(gca,'YLim',[0.430 0.480]);%X轴的数据显示范围
%     set(gca,'YTick',[0.475:0.005:0.490]);%设置要显示坐标刻度
    % set(gca,'YTickLabel',[95:1:101]);%给坐标加标签
    set(gca,'YTickLabel',num2str(get(gca,'YTick')','%.3f'))
    yLabelName1 = 'Success rate';
elseif y_param == prec
    % prec [0.7045 0.7377] 0.660/0.655 0.689
    set(gca,'YLim',[0.700 0.740]);%X轴的数据显示范围
    set(gca,'YTick',[0.690:0.01:0.750]);%设置要显示坐标刻度
    set(gca,'YTickLabel',num2str(get(gca,'YTick')','%.3f'))
    % set(gca,'YTickLabel',[95:1:101]);%给坐标加标签
    yLabelName1 = 'Precision';
end

% Times 字体
set(gca,'FontName','Times New Roman','fontSize',tickFontSize); % 设置坐标轴值字体
xlabel(xLabelName1,'fontsize',fontSize,'fontname','Times New Roman'); % 纵轴名称
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
% 默认无衬线字体
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体
% xlabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称


% 是否grid
set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线
set(gca,'box','on')

tightfig;

if y_param == succ
    saveFileName = [saveFileName '_succ'];
elseif y_param == prec
    saveFileName = [saveFileName '_prec'];
end

% 输出保存
switch saveFileType
    case 'pdf'
        saveas(gcf,[saveFileName '.pdf']); % pdf
    case 'png'
        saveas(gcf,saveFileName,'png'); % png
    otherwise
        disp('Type error !')
end