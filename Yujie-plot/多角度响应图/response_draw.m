% 目的：载入'response.mat')，然后绘制不同角度响应图
%% 参考：
% 1. . matlab - surf
% https://ww2.mathworks.cn/help/matlab/ref/surf.html

%% 正文
% 添加tightfig
addpath('../');

% 数据
% 例子：TACF_group1_1_res415 KCC_group1_1_res415
name = 'KCC_group1_1_res415'; 
load([name '.mat']);

% FaceAlpha为透明度，数值越小越透明
S = surf(response,'FaceAlpha',0.9);
% 网格线
% S.EdgeColor = 'none'; % 无
% S.EdgeColor = [1 1 1]; % 白色
S.EdgeColor = [0.18 0.36 0.56];

% 完全俯视
az = 0;
el = 90;
% 旋转半俯视
% az = 45; % Z轴旋转角
% el = 30; % 俯视角
view(az, el);
tightfig;
% S.EdgeColor = 'none';
axis off
% axis equal

% 输出保存同名图片
% saveas(gcf,'example.pdf'); % pdf
saveas(gcf,[name '_俯视'],'png'); % png