%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html

%% 正文
% 添加tightfig
addpath('../');

% 图窗
figure4D = figure(40);
set(figure4D,'position',[0 0 800 450]);

% 数据
y=[0.389 0.374;0.432 0.421; 0.425 0.407; 0.423 0.398; 0.437 0.456;];
% 将各条形的宽度设置为各条形可用总空间的 80%。
b=bar(y, 0.8);
grid on;

%设置x轴范围和刻度
set(gca,'TickLabelInterpreter','latex'); % 设置解析器为latex
set(gca,'XTickLabel',{'KCC','TACF1','TACF2','TACF3','\textbf{TACF}'})
% set(gca,'XTick',[0:1:10]);%设置要显示坐标刻度
% set(gca,'XTickLabel',[0:1:10]);%给坐标加标签 
% xlabel('')
%设置y轴范围和刻度
set(gca,'YLim',[0.35, 0.48]);%X轴的数据显示范围
% set(gca,'YTick',[95:1:101]);%设置要显示坐标刻度
% set(gca,'YTickLabel',[95:1:101]);%给坐标加标签 
yLabelName1 = 'Success Rate';
% 设置标签，及其位置
legend('UAVDT','UAV123@10fps','Location','northwest');

fontSize = 13;
% Times 字体
ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

tightfig;

% 输出保存
% saveas(gcf,'example.pdf'); % pdf
saveas(gcf,'example','png'); % png