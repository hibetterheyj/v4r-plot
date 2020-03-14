%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html
% 3. matlab画一个局部放大的图中图
% https://blog.csdn.net/wangh0802/article/details/70237118
% 4. matlab - axes
% https://ww2.mathworks.cn/help/matlab/ref/axes.html
% 5. matlab - rectangle 矩形，圆角矩形，椭圆
% https://ww2.mathworks.cn/help/matlab/ref/rectangle.html

%% 正文
% 添加tightfig
addpath('../');
clc;clear;close all;
load('ReCF_succ_data.mat');

% 数据
data = ReCF_succ_data.gH;
gI = data(:,1);
gH = data(:,2);
succ = data(:,4);
% 取出不画中间数据
% data2 = data;
% data2(7:17,:) = [];
% gI2 = data2(:,1);
% gH2 = data2(:,2);
% succ2 = data2(:,4);

figure33_1 = figure(301);
set(figure33_1,'position',[0 0 1000 400]);
h1=plot(gH, succ, 'o-',...
    'Color',[0,0.4,0.74],...
    'LineWidth',1.5,...
    'MarkerSize',5,...
    'MarkerEdgeColor',[0,0.45,0.74]); % [0,0.45,0.74]
    ...'MarkerFaceColor',[0.5,0.5,0.5]
hold on
% 当前范围
% 27-28
% rectangle('Position',[26.9 0.45 1.2 0.008],'LineWidth',1.5)
% rectangle('Position',[26.2 0.454 1.8 0.003],'LineWidth',1.5)
% 圆形
rectangle('Position',[26.8 0.452 1.6 0.0055],'LineWidth',1.5,'Curvature',[1 1]);
% 椭圆
% rectangle('Position',[26.5 0.450 1.6 0.008],'LineWidth',1.5,'Curvature',[1 1]);

% 额外的横线
% hold on
% plot(gamma, min(prec) * baseline, 'r--','LineWidth',2);

% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线

% axis([0 30 0.435 0.460]);
axis([0 30 0.435 0.460]);
yLabelName1 = 'Success rate (AUC score)';

fontSize = 18;
% Times 字体
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% 显示图轴边框
set(gca,'box','on')

% set(legend1, 'Fontname', 'Times New Roman','FontWeight','normal'); % 设置legend字体
% 矫正ytick全为保留三位小数
set(gca,'ytick',(0.435:0.005:0.46))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.3f'))
% 设置tick
% xticks(0:0.05:0.4);
% xticklabels({'0','0.05','0.10','0.15','0.20','0.25','0.30','0.35','0.40'});

lineWidth = 5; % 画线的线粗
xLabelName = '\gamma_{\it{H}}';
% xlabel(xLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 横轴名称
% xlabel(xLabelName,'fontsize',fontSize,'fontweight','bold'); % 横轴名称
xlabel(xLabelName,'fontsize',fontSize); % 横轴名称

% 左下角位于点 (0.6,0.2) 处，宽度和高度为 (0.28,0.25)
axes('Position',[0.58,0.28,0.3,0.26]); % 生成子图 
startIndex = 4;endIndex = 8; % startIndex:endIndex
chooseIndex = 6;
h2=plot(gH(startIndex:endIndex), succ(startIndex:endIndex), 'o-',...
    'Color',[0,0.4,0.74],...
    'LineWidth',2,...
    'MarkerSize',8,...
    'MarkerEdgeColor',[0,0.45,0.74]); % [0,0.45,0.74]
    ...'MarkerFaceColor',[0.5,0.5,0.5]
% 设置子图坐标轴范围 
hold on
lineX = [27.6, 27.6];lineY = [0.45,succ(chooseIndex)];
plot(lineX,lineY,'r--','LineWidth',1.5);
% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线
% 设置坐标轴值字体
subFontSize = 14;
set(gca,'FontName','Times New Roman','fontSize',subFontSize);
% 矫正xtick全为保留三位小数
set(gca,'xtick',(27.2:0.2:28))
set(gca,'xTickLabel',num2str(get(gca,'xTick')','%.1f'))
% 矫正ytick全为保留三位小数
set(gca,'ytick',(0.452:0.002:0.458))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.3f'))
xlim([min(gH(startIndex:endIndex)),max(gH(startIndex:endIndex))]); % 设置坐标轴范围 
ylim([0.452,0.458]);
tightfig;

% 输出保存
saveas(gcf,'ReCF_succ_gH.pdf') % pdf
saveas(gcf,'ReCF_succ_gH','png') % png