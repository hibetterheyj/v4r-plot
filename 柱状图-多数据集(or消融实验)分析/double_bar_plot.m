%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html

%% 说明
% 多个跟踪器在一个指标两个数据集的分析

%% 正文
clear;clc;close all;
% 添加tightfig
addpath('../');

saveFileName = 'double_bar_plot';
saveFileType = 'png'; % pdf/png

% 图窗
figure4D = figure(40);
set(figure4D,'position',[0 0 800 450]);

% 数据
y=[0.389 0.374;0.432 0.421; 0.425 0.407; 0.423 0.398; 0.437 0.456;];
% 将各条形的宽度设置为各条形可用总空间的 80%。
barWidth = 0.8;
b=bar(y, barWidth);
% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线

%设置x轴范围和刻度
% set(gca,'XLim',[1, 5]);%X轴的数据显示范围
% set(gca,'XTick',[0:1:10]);%设置要显示坐标刻度
set(gca,'TickLabelInterpreter','latex'); % 设置解析器为latex
set(gca,'XTickLabel',{'KCC','TACF1','TACF2','TACF3','\textbf{TACF}'})
% xlabel('')
%设置y轴范围和刻度
set(gca,'YLim',[0.35, 0.48]);%X轴的数据显示范围
% set(gca,'YTick',[95:1:101]);%设置要显示坐标刻度
% set(gca,'YTickLabel',[95:1:101]);%给坐标加标签
yLabelName1 = 'Success Rate';
% 设置标签，及其位置
legend('UAVDT','UAV123@10fps','Location','northwest');

fontSize = 12;
% Times 字体
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% 手动文字添加文字标签
% 'HorizontalAlignment' - 相对于位置点水平对齐文本
% 'left' （默认） | 'center' | 'right'
verticalOffset = 0.0035;
for i = 1 : size(y, 1)
    % 原版
%     if i == size(y, 1)
%         text(i - 0.34*barWidth, y(i,1) + verticalOffset, string(y(i,1)),...
%             'fontname','Times New Roman','fontweight','bold');
%         text(i + 0.02*barWidth, y(i,2) + verticalOffset, string(y(i,2)),...
%             'fontname','Times New Roman','fontweight','bold');
%     else
%         text(i - 0.34*barWidth, y(i,1) + verticalOffset, string(y(i,1)),...
%             'fontname','Times New Roman');
%         text(i + 0.02*barWidth, y(i,2) + verticalOffset, string(y(i,2)),...
%             'fontname','Times New Roman');
%     end
    % 新版直接采用居中对齐！
    if i == size(y, 1)
        text(i - 0.18*barWidth, y(i,1) + verticalOffset, string(y(i,1)),...
            'fontname','Times New Roman','fontweight','bold','HorizontalAlignment','center');
        text(i + 0.18*barWidth, y(i,2) + verticalOffset, string(y(i,2)),...
            'fontname','Times New Roman','fontweight','bold','HorizontalAlignment','center');
    else
        text(i - 0.18*barWidth, y(i,1) + verticalOffset, string(y(i,1)),...
            'fontname','Times New Roman','HorizontalAlignment','center');
        text(i + 0.18*barWidth, y(i,2) + verticalOffset, string(y(i,2)),...
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