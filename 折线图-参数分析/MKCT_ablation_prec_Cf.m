data = ...
[0.684 	0.447 	0;
0.698 	0.463 	0.2;
0.705 	0.457 	0.4;
0.702 	0.463 	0.6;
0.712 	0.461 	0.8;
0.718 	0.472 	1.0;
0.705 	0.467 	1.2];
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
axis([0 1.2 0.68 0.72]);
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

xticks([0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2]);
xticklabels({'0','0.2','0.4','0.6','0.8','1.0','1.2'});


lineWidth = 5; % 画线的线粗
xLabelName = 'C_f';
% xlabel(xLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 横轴名称
xlabel(xLabelName,'fontsize',fontSize,'fontweight','bold'); % 横轴名称
grid

tightfig;

saveas(gcf,'ablation_prec_Cf.pdf')