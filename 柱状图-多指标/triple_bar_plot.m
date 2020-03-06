%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html

%% TODO
% 三根柱子配色切换
% 0.01, 0.44, 0.75
% 0.88, 0.46, 0.40
% 0.04, 0.56, 0.64


%% 说明
% 多个跟踪器在一个指标（可切换）三个数据集的分析

%% 正文
clear;clc;close all;
% 添加tightfig
addpath('../');

% 数据，修改此处
metrix = 'prec'; % prec succ
saveFileName = 'triple_bar_plot_';
saveFileType = 'png'; % pdf/png

% 图窗
figure4D = figure(40);
set(figure4D,'position',[0 0 800 400]);

if metrix == 'prec'
    prec=[0.359 0.464 0.246;0.455 0.551 0.454; 0.539 0.599 0.552;];
    yRange = [0.20, 0.65];
    plotVariable = prec;
    yLabelName1 = 'Precision';
elseif metrix == 'succ'
    succ=[0.239 0.322 0.144;0.317 0.379 0.271; 0.384 0.413 0.352;];
    yRange = [0.10, 0.48];
    plotVariable = succ;
    yLabelName1 = 'Success rate';
end
% 将各条形的宽度设置为各条形可用总空间的 80%。
barWidth = 0.8;
bar(plotVariable, barWidth);

% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线

%设置x轴范围和刻度
% set(gca,'XLim',[1, 5]);%X轴的数据显示范围
% set(gca,'XTick',[0:1:10]);%设置要显示坐标刻度
set(gca,'TickLabelInterpreter','latex'); % 设置解析器为latex
% set(gca,'XTickLabel',{'ReCF-N','ReCF-RCA','ReCF-HRR','TACF3','\textbf{TACF}'})
set(gca,'XTickLabel',{'ReCF-N','ReCF-RCA','\textbf{ReCF-HRR}'})
% xlabel('')
%设置y轴范围和刻度
set(gca,'YLim',yRange);%X轴的数据显示范围
if metrix == 'prec'
    set(gca,'YTick',[0.20:0.1:0.65]);%设置要显示坐标刻度
    set(gca,'YTickLabel',{'20.0','30.0','40.0','50.0','60.0'});%给坐标加标签
elseif metrix == 'succ'
    set(gca,'YTick',[0.10:0.1:0.45]);%设置要显示坐标刻度
    set(gca,'YTickLabel',{'10.0','20.0','30.0','40.0'});%给坐标加标签
end
% 设置标签，及其位置
legend('UAV123@10fps','DTB70','UAVDT','Location','northwest');

fontSize = 12;
% Times 字体
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% 手动文字添加文字标签
verticalOffset = 0.015;
for i = 1 : size(plotVariable, 1)-1
    text(i - 0.35*barWidth, plotVariable(i,1) + verticalOffset, string(100*plotVariable(i,1)),'fontname','Times New Roman');
    text(i - 0.07*barWidth, plotVariable(i,2) + verticalOffset, string(100*plotVariable(i,2)),'fontname','Times New Roman');
    text(i + 0.21*barWidth, plotVariable(i,3) + verticalOffset, string(100*plotVariable(i,3)),'fontname','Times New Roman');
end
% 最后两行
i = size(plotVariable, 1);
text(i - 0.35*barWidth, plotVariable(i,1) + verticalOffset, string(100*plotVariable(i,1)),'fontname','Times New Roman','fontweight','bold');
text(i - 0.07*barWidth, plotVariable(i,2) + verticalOffset, string(100*plotVariable(i,2)),'fontname','Times New Roman','fontweight','bold');
text(i + 0.21*barWidth, plotVariable(i,3) + verticalOffset, string(100*plotVariable(i,3)),'fontname','Times New Roman','fontweight','bold');

tightfig;

% 输出保存
switch saveFileType
    case 'pdf'
        saveas(gcf,[saveFileName metrix '.pdf']); % pdf
    case 'png'
        saveas(gcf,[saveFileName metrix],'png'); % png
    otherwise
        disp('Type error !')
end