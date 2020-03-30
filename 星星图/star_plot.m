%% 参考：
% 1. matlab - scatter
% https://ww2.mathworks.cn/help/matlab/ref/scatter.html

%% 正文
% 添加tightfig
addpath('../');
clc;clear;close all;

saveFileName = 'star_plot';
saveFileType = 'pdf'; % pdf/png

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
    struct('color',[0,128,128]/255,'lineStyle','o'),...
    struct('color',[0 0 0]/255,'lineStyle','^'),...
    };

prec = ...
    [0.716
    0.707
    0.700
    0.700
    0.697
    0.695
    0.686
    0.683
    0.681
    0.677
    0.674
    0.674
    0.667
    0.666
    0.660
    0.659
    0.658
    0.656
    0.649
    0.643
    0.629
    0.605
    0.603
    0.602
    0.579
    0.571
    0.564
    0.559
    ];

succ= ...
    [0.458
    0.452
    0.454
    0.437
    0.416
    0.394
    0.433
    0.429
    0.410
    0.431
    0.389
    0.441
    0.437
    0.383
    0.403
    0.420
    0.419
    0.406
    0.389
    0.410
    0.411
    0.319
    0.388
    0.355
    0.312
    0.290
    0.304
    0.288
    ];

TrkSet = {'KBCF'
    'BiCF'
    'ECO'
    'ASRCF'
    'UDT+'
    'Staple\_CA'
    'BACF'
    'ADNet'
    'ECO\_HC'
    'TADT'
    'CSRDCF'
    'UDT'
    'DeepSTRCF'
    'fDSST'
    'MCPF'
    'DSARCF'
    'SRDCF'
    'C-COT'
    'KCC'
    'SRDCFdecon'
    'STRCF'
    'CoKCF'
    'IBCCF'
    'CF2'
    'SAMF'
    'KCF'
    'SAMF\_CA'
    'DCF'
    };

SourceSet = {'Ours'
    '2020ICRA'
    '2017CVPR'
    '2019CVPR'
    '2019CVPR'
    '2017CVPR'
    '2017CVPR'
    '2017CVPR'
    '2017CVPR'
    '2019CVPR'
    '2018CVPR'
    '2019CVPR'
    '2018CVPR'
    '2016TPAMI'
    '2017CVPR'
    '2019TIP'
    '2015ICCV'
    '2016ECCV'
    '2018AAAI'
    '2016CVPR'
    '2018CVPR'
    '2017PR'
    '2017ICCV'
    '2015ICCV'
    '2014ECCV'
    '2015TPAMI'
    '2017CVPR'
    '2015TPAMI'
    };

FPSSet = {'41.0'
    '50.2'
    '16.4'
    '21.3'
    '60.4'
    '64.1'
    '69.1'
    '7.5'
    '79.2'
    '32.5'
    '13.2'
    '76.4'
    '6.6'
    '219'
    '0.7'
    '12.7'
    '17.4'
    '1.1'
    '56.9'
    '8.9'
    '32.3'
    '21.2'
    '3.4'
    '20.1'
    '15.8'
    '957'
    '14.7'
    '1454'
    };
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
        tmpName{ii} = [TrkSet{ii}, '  (' SourceSet{ii} ' ' FPSSet{ii} 'fps)' ];
    end
    hold on;
end

FontSize = 18;
xLabelName = 'Success rate';
yLabelName = 'Precision';
legend1=legend(tmpName,'Interpreter', 'latex','fontsize',15, 'location', 'southeastoutside');
set(legend1, 'Fontname', 'Times New Roman','FontWeight','normal');
axis([0.28 0.47 0.55 0.73]);

% Times 字体
xlabel(xLabelName,'fontsize',FontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',FontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% Times 字体
ylabel(yLabelName,'fontsize',FontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
set(gca,'FontName','Times New Roman','fontSize',FontSize); % 设置坐标轴值字体
% 默认无衬线字体
% ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
% set(gca,'fontSize',fontSize); % 设置坐标轴值字体

% 矫正 xtick 全为保留三位小数
set(gca,'xtick',(0.28:0.02:0.46))
set(gca,'xTickLabel',num2str(get(gca,'xTick')','%.2f'))
% 矫正 ytick 全为保留三位小数
set(gca,'ytick',(0.56:0.02:0.72))
set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.2f'))
set(gcf, 'position', [0 0 1200 850]);
title(  'Overall performance on UAVDT','fontsize',FontSize,'fontname','Times New Roman','fontweight','bold');
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