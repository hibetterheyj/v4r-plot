%% 参考：
% 1. matlab - plot
% https://www.mathworks.com/help/matlab/ref/plot.html

%% 正文
% 添加tightfig
addpath('../');

% 数据
data = [0.718 0.693 0.686 0.679 0.674 0.652 0.635 0.634 ...
        0.627 0.621 0.619 0.608 0.596 0.595 0.570 0.570 ...
        0.569 0.560 0.542 0.488 0.478 0.464 0.423 0.422;
        0.495 0.475 0.491 0.481 0.437 0.456 0.431 0.396 ...
        0.392 0.428 0.436 0.426 0.428 0.418 0.396 0.378 ...
        0.384 0.363 0.365 0.312 0.323 0.290 0.271 0.270];
data = flip(data, 2);
order = 1:24;
prec = data(1,:);
succ = data(2,:);
baseline = ones(9,1);

figure33_1 = figure(301);
set(figure33_1,'position',[0 0 700 360]);
% 21 trackers
h1=plot(order(1:21), prec(1:21), 'o',...
    'MarkerSize',8,...
    'MarkerEdgeColor',[0 0 0],... % [0,0.45,0.74]
    'MarkerFaceColor',[1 1 1]);
hold on
for ii = 1:21
    plot([order(ii) order(ii)], [0 prec(ii)],'Color',[0,0,0]);
    hold on
end
% blue
h1=plot(order(22), prec(22), 'o',...
    'MarkerSize',8,...
    'MarkerEdgeColor',[0 0 1],... % [0,0.45,0.74]
    'MarkerFaceColor',[0 0 1]);
hold on
for ii = 22:22
    plot([order(ii) order(ii)], [0 prec(ii)],'Color',[0,0,1]);
    hold on
end
% green
h1=plot(order(23), prec(23), 'o',...
    'MarkerSize',8,...
    'MarkerEdgeColor',[0 1 0],... % [0,0.45,0.74]
    'MarkerFaceColor',[0 1 0]);
hold on
for ii = 23:23
    plot([order(ii) order(ii)], [0 prec(ii)],'Color',[0,1,0]);
    hold on
end
% red
h1=plot(order(24), prec(24), 'o',...
    'MarkerSize',8,...
    'MarkerEdgeColor',[1 0 0],... % [0,0.45,0.74]
    'MarkerFaceColor',[1 0 0]);
hold on
for ii = 24:24
    plot([order(ii) order(ii)], [0 prec(ii)],'Color',[1,0,0]);
    hold on
end

% plot(gamma, min(prec) * baseline, 'r--','LineWidth',2);
fontSize = 13;
set(gca,'fontSize',fontSize); % 设置坐标轴值字体
fontSize = 18;
axis([0 25 0.4 0.75]);
yLabelName1 = 'Precision';
ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
set(gca,'box','on')
set(gca,'xtick',[]);
% set(legend1, 'Fontname', 'Times New Roman','FontWeight','normal'); % 设置legend字体

% xticks([1,50,100,150,200,250,300,350]);
% xticklabels({'#50','#100','#150','#200','#250','#300','#350'});
lineWidth = 5; % 画线的线粗
% xLabelName = '\gamma';
% xlabel(xLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 横轴名称

tightfig;

% saveas(gcf,'Prec_ablation.pdf')