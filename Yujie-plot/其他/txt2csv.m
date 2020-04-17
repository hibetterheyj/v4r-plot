clc;clear;
dt=importdata('UAV123_10fps_scale_data.txt'); 
T=table(dt.rowheaders,dt.data(:,1),dt.data(:,2),...
    dt.data(:,3),dt.data(:,4),dt.data(:,5));
T.Properties.VariableNames = {'Seq','wbigger','hbigger','whequal','nan','initial_ratio'};
writetable(T,'test.csv');
% writetable(T,'test.csv');