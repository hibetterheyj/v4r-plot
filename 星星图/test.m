%% 参考：
% 1. matlab - scatter
% https://ww2.mathworks.cn/help/matlab/ref/scatter.html
% 2. matlab - semilogx
% https://ww2.mathworks.cn/help/matlab/ref/semilogx.html
% 3. matlab - LineSpec
% https://ww2.mathworks.cn/help/matlab/ref/linespec.html

%% 正文
% 添加tightfig
addpath('../');
clc;clear;close all;

saveFileName = 'KBCF_succ_log_star';
saveFileType = 'png'; % pdf/png

plotDrawStyle = {struct('color',[1,0,0],'Marker','p'),...
    struct('color',[1,0,0],'Marker','p'),...
    struct('color',[0,1,0],'Marker','h'),...
    struct('color',[0,0,1],'Marker','x'),...
    struct('color',[0,0,0],'Marker','s'),...
    struct('color',[1,0,1],'Marker','v'),...
    struct('color',[0,1,1],'Marker','*'),...
    struct('color',[0.5,0.5,0.5],'Marker','d'),...
    struct('color',[136,0,21]/255,'Marker','o'),...
    struct('color',[255,127,39]/255,'Marker','^'),...
    struct('color',[0,162,232]/255,'Marker','+'),...
    struct('color',[163,73,164]/255,'Marker','>'),...
    struct('color',[12,73,123]/255,'Marker','<'),...
    struct('color',[0,0,0]/255,'Marker','x'),...
    struct('color',[236 186 53]/255,'Marker','s'),...
    struct('color',[0,162,232]/255,'Marker','v'),...
    struct('color',[0,128,128]/255,'Marker','*'),...
    struct('color',[255,140,0]/255,'Marker','d'),...
    struct('color',[12,73,123]/255,'Marker','o'),...
    struct('color',[0,128,128]/255,'Marker','^'),...
    struct('color',[255,0,255]/255,'Marker','+'),...
    struct('color',[0,0,139]/255,'Marker','>'),...
    struct('color',[236 186 53]/255,'Marker','<'),...
    struct('color',[128,0,128]/255,'Marker','x'),...
    struct('color',[225,20,147]/255,'Marker','s'),...
    struct('color',[180,20,30]/255,'Marker','v'),...
    struct('color',[0 1 1],'Marker','d'),...
    struct('color',[1 0 1],'Marker','s'),...
    struct('color',[1 0 1],'Marker','x'),...
    struct('color',[1 0 1],'Marker','o'),...
    struct('color',[0,128,128]/255,'Marker','o'),...
    struct('color',[0,128,128]/255,'Marker','+'),...
    struct('color',[0,128,128]/255,'Marker','x'),...
    struct('color',[0 0 0],'Marker','^'),...
    struct('color',[1 0 1],'Marker','^'),...
    struct('color',[0 1 1],'Marker','^'),...
    };

% {'UAVDT','Prec.','Succ.','Avg. FPS','Venue'}
% C = readcell('UAVDT_data.xlsx');
C = readcell('KBCF_UAVDT_data.xlsx');

TrkSet = C(:,1);
prec = cell2mat(C(:,2));
succ = cell2mat(C(:,3));
fps = cell2mat(C(:,4));
FPSSet = C(:,4);
SourceSet = C(:,5);

% 图窗
figureStar = figure(40);

for ii = 1:length(succ)
    if ii==1
                plot(log10(fps(ii)),succ(ii),plotDrawStyle{ii}.Marker,'MarkerSize',10,'LineWidth', 3);
%         semilogx(log10(fps(ii)),succ(ii),plotDrawStyle{ii}.Marker,'MarkerSize',10,'LineWidth', 3);
    else
                plot(log10(fps(ii)),succ(ii),plotDrawStyle{ii}.Marker,'MarkerSize',10,'LineWidth', 3);
%         semilogx(log10(fps(ii)),succ(ii),plotDrawStyle{ii}.Marker,'MarkerSize',8,'LineWidth', 2);
    end
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
legendFont = 12;
set(gcf, 'position', [0 0 1350 850]);

% set(gca,'Xgrid','on'); % 出现竖线
set(gca,'Ygrid','on'); % 出现横线
box on;

xLabelName = 'FPS';
yLabelName = 'Success rate';

% axis([log10(3) 3 0.28 0.47]);
axis([log10(0.5) 3 0.28 0.47]);

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

% set(gca, 'XScale', 'log')

% 矫正 xtick 全为保留三位小数
set(gca,'XTick',[log10(0.5),0,log10(2),log10(5),1,log10(20),log10(30),log10(50),2,log10(200),log10(500),3]);
set(gca,'xticklabel',{'0.5','1','2','5','10' ,'20' ,'30' ,'50', '100','200','500','1000'});
% 矫正 ytick 全为保留三位小数
set(gca,'ytick',(0.28:0.02:0.46))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.2f'))
title('Overall performance on UAVDT','fontsize',fontSize,'fontname','Times New Roman','fontweight','bold');

% 竖线分割线
hold on
needx = [log10(30) log10(30)];
needy = [0,1];
plot(needx,needy,'k--');
% 竖线分割线浅绿色的线
mainFPSTick = [log10(0.5),0,log10(1),log10(2),log10(5),1,log10(20),log10(50),2,log10(200),log10(500),3];
for jj = 1:length(mainFPSTick)
    needx = [mainFPSTick(jj) mainFPSTick(jj)];
    needy = [0,1];
    plot(needx,needy,'Color',[0.9 0.9 0.9]);
end

% legend('off')

legend1=legend(tmpName,'Interpreter', 'latex','fontsize',legendFont, 'location', 'southeastoutside');
set(legend1, 'Fontname', 'Times New Roman','FontWeight','normal');

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