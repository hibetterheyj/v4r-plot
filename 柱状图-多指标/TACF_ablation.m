%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242
% 2. matlab - legend
% https://ww2.mathworks.cn/help/matlab/ref/legend.html

%% 正文
y=[0.389 0.374;0.432 0.421; 0.425 0.407; 0.423 0.398; 0.437 0.456;];
b=bar(y);
grid on;

%设置x轴范围和刻度
set(gca,'XTickLabel',{'KCC','TACF1','TACF2','TACF3','\textbf{TACF}'})
% set(gca,'XTick',[0:1:10]);%设置要显示坐标刻度
% set(gca,'XTickLabel',[0:1:10]);%给坐标加标签 
% xlabel('')
%设置y轴范围和刻度
set(gca,'YLim',[0.35, 0.50]);%X轴的数据显示范围
% set(gca,'YTick',[95:1:101]);%设置要显示坐标刻度
% set(gca,'YTickLabel',[95:1:101]);%给坐标加标签 
ylabel('Success Rate');
% 设置标签，及其位置
legend('UAVDT','UAV123@10fps','Location','northwest');