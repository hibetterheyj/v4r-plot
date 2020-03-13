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
clc;clear;close all;
% 添加tightfig
addpath('../');

% 加载数据
load('ReCF_succ_data.mat');
data = ReCF_succ_data.gI;
gI = data(:,1);
gH = data(:,2);
succ = data(:,4);
% 取出不画中间数据
data2 = data;
% 9:79.5 10:80
% data2(9,:) = [];
% data2(10:15,:) = [];
% gI2 = data2(:,1);
% gH2 = data2(:,2);
% succ2 = data2(:,4);

figure33_1 = figure(301);
set(figure33_1,'position',[0 0 1000 400]);
h1=plot(gI, succ, 'o-',...
    'Color',[0,0.4,0.74],...
    'LineWidth',1.5,...
    'MarkerSize',5,...
    'MarkerEdgeColor',[0,0.45,0.74]); % [0,0.45,0.74]
    ...'MarkerFaceColor',[0.5,0.5,0.5]
hold on
% 当前范围
% rectangle('Position',[81 0.448 1 0.01],'LineWidth',1.5)
% rectangle('Position',[79 0.451 4 0.012],'LineWidth',1.5)
% 圆形
rectangle('Position',[78.5 0.444 5.5 0.02],'LineWidth',1.5,'Curvature',[1 1]);

% 额外的横线
% hold on
% plot(gamma, min(prec) * baseline, 'r--','LineWidth',2);

% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线

axis([0 100 0.350 0.47]);
yLabelName1 = 'Success rate';

fontSize = 13;
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
set(gca,'ytick',(0.35:0.02:0.47))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.3f'))
% 自定义xtick
% xticks(0:0.05:0.4);
% xticklabels({'0','0.05','0.10','0.15','0.20','0.25','0.30','0.35','0.40'});

lineWidth = 5; % 画线的线粗
xLabelName = '\gamma_I';
% xlabel(xLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 横轴名称
xlabel(xLabelName,'fontsize',fontSize); % 横轴名称

% 左下角位于点 (0.5,0.2) 处，宽度和高度为 (0.28,0.25)
axes('Position',[0.58,0.2,0.3,0.26]); % 生成子图   
startIndex = 9;endIndex = 16; % startIndex:endIndex
chooseIndex = 13;
h2=plot(gI(startIndex:endIndex), succ(startIndex:endIndex), 'o-',...
    'Color',[0,0.4,0.74],...
    'LineWidth',2,...
    'MarkerSize',8,...
    'MarkerEdgeColor',[0,0.45,0.74]); % [0,0.45,0.74]
    ...'MarkerFaceColor',[0.5,0.5,0.5]
% 设置子图坐标轴范围 
hold on
lineX = [81.5, 81.5];lineY = [0.448,succ(chooseIndex)];
plot(lineX,lineY,'r--','LineWidth',1.5);
% 是否grid
% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线
% 设置坐标轴值字体
subFontSize = 8;
set(gca,'FontName','Times New Roman','fontSize',subFontSize);
% 矫正xtick全为保留三位小数
set(gca,'xtick',(79.5:0.5:83))
set(gca,'xTickLabel',num2str(get(gca,'xTick')','%.1f'))
% 矫正ytick全为保留三位小数
set(gca,'ytick',(0.448:0.002:0.458))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.3f'))
xlim([min(gI(startIndex:endIndex)),max(gI(startIndex:endIndex))]); 
ylim([0.448,0.458]);

tightfig;

% 输出保存
saveas(gcf,'ReCF_succ_gI.pdf') % pdf
saveas(gcf,'ReCF_succ_gI','png') % png