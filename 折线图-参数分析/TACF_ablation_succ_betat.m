%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html

%% 正文
% 添加tightfig
addpath('../');

% 数据
data = ...
[0.410 0;
0.423 0.05;
0.437 0.10;
0.430 0.15;
0.431 0.20;
0.421 0.25;
0.415 0.30;
0.416 0.35;
0.412 0.40];
beta = data(:,2);

succ = data(:,1);
baseline = ones(9,1);

figure33_1 = figure(301);
set(figure33_1,'position',[0 0 700 250]);
% subplot(211)
h1=plot(beta, succ(1:end), 'o-',...
    'Color',[0,0.4,0.74],...
    'LineWidth',2,...
    'MarkerSize',8,...
    'MarkerEdgeColor',[0,0.45,0.74]); % [0,0.45,0.74]
    ...'MarkerFaceColor',[0.5,0.5,0.5]
hold on
% plot(gamma, min(prec) * baseline, 'r--','LineWidth',2);
axis([0 0.4 0.410 0.440]);
yLabelName1 = 'Precision';

fontSize = 13;
% Times 字体
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% subplot(212)
% h2=plot(gamma, succ(1:end), 'k','LineWidth',2);
% hold on
% plot(gamma, min(succ) * baseline, 'r--','LineWidth',2);
% set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% % legend1 = legend([h1 h2],'Precision Score', 'Success Score','Location','northwest');
% axis([0 0.08 0.44 0.48]);
% yLabelName2 = 'Success Score';
% ylabel(yLabelName2,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'box','on')

% set(legend1, 'Fontname', 'Times New Roman','FontWeight','normal'); % 设置legend字体

xticks(0:0.05:0.4);
xticklabels({'0','0.05','0.10','0.15','0.20','0.25','0.30','0.35','0.40'});


lineWidth = 5; % 画线的线粗
xLabelName = '\beta_t';
% xlabel(xLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 横轴名称
xlabel(xLabelName,'fontsize',fontSize,'fontweight','bold'); % 横轴名称
grid

tightfig;

% 输出保存
% saveas(gcf,'ablation_succ_betat.pdf') % pdf
saveas(gcf,'example','png') % png