data = ...
[0.684 	0.447 	0;
0.695 	0.463 	1/1024;
0.705 	0.457 	2/1024;
0.710 	0.463 	3/1024;
0.718 	0.461 	4/1024;
0.709 	0.472 	5/1024;
0.711 	0.467 	6/1024;
0.708 	0.467 	7/1024;
0.704 	0.469 	8/1024];
gamma = data(:,3);
% 1234列分别代表上，左，下，右
prec = data(:,1);
succ = data(:,2);
baseline = ones(9,1);

figure33_1 = figure(301);
set(figure33_1,'position',[0 0 700 250]);
% subplot(211)
h1=plot(gamma, prec(1:end), 'o-',...
    'Color',[0,0.45,0.74],...
    'LineWidth',2,...
    'MarkerSize',8,...
    'MarkerEdgeColor',[0,0.45,0.74]); % [0,0.45,0.74]
    ...'MarkerFaceColor',[0.5,0.5,0.5]
hold on
% plot(gamma, min(prec) * baseline, 'r--','LineWidth',2);
axis([0 8/1024 0.68 0.72]);
yLabelName1 = 'Precision';

fontSize = 13;
% ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
% set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
set(gca,'fontSize',fontSize); % 设置坐标轴值字体

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

xticks([1/1024,2/1024,3/1024,4/1024,5/1024,6/1024,7/1024,8/1024]);
xticklabels({'1/1024','1/512','3/1024','1/256','5/1024','3/512','7/1024','1/128'});


lineWidth = 5; % 画线的线粗
xLabelName = '\lambda_2';
% xlabel(xLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 横轴名称
xlabel(xLabelName,'fontsize',fontSize,'fontweight','bold'); % 横轴名称
grid

tightfig;

saveas(gcf,'ablation_prec_lambda2.pdf')