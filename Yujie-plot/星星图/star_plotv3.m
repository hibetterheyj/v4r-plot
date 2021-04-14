%% 参考：
% 1. matlab - scatter
% https://ww2.mathworks.cn/help/matlab/ref/scatter.html

%% 正文
% 添加tightfig
addpath('../');
clc;clear;close all;

saveFileName = 'star_plotv3';
saveFileType = 'png'; % pdf/png

plotDrawStyle = {struct('color',[1,0,0],'lineStyle','p'),...
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
	struct('color',[1,0,0],'lineStyle','^'),...
    struct('color',[0,1,0],'lineStyle','^'),...
    struct('color',[0,0,1],'lineStyle','^'),...
    struct('color',[0,0,0],'lineStyle','^'),...
    struct('color',[1,0,1],'lineStyle','h'),...
    struct('color',[0,1,1],'lineStyle','x'),...
    struct('color',[0.5,0.5,0.5],'lineStyle','s'),...
    struct('color',[136,0,21]/255,'lineStyle','v'),...
	struct('color',[0,0,1],'lineStyle','v'),...
    };

% {'UAVDT','Prec.','Succ.','Avg. FPS','Venue'}
C = readcell('recf_dp_auc_fps.xls');
% C = readtable('recf_dp_auc_fps.xls');

TrkSet = C(:,1);
prec = cell2mat(C(:,2));
succ = cell2mat(C(:,3));
FPSSet = C(:,4);
% SourceSet = C(:,5);

% 图窗
figureStar = figure(40);

our_idx = 16;

% x: succ; y: prec
% scatter(succ(our_idx),prec(our_idx),300,plotDrawStyle{1}.color,plotDrawStyle{1}.lineStyle, 'LineWidth', 3);
% tmpName{1} = ['\textbf{', TrkSet{our_idx}, ' } (' num2str(FPSSet{our_idx},'%.1f') 'fps)' ];
% x: prec; y: succ
scatter(prec(our_idx),succ(our_idx),300,plotDrawStyle{1}.color,plotDrawStyle{1}.lineStyle, 'LineWidth', 3);
tmpName{1} = ['\textbf{', TrkSet{our_idx}, ' } (' num2str(FPSSet{our_idx},'%.1f') 'fps)' ];
hold on;

for ii = 1:length(succ)
    if ii == our_idx
        continue;
    end
    if ii <=our_idx
        % x: succ; y: prec
        % scatter(succ(ii),prec(ii),300,plotDrawStyle{ii+1}.color,plotDrawStyle{ii+1}.lineStyle, 'LineWidth', 2);
        % x: prec; y: succ
        scatter(prec(ii),succ(ii),300,plotDrawStyle{ii+1}.color,plotDrawStyle{ii+1}.lineStyle, 'LineWidth', 2);
        tmpName{ii+1} = [TrkSet{ii}, '  (' num2str(FPSSet{ii},'%.1f') 'fps)' ];
    else
        % x: succ; y: prec
        % scatter(succ(ii),prec(ii),300,plotDrawStyle{ii}.color,plotDrawStyle{ii}.lineStyle, 'LineWidth', 2);
        % x: prec; y: succ
        scatter(prec(ii),succ(ii),300,plotDrawStyle{ii}.color,plotDrawStyle{ii}.lineStyle, 'LineWidth', 2);
        tmpName{ii} = [TrkSet{ii}, '  (' num2str(FPSSet{ii},'%.1f') 'fps)' ];
    end
    hold on;
end

fontSize = 24;
legendFont = 12;
set(gcf, 'position', [0 0 1050 1200]);
xLabelName = 'Precision';
yLabelName = 'Success rate';

axis([0.55 0.720 0.28 0.480]);

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

% succ
set(gca,'ytick',(0.28:0.02:0.48))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.2f'))
% prec
set(gca,'xtick',(0.56:0.02:0.72))
set(gca,'xTickLabel',num2str(get(gca,'xTick')','%.2f'))
% title(  'Overall performance','fontsize',fontSize,'fontname','Times New Roman','fontweight','bold');
grid on; box on;

% option1: southeastoutside, 1 column
%legend1=legend(tmpName,'Interpreter', 'latex','fontsize',legendFont, 'location', 'southeastoutside');
%set(legend1, 'Fontname', 'Times New Roman','FontWeight','normal');
% option2: southoutside, 14 column
% https://www.mathworks.com/help/matlab/ref/matlab.graphics.illustration.legend-properties.html
legend2=legend(tmpName,'Interpreter', 'latex','fontsize',legendFont, ...
    'location', 'southoutside','NumColumns',5);
% legend2=legend(tmpName,'Interpreter', 'latex','fontsize',legendFont, ...
%     'location', 'southoutside','NumColumns',5,'Position', rect);
set(legend2, 'Fontname', 'Times New Roman','FontWeight','normal');


tightfig;

% 输出保存
switch saveFileType
    case 'pdf'
        print(gcf,'-dpdf', [saveFileName '.pdf']);
    case 'png'
        print(gcf,'-dpng', [saveFileName '.png']);
    otherwise
        disp('Type error !')
end