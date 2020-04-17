%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html
% 3. matlab - text
% https://ww2.mathworks.cn/help/matlab/ref/text.html

%% 说明
% 多个跟踪器在单一指标变量分析

%% 正文
clear;clc;close all;
% 添加tightfig
addpath('../');

saveFileName = 'single_bar_plot';
saveFileType = 'png'; % pdf/png

% 图窗
figure4D = figure(40);
set(figure4D,'position',[0 0 800 450]);

% 数据
y=[0.71526 0.45648;
    0.71595 0.45722;
    0.71597 0.45733;
    0.71539 0.45684;
    0.71618 0.45833;
    0.71735 0.45957;];
% 将各条形的宽度设置为各条形可用总空间的 80%。
prec = y(:,1);
succ = y(:,2);
index = succ; % prec/succ
barWidth = 0.6;
b=bar(index, barWidth);
% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线

fontSize = 12;
%设置x轴范围和刻度
% set(gca,'XLim',[1, 5]);%X轴的数据显示范围
set(gca,'XTick',[1:1:6]);%设置要显示坐标刻度
% set(gca,'XTickLabel',num2str(get(gca,'XTick')','%.2f'))
% set(gca,'TickLabelInterpreter','latex'); % 设置解析器为latex
% set(gca,'XTickLabel',{'KCC','TACF1','TACF2','TACF3','\textbf{TACF}'})
xLabelName1 = '\it{\Delta k}';
% Times 字体
xlabel(xLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

%设置y轴范围和刻度
set(gca,'YLim',[0.44, 0.465]);%X轴的数据显示范围
% set(gca,'YTick',[95:1:101]);%设置要显示坐标刻度
% set(gca,'YTickLabel',[95:1:101]);%给坐标加标签
yLabelName1 = 'Success Rate';
% Times 字体
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% 设置标签，及其位置
% legend('UAVDT','UAV123@10fps','Location','northwest');

% 手动文字添加文字标签
% 'HorizontalAlignment' - 相对于位置点水平对齐文本
% 'left' （默认） | 'center' | 'right'
verticalOffset = 0.001;
for i = 1 : size(y, 1)
    if i == size(y, 1)
        text(i, index(i) + verticalOffset, num2str(index(i),'%.3f'),...
            'fontname','Times New Roman','fontweight','bold','HorizontalAlignment','center');
    else
        text(i, index(i) + verticalOffset, num2str(index(i),'%.3f'),...
            'fontname','Times New Roman','HorizontalAlignment','center');
    end
end

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