%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html
% 3. matlab - yyaxis
% https://ww2.mathworks.cn/help/matlab/ref/yyaxis.html
% 4. matlab - text
% https://ww2.mathworks.cn/help/matlab/ref/text.html
% 5. MATLAB Answers - Black axes for yyaxis (not default blue and orange)
% https://www.mathworks.com/matlabcentral/answers/451917-black-axes-for-yyaxis-not-default-blue-and-orange

%% 说明
% 多个跟踪器在一个指标两个数据集的分析

%% 正文
clear;clc;close all;
% 添加tightfig
addpath('../');

saveFileName = 'yyaxis_bar_plot';
saveFileType = 'png'; % pdf/png
addText = true; % true/false
fontSize = 12;

% 图窗
figure4D = figure(40);
set(figure4D,'position',[0 0 800 450]);

% 数据
y=[0.4540 0.7173;0.4620 0.7287;0.4699 0.7377;];
x=1:size(y,1);
% 将各条形的宽度设置为各条形可用总空间的 80%。
barWidth = 0.26;
centerOffset = 0.16;
xlim([0.5 3.5])
%% 左边
yyaxis left
b=bar(x-centerOffset, y(:,1), barWidth);
ylim([0.44 0.48])
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.3f'))
yLabelName1 = 'Success rate';
% Times 字体
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold','Color','k'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName21,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName2,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体
% 手动文字添加文字标签
% 'HorizontalAlignment' - 相对于位置点水平对齐文本，我们使用'center'！
% 'left' （默认） | 'center' | 'right'
% 'VerticalAlignment' - 相对于位置点水平对齐文本，我们使用'bottom'！
% 'middle' （默认） | 'top' | 'bottom' | 'baseline' | 'cap'
if addText
    for i = 1 : size(y, 1)
        if i == size(y, 1)
            text(x(i)-centerOffset, y(i,1), num2str(y(i,1)','%.3f'),...
                'fontname','Times New Roman','fontweight','bold','HorizontalAlignment','center','VerticalAlignment','bottom');
        else
            text(x(i)-centerOffset, y(i,1), num2str(y(i,1)','%.3f'),...
                'fontname','Times New Roman','HorizontalAlignment','center','VerticalAlignment','bottom');
        end
    end
end

%% 右边
yyaxis right
b=bar(x+centerOffset, y(:,2), barWidth);
ylim([0.70 0.74])
%设置y轴范围和刻度
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.3f'))
yLabelName2 = 'Precision';
% Times 字体
ylabel(yLabelName2,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold','Color','k'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName2,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体
% 手动文字添加文字标签
if addText
    for i = 1 : size(y, 1)
        if i == size(y, 1)
            text(x(i)+centerOffset, y(i,2), num2str(y(i,2)','%.3f'),...
                'fontname','Times New Roman','fontweight','bold','HorizontalAlignment','center','VerticalAlignment','bottom');
        else
            text(x(i)+centerOffset, y(i,2), num2str(y(i,2)','%.3f'),...
                'fontname','Times New Roman','HorizontalAlignment','center','VerticalAlignment','bottom');
        end
    end
end

%% 杂项
% 修改默认颜色
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';

% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线

%设置x轴范围和刻度
% set(gca,'XLim',[1, 5]);%X轴的数据显示范围
set(gca,'XTick',[1:3]);%设置要显示坐标刻度
set(gca,'TickLabelInterpreter','latex'); % 设置解析器为latex
set(gca,'XTickLabel',{'IBRI (w/o MF+DA)','IBRI (w/o DA)','\textbf{IBRI}'})
% xlabel('')
% 设置标签，及其位置
legend('Success rate','Precision','Location','northwest');

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