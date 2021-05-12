1. 设置解析器为`none`，`tex`或`latex`

   - 初始版本

     ```matlab
     set(gca,'TickLabelInterpreter','latex');
     ```

     参考：[【Matlab】设置XTick标签显示格式为LaTeX格式](https://blog.csdn.net/zyxhangiian123456789/article/details/87818320)

   - **优化版本**

     ```matlab
     % 会同时x/y轴的解析器为latex
     % set(gca,'TickLabelInterpreter','latex');
     ax.XAxis.TickLabelInterpreter = 'latex'; %避免全局收到干扰
     set(gca,'XTickLabel',{'baseline','\textbf{Ours}'})
     ```

2. 设置字体，字号与加粗

   ```
   fontSize = 13;
   % Times 字体
   ylabel(yLabelName1,'fontsize',fontSize,'fontname','Times New Roman','fontweight','bold'); % 纵轴名称
   set(gca,'FontName','Times New Roman','fontSize',fontSize); % 设置坐标轴值字体
   % 默认无衬线字体
   % ylabel(yLabelName1,'fontsize',fontSize,'fontweight','bold'); % 纵轴名称
   % set(gca,'fontSize',fontSize); % 设置坐标轴值字体
   ```

3. 输出为pdf

   ```matlab
   % https://ww2.mathworks.cn/help/matlab/ref/print.html
   print(saveName,'-dpng');
   print(saveName,'-dpdf','-bestfit'); % '-bestfit' | '-fillpage'
   print(saveName,'-dtiffn');
   print(saveName,'-deps');
   
   % 输出保存(不建议使用)
   saveas(gcf,'example.pdf'); % pdf
   saveas(gcf,'example','png'); % png
   ```

4. 坐标轴保留同样的小数位数

   ```matlab
   % 矫正ytick全为保留三位小数
   set(gca,'ytick',(0.35:0.02:0.47))
   set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.2f'))
   % 矫正xtick全为保留三位小数
   set(gca,'ytick',(0.01:0.002:0.03))
   set(gca,'yTickLabel',num2str(get(gca,'yTick')','%.3f'))
   ```

5. 输出保留位数

   ```matlab
   set(gca,'XTickLabel',num2str(get(gca,'XTick')','%.2f'))
   set(gca,'XTickLabel',num2str(num,'%.3f'))
   ```

6. 生成垂线

   ```
   % 1、绘制垂直于x轴的垂线
   line([xvalue xvalue],[y1 y2])；
   % 比如绘制x=5  y取值为[0,10]；
   line([5 5],[0 10]);
   
   % 2、绘制垂直于y轴的垂线
   line([x1 x2], [yvalue yvalue])；
   % 比如绘制y=5  x取值为[0,10]；
   line([0 10],[5 5],'linestyle','--', 'Color','r', 'LineWidth', 2);
   ```

7. 柱状图添加标签

   ```matlab
   % 手动文字添加文字标签
   % 'HorizontalAlignment' - 相对于位置点水平对齐文本，我们使用'center'！
   % 'left' （默认） | 'center' | 'right'
   % 'VerticalAlignment' - 相对于位置点水平对齐文本，我们使用'bottom'！
   % 'middle' （默认） | 'top' | 'bottom' | 'baseline' | 'cap'
   for i = 1 : size(y, 1)
       if i == size(y, 1)
           text(x(i)+centerOffset, y(i,2), num2str(y(i,2)','%.3f'),...
               'fontname','Times New Roman','FontSize',textFontSize,'fontweight','bold','HorizontalAlignment','center','VerticalAlignment','bottom');
       else
           text(x(i)+centerOffset, y(i,2), num2str(y(i,2)','%.3f'),...
               'fontname','Times New Roman','FontSize',textFontSize,'HorizontalAlignment','center','VerticalAlignment','bottom');
       end
   end
   ```

8. 坐标轴倾斜角度

   ```matlab
   xticks(1:9);
   % 倾斜45度
   xtickangle(45);
   xticklabels({'Background clutter','Large occlusion','Object blur',...
       'Small object','Illumination variation','Scale variations',...
       'Camera motion','Object motion','Long-term tracking'})
   ```

9. 读取表格

   - 带指标描述的xlsx（参考自星星图）

     ```matlab
     C = readcell('KBCF_UAVDT_data.xlsx');
     
     % 比如到第九个跟踪器/第十组参数
     TrkSet = C(2:10,1);
     prec = cell2mat(C(2:10,2));
     succ = cell2mat(C(2:10,3));
     fps = cell2mat(C(2:10,4));
     FPSSet = C(2:10,4);
     SourceSet = C(2:10,5);
     ```

   - 不带指标的xlsx（直接成列实验结果与相关参数，参考自星星图）

     ```matlab
     C = readcell('KBCF_UAVDT_data.xlsx');
     
     TrkSet = C(:,1);
     prec = cell2mat(C(:,2));
     succ = cell2mat(C(:,3));
     fps = cell2mat(C(:,4));
     FPSSet = C(:,4);
     SourceSet = C(:,5);
     ```

10. yyaxis设置坐标轴颜色 [[来源](https://www.mathworks.com/matlabcentral/answers/451917-black-axes-for-yyaxis-not-default-blue-and-orange)]

   ```matlab
   figure
   yyaxis left
   plot((1:10), rand(1, 10), 'g')
   yyaxis right
   plot((5:15), sin((5:15)/5), 'r')
   ax = gca;
   ax.YAxis(1).Color = 'k';
   ax.YAxis(2).Color = 'k';
   ```

11. 设置柱状图颜色

   ```matlab
   peakNum = 4;
   % 设置整体条形图颜色
   h1=bar(x_param, y_param(1:end),barWidth,...
       'EdgeColor',[0.90,0.90,0.90],...
       'FaceColor',[0.90,0.90,0.90]); % 浅灰
       ...'EdgeColor',[0.99,0.70,0.90],...
       ...'FaceColor',[0.99,0.70,0.90]); % 浅蓝
       ...'EdgeColor',[0.99,0.97,0.60],...
       ...'FaceColor',[0.99,0.97,0.60]); % 浅黄
   h1.FaceColor = 'flat';
   % 调整单条颜色,peakNum为对应条索引
   h1.CData(peakNum,:) = [0.89,0.76,0.70]; 
   ```

   