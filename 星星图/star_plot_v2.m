%% 参考：
% 1. matlab - scatter
% https://ww2.mathworks.cn/help/matlab/ref/scatter.html

%% 正文
% 添加tightfig
addpath('../');
clc;clear;close all;

saveFileName = 'star_plotv2';
saveFileType = 'png'; % pdf/png

plotDrawStyle = {struct('color',[1,0,0],'lineStyle','p'),...
    struct('color',[1,0,0],'lineStyle','p'),...
    struct('color',[0,1,0],'lineStyle','h'),...
    struct('color',[0,0,1],'lineStyle','x'),...
    struct('color',[0,0,0],'lineStyle','s'),...
    struct('color',[1,0,1],'lineStyle','v'),...
    struct('color',[0,1,1],'lineStyle','*'),...
    struct('color',[0.5,0.5,0.5],'lineStyle','d'),...
    struct('color',[136,0,21]/255,'lineStyle','o'),...
    struct('color',[255,127,39]/255,'lineStyle','^'),...
    struct('color',[0,162,232]/255,'lineStyle','+'),...
    struct('color',[163,73,164]/255,'lineStyle','>'),...
    struct('color',[12,73,123]/255,'lineStyle','<'),...
    struct('color',[0,0,0]/255,'lineStyle','x'),...
    struct('color',[236 186 53]/255,'lineStyle','s'),...
    struct('color',[0,162,232]/255,'lineStyle','v'),...
    struct('color',[0,128,128]/255,'lineStyle','*'),...
    struct('color',[255,140,0]/255,'lineStyle','d'),...
    struct('color',[12,73,123]/255,'lineStyle','o'),...
    struct('color',[0,128,128]/255,'lineStyle','^'),...
    struct('color',[255,0,255]/255,'lineStyle','+'),...
    struct('color',[0,0,139]/255,'lineStyle','>'),...
    struct('color',[236 186 53]/255,'lineStyle','<'),...
    struct('color',[128,0,128]/255,'lineStyle','x'),...
    struct('color',[225,20,147]/255,'lineStyle','s'),...
    struct('color',[180,20,30]/255,'lineStyle','v'),...
    struct('color',[0 1 1],'lineStyle','d'),...
    struct('color',[1 0 1],'lineStyle','s'),...
    struct('color',[1 0 1],'lineStyle','x'),...
    struct('color',[1 0 1],'lineStyle','o'),...
    struct('color',[0,128,128]/255,'lineStyle','o'),...
    struct('color',[0,128,128]/255,'lineStyle','+'),...
    struct('color',[0,128,128]/255,'lineStyle','x'),...
    struct('color',[0 0 0],'lineStyle','^'),...
    struct('color',[1 0 1],'lineStyle','^'),...
    struct('color',[0 1 1],'lineStyle','^'),...
    };

% {'UAVDT','Prec.','Succ.','Avg. FPS','Venue'}
% C = readcell('UAVDT_data.xlsx');
C = readcell('KBCF_UAVDT_data.xlsx');

TrkSet = C(:,1);
prec = cell2mat(C(:,2));
succ = cell2mat(C(:,3));
FPSSet = C(:,4);
SourceSet = C(:,5);

% 图窗
figureStar = figure(40);

for ii = 1:length(succ)
    %     plot(x(ii),y(ii),'color',plotDrawStyle{ii}.color, 'Marker', plotDrawStyle{ii}.lineStyle, 'MarkerSize',12, 'LineWidth',2);
    %     scatter(x(ii),y(ii), plotDrawStyle{ii}.color, 'Marker', plotDrawStyle{ii}.lineStyle, 'MarkerSize',12, 'LineWidth',2);
    if ii==1
        scatter(succ(ii),prec(ii),300,plotDrawStyle{ii}.color,plotDrawStyle{ii}.lineStyle, 'LineWidth', 3);
    else
        scatter(succ(ii),prec(ii),300,plotDrawStyle{ii}.color,plotDrawStyle{ii}.lineStyle, 'LineWidth', 2);
    end
    %         tmpName{ii} = [TrkSet{ii},'  (' FPSSet{ii} ' fps)' ];
    if ii==1
        %         tmpName{ii} = ['\textbf{DRCF} (Ours  38.4 fps)' ];
        tmpName{ii} = ['\textbf{KBCF} (Ours  41.0 fps)' ];
        %     tmpName{ii} = sprintf('%.*s\n', 20 ,[TrkSet{ii}, ' (' FPSSet{ii} ')' ]);
    elseif ii==2
        tmpName{ii} = ['\textbf{BiCF} (2020ICRA  50.2 fps)' ];
    else
        tmpName{ii} = [TrkSet{ii}, '  (' SourceSet{ii} ' ' num2str(FPSSet{ii},'%.1f') 'fps)' ];
    end
    hold on;
end

fontSize = 18;
legendFont = 11;
set(gcf, 'position', [0 0 1200 800]);
xLabelName = 'Success rate';
yLabelName = 'Precision';
legend1=legend(tmpName,'Interpreter', 'latex','fontsize',legendFont, 'location', 'southeastoutside');
set(legend1, 'Fontname', 'Times New Roman','FontWeight','normal');
axis([0.28 0.47 0.55 0.725]);

% Times 字体
xlabel(xLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize-4); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% Times 字体
ylabel(yLabelName,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',fontSize-4); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% 矫正 xtick 全为保留三位小数
set(gca,'xtick',(0.28:0.02:0.46))
set(gca,'xTickLabel',num2str(get(gca,'xTick')','%.2f'))
% 矫正 ytick 全为保留三位小数
set(gca,'ytick',(0.56:0.02:0.72))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.2f'))
title(  'Overall performance on UAVDT','fontsize',fontSize,'fontname','Times New Roman','fontweight','bold');
grid on; box on;

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