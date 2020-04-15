%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html
% 3. matlab - text
% https://ww2.mathworks.cn/help/matlab/ref/text.html
% 4. matlab - Bar 属性
% https://ww2.mathworks.cn/help/matlab/ref/matlab.graphics.chart.primitive.bar-properties.html

%% 说明
% 多个跟踪器在单一指标变量分析

%% 正文
clear;clc;close all;
% 添加tightfig
addpath('../');

% saveFileName = 'single_bar_plot';
saveFileName = 'gamma_analysis';
saveFileType = 'png'; % pdf/png
text_or_not = true; % true/false

% 图窗
figure4D = figure(40);
set(figure4D,'position',[0 0 800 400]);

% gamma：0-0.27 【0.1】第11位
%% 读取xlsx，基本结构：
% lr	gamma	fintl	UAV123_10fps_Prec.	UAV123_10fps_Succ.
C = readcell('res_record_gamma.xlsx');
plot_length = 16; % 选择数量
gamma = cell2mat(C(2:plot_length+1,2));
prec = cell2mat(C(2:plot_length+1,4));
succ = cell2mat(C(2:plot_length+1,5));

% 所选指标
param = prec; % prec/succ
peak_idx = 11;
normal_faceColor = [0 0.45 0.74];
peak_faceColor = [0.85 0.33 0.10];
barWidth = 0.6;

%% 正式画图
% 将各条形的宽度设置为各条形可用总空间的 60%。
for i = 1:plot_length
    % 原本使用bar(y)样式
    % b=bar(param, barWidth);
    % 现使用bar(x,y)样式
    if i == peak_idx
        bar(i, param(i), 'BarWidth', barWidth, 'FaceColor', peak_faceColor);
    else
        bar(i, param(i), 'BarWidth', barWidth, 'FaceColor', normal_faceColor);
    end
    hold on
end

%% 后续操作
% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线

fontSize = 14;
tickFontSize = 12;
textFontSize = 9;
%设置x轴范围和刻度
set(gca,'XLim',[0.2, plot_length+0.8]);%X轴的数据显示范围
set(gca,'XTick',[1:plot_length]);%设置要显示坐标刻度
set(gca,'XTickLabel',num2str(gamma,'%.2f'));
% set(gca,'TickLabelInterpreter','latex'); % 设置解析器为latex
% set(gca,'XTickLabel',{'KCC','TACF1','TACF2','TACF3','\textbf{TACF}'})
xLabelName1 = '\it{\gamma}';

%设置y轴范围和刻度
if param == succ
    % succ [0.4768 0.4904] 0.475/0.465 0.491
    set(gca,'YLim',[0.475 0.491]);%X轴的数据显示范围
    set(gca,'YTick',[0.475:0.005:0.490]);%设置要显示坐标刻度
    % set(gca,'YTickLabel',[95:1:101]);%给坐标加标签
    set(gca,'YTickLabel',num2str(get(gca,'YTick')','%.3f'))
    yLabelName1 = 'Success rate';
elseif param == prec
    % prec [0.6606 0.6863] 0.660/0.655 0.689
    set(gca,'YLim',[0.655 0.689]);%X轴的数据显示范围
    set(gca,'YTick',[0.655:0.005:0.690]);%设置要显示坐标刻度
    set(gca,'YTickLabel',num2str(get(gca,'YTick')','%.3f'))
    % set(gca,'YTickLabel',[95:1:101]);%给坐标加标签
    yLabelName1 = 'Precision';
end

% Times 字体
set(gca,'FontName','Times New Roman','fontSize',tickFontSize); % 设置坐标轴值字体
xlabel(xLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
% 默认无衬线字体
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体
% xlabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称

% 设置标签，及其位置
% legend('UAVDT','UAV123@10fps','Location','northwest');

% 手动文字添加文字标签
% 'HorizontalAlignment' - 相对于位置点水平对齐文本
% 'left' （默认） | 'center' | 'right'
if text_or_not
    if param == succ
        verticalOffset = 0.0005;
    elseif param == prec
        verticalOffset = 0.0009;
    end
    for i = 1 : size(param, 1)
        if i == peak_idx
            text(i, param(i) + verticalOffset, num2str(param(i),'%.4f'),...
                'fontname','Times New Roman','fontweight','bold','fontSize',textFontSize,'HorizontalAlignment','center');
        else
            text(i, param(i) + verticalOffset, num2str(param(i),'%.4f'),...
                'fontname','Times New Roman','fontSize',textFontSize,'HorizontalAlignment','center');
        end
    end
end

tightfig;

if param == succ
    saveFileName = [saveFileName '_succ'];
elseif param == prec
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