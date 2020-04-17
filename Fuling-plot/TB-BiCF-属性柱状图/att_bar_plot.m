clear; close all;

% 是否保存为PDF
save_pdf = true; % false, true

% 确定区域
metric = 'succ';

switch metric
    case 'succ'
        att_all = [...
            struct('dataset', 'UAV123@10fps', 'range', 'A21:N37'),...
            struct('dataset', 'DTB70',        'range', 'A97:M113'),...
            struct('dataset', 'UAVDT',        'range', 'A59:K75'),...
            ];
        metric_name = 'Success rate';
    case 'prec'
        
        metric_name = 'Precision';
end

% 确定要的跟踪器
% 建议把自己的tracker放config最上面, 这样legend最上面是自己的
trackers = configTrackers(3);
for idx_trk = 1:length(trackers)
    trk_name_cell{idx_trk} = trackers{idx_trk}.name; %#ok<SAGROW> % 获取跟踪器名称
    trk_namePaper_cell{idx_trk} = trackers{idx_trk}.namePaper; %#ok<SAGROW> % 获取跟踪器名称
end

for idx_att = 1:length(att_all)
    
    att_range = att_all(idx_att).range;
    
    % 加载表格
    sheet_name = 'att_res_summarized'; % Sheet名字
    att_table = readtable('./att_table.xlsx', 'Sheet', sheet_name, 'Range', att_range, 'ReadRowNames', true);
    
    % 显示所需数据, 防止出错
    useful_att_table = att_table(trk_name_cell, :) %#ok<NOPTS>
    
    % bar使用参考: https://ww2.mathworks.cn/matlabcentral/fileexchange/35271-matlab-plot-gallery-vertical-bar-plot
    % bar所需数据
    num_att = length(useful_att_table.Properties.VariableNames) - 1; % 属性个数, 不要最后一列的overall数据
    useful_att_data = useful_att_table{:,1:num_att} %#ok<NOPTS> % 表格数据, 行表示每个跟踪器
    % 构建bar
    figure;
    att_bar = bar(1:num_att, useful_att_data', 1); % bar横坐标为属性, 每个属性所需的数据应为行向量
    % 设置坐标轴显示范围
    xlim = [0.4, num_att+0.6]; % 防止横坐标的柱状图顶着边缘
    ylim = [0, ceil(max(useful_att_data(:))*10)/10];
    axis([xlim, ylim]);
    % 定义字体、大小
    font_name = 'Times New Roman';
    font_size = 9;
    % 设置tick内容、大小、字体
    set(gca, 'XTickLabel', useful_att_table.Properties.VariableNames(1,1:num_att),'FontSize',font_size,'FontName',font_name);
    % 设置y轴显示间隔
    set(gca,'yTick',0:0.1:0.6);
    % 设置标题与坐标轴的内容、大小、字体
    title(['Attributes from ', att_all(idx_att).dataset, ' benchmark']);
%     xlabel('Attributes','FontSize',font_size,'FontName',font_name);
    ylabel(metric_name,'FontSize',font_size,'FontName',font_name,'FontWeight','bold');
    if idx_att == 3
    lgd = legend(trk_namePaper_cell, 'Location', 'southoutside','FontSize',font_size); % 设置图例, 为跟踪器名称
    lgd.NumColumns = 5;
    end
    % 显示网格
    grid on;
    % 设置图大小, [x,y,w,h]
    width = 1000;
    height = 128;
    x_pos = 100;
    if idx_att == 1
        y_pos = 100;
    else
        y_pos = y_pos+height*1.4;
    end
    if idx_att == 3
        height = 180;
    end
    set(gcf,'Position',[x_pos y_pos width height]);
    
    % bar上显示数值
    % xtips1 = att_bar(1).XEndPoints;
    % ytips1 = att_bar(1).YEndPoints;
    % labels1 = string(roundn(att_bar(1).YData, -3));
    % text(xtips1,ytips1,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom'); % 水平方向数值
    % text(xtips1,ytips1,labels1,'HorizontalAlignment','left','VerticalAlignment','middle', 'rotation',90); % 垂直方向数值
    
    % 设置bar颜色
    % 0:默认配色; 1:与定性分析序列图一致颜色; 2:小清新;
    % 3:还行; 4:
    plotDrawStyleAll = plotSetting(3);
    % 设置bar柱面颜色
    att_bar(1).FaceColor = plotDrawStyleAll{1}.color;
    att_bar(2).FaceColor = plotDrawStyleAll{2}.color;
    att_bar(3).FaceColor = plotDrawStyleAll{3}.color;
    att_bar(4).FaceColor = plotDrawStyleAll{4}.color;
    att_bar(5).FaceColor = plotDrawStyleAll{5}.color;
    % 设置bar框颜色
    % 'None':无边框; [1,1,1]:白边框; [0,0,0]:黑边框
    bar_edge_color = [0,0,0];
    att_bar(1).EdgeColor = bar_edge_color;
    att_bar(2).EdgeColor = bar_edge_color;
    att_bar(3).EdgeColor = bar_edge_color;
    att_bar(4).EdgeColor = bar_edge_color;
    att_bar(5).EdgeColor = bar_edge_color;
    
    if save_pdf
        save_name = ['./att_bar', '_', att_all(idx_att).dataset, '_', metric, '.pdf'];
        tightfig; % 去除图片白边
        print(gcf,'-dpdf', save_name);
    end
end