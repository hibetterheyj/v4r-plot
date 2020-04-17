%% 说明
% this script generates the performance of your tracker and the baseline
% tracker on sequences with given attribute
% 相关代码结构
%{
tracking-benchmark/
    util/tightfig.m
    rstEval/
    analyse_CLE_overlap/ %本文件夹
%}

%% 正文
clc; clear; close all

addpath('../rstEval');
addpath('../util');

%% 画图设置
saveFileType = 'pdf'; % pdf/png
plot_overlap = true; % true false
plot_cle = true; % true false
save_path = 'figs\analyse';
gt_path = '..\anno';
result_path = '..\results';
FontName = 'Times'; % 'Times', 'Arial', 'Consolas'
TitleSize = 16;
TextSize = 12;
FigPos = [450 250 800 300]; % from the lower left point of your screen [xpos, ypos, xlength, ylength]
LineWidth = 1.5;
% 双线配色
% LineColor_ours = [0.8500 0.3250 0.0980]; % RGB as percentage
% LineColor_base = [0.3010 0.7450 0.9330]; % RGB as percentage
% TB-BiCF配色
LineColor_set = {...
    [1.00 0.00 0.00],...
    [0.00 1.00 1.00],...
    [1.00 0.00 1.00],...
    [0.00 0.00 0.00],...
    [0.00 0.00 1.00],...
    };
% 或者换种写法
% plotDrawStyle={
%             struct('color',[1,0,0],'lineStyle','-'),...
%             struct('color',[0,0,0],'lineStyle','-'),...
%             struct('color',[1,0,1],'lineStyle','-'),...%pink
%             struct('color',[0,1,0],'lineStyle','-'),...
%             struct('color',[0,0,1],'lineStyle','-'),...
%             };

%% 跟踪器设置

res_tracker_set = {...
    'KBiCF',...
    'BiCF',...
    'STRCF',...
    'CSRDCF',...
    'ECO_HC',...
    };

lgd_tracker_set = {...
    'TB-BiCF',...
    'BiCF',...
    'STRCF',...
    'CSR-DCF',...
    'ECO-HC',...
    };

%% 数据集与序列设置
% 主要对conseq进行调整
% seqs = configSeqs;
%% 直接复制perplot
dataset_cell = {'UAV123', 'UAV20L', 'UAV123_10fps', 'UAVDT', 'DTB70','VisDrone2018'};
dataset_all = [...
    ...struct('dataset', 'UAV123',       'dataPath', 'D:\TTTTTTracking\Dataset\UAV123\data_seq\UAV123'),...
    ...struct('dataset', 'UAV20L',       'dataPath', 'D:\TTTTTTracking\Dataset\UAV123\data_seq\UAV123'),...
    struct('dataset', 'UAV123_10fps', 'dataPath', 'D:\TTTTTTracking\Dataset\UAV123_10fps\data_seq\UAV123_10fps'),...
    struct('dataset', 'UAVDT',        'dataPath', 'D:\TTTTTTracking\Dataset\UAVDT\data_seq'),...
    struct('dataset', 'DTB70',        'dataPath', 'D:\TTTTTTracking\Dataset\DTB70'),...
    ...struct('dataset', 'VisDrone2018', 'dataPath', 'D:\TTTTTTracking\Dataset\VisDrone2018-SOT-test\data_seq'),...
    ];
%**********************************************************************

idx_dataset = find(ismember({dataset_all.dataset}, dataset_cell));
for idx = 1 : length(idx_dataset)
    dataset_cell_tmp{idx} = dataset_all(idx_dataset(idx)).dataset;
    dataPath_cell{idx} = dataset_all(idx_dataset(idx)).dataPath;
    annoPath_cell{idx} = ['.\anno\', dataset_cell_tmp{idx} , '\'];
end
dataset_cell = dataset_cell_tmp;
num_dataset = length(dataset_cell);
seq_sign = 'TB-BiCF';
for idx_dataset = 1 : num_dataset
    seq_temp = configSeqs(dataPath_cell{idx_dataset}, dataset_cell{idx_dataset}, seq_sign);
    seqs{idx_dataset} = seq_temp;
    % 取出序列seqs{idx_dataset}{1}
end

tracker_name = res_tracker_set(1);
baseline_name = res_tracker_set(2:end);

%% 循环画图
for i =1:size(seqs,2)
    
    % 数据载入
    if ~exist(save_path, 'dir')
        mkdir(save_path);
    end
    video_name = seqs{i}{1}.name;
    pred_name = [save_path '\' video_name];
    ground_truth = dlmread([gt_path '\' dataset_cell{i} '\' seqs{i}{1}.name '.txt']);
    
    for j = 1:numel(res_tracker_set)
        resmat{j} = load([result_path '\OPE_' dataset_cell{i} '\' res_tracker_set{j} '\' video_name  '_' res_tracker_set{j}  '.mat']);
        res{j} = resmat{j}.results{1};
        [aveCoverage{j}, aveErrCenter{j}, errCoverage{j}, errCenter{j}] = calcSeqErrRobust(res{j}, ground_truth);
    end
    seq_len =  seqs{i}{1}.endFrame - seqs{i}{1}.startFrame  + 1;
    frame_num = 1:seq_len;
    
    %% plot overlap success rate
    if plot_overlap
        overlap_fig = figure;
        for j = numel(res_tracker_set):-1:1
            if j==1
                plot(frame_num, errCoverage{j},'color',LineColor_set{j}, 'LineWidth', LineWidth+1);
            else
                plot(frame_num, errCoverage{j},'color',LineColor_set{j}, 'LineWidth', LineWidth);
            end
            hold on
        end
        
        set(gca,'XLim',[1, seq_len]);
        set(gca,'YLim',[0, 1]);
        set(gca, 'fontsize',TextSize,'fontname',FontName);
        set(gcf,'Position', FigPos)

        yticks([0:0.2:1])
        xlabel('Frame','fontweight','bold', 'FontSize', TitleSize, 'FontName', FontName)
        ylabel('Overlap', 'fontweight','bold', 'FontSize', TitleSize, 'FontName', FontName)
        legend(lgd_tracker_set,'location', 'southwest'); % northwest southwest
        % 是否grid
        set(gca,'Xgrid','on'); % 出现竖线
        set(gca,'Ygrid','on'); % 出现横线
        set(gca,'box','on')
        tightfig;
        saveFileName = [pred_name '_Overlap'];
        % 输出保存
        switch saveFileType
            case 'pdf'
                saveas(overlap_fig,[saveFileName '.pdf']); % pdf
            case 'png'
                saveas(overlap_fig,saveFileName,'png'); % png
            otherwise
                disp('Type error !')
        end
    end
    
    %% plot center location error
    if plot_cle
        centerErr_fig = figure;
        for j = numel(res_tracker_set):-1:1
            if j==1
                plot(frame_num, errCenter{j},'color',LineColor_set{j}, 'LineWidth', LineWidth+1);
            else
                plot(frame_num, errCenter{j},'color',LineColor_set{j}, 'LineWidth', LineWidth);
            end
            hold on
        end
        
        set(gca,'XLim',[1, seq_len]);
        set(gca, 'fontsize',TextSize,'fontname',FontName);
        set(gcf,'Position', FigPos)

        xlabel('Frame', 'fontweight','bold','FontSize', TitleSize, 'FontName', FontName)
        ylabel('Center Location Error', 'fontweight','bold','FontSize', TitleSize, 'FontName', FontName)
        legend(lgd_tracker_set,'location', 'southwest'); % northwest southwest
        % 是否grid
        set(gca,'Xgrid','on'); % 出现竖线
        set(gca,'Ygrid','on'); % 出现横线
        set(gca,'box','on')
        tightfig;
        saveFileName = [pred_name '_CLE'];
        % 输出保存
        switch saveFileType
            case 'pdf'
                saveas(gcf,[saveFileName '.pdf']); % pdf
            case 'png'
                saveas(gcf,saveFileName,'png'); % png
            otherwise
                disp('Type error !')
        end
    end
end