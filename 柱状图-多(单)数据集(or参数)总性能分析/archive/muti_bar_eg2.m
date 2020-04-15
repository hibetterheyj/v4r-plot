%% 参考：
% 1. matlab画柱状图
% https://blog.csdn.net/it_beecoder/article/details/80168242

%% 正文：
data = [20.457, 45.578; 12.016, 22.422];
b = bar(data);
ch = get(b,'children');
set(gca,'XTickLabel',{'训练过程','测试过程'})
legend('基于类文档排名的分类算法','结合bigram的类文档排名分类算法');
ylabel('所用时间(单位:秒)');