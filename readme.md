## v4r-matlab-plot

😀 to be continued !

### TODO

- [ ] 读取表格

  - [ ] 带指标描述的xlsx

  - [ ] 不带指标的xlsx（可以见星星图）

    ```matlab
    C = readcell('KBCF_UAVDT_data.xlsx');
    
    TrkSet = C(:,1);
    prec = cell2mat(C(:,2));
    succ = cell2mat(C(:,3));
    fps = cell2mat(C(:,4));
    FPSSet = C(:,4);
    SourceSet = C(:,5);
    ```

- [ ] 双折线图

- [ ] 折线图不同时间段

- [ ] 玫瑰图
  - https://ww2.mathworks.cn/matlabcentral/fileexchange/59561-spider_plot
  - https://blogs.mathworks.com/pick/2020/02/07/spider-plot-ii-custom-charts-intro/
  
- [ ] 热力图
  
  - https://blogs.mathworks.com/pick/2017/04/07/r2017a-heatmap/

### Finished

- [x] 星星图
  - [x] 普通版本（20200330，v2）
  - [x] Log版（20200330，v1）
- [x] 图中图（20200313，v1）
- [x] 棒棒糖图
- [x] 多角度响应图
- [x] 折线图-不同指标（20200415，v1）
- [x] 折线图-参数分析
- [x] 柱状图
  - [ ] 多bar（20200406，v1）
  - [ ] 单bar（20200415，v1）
- [x] 其他
  - 数据集尺度分析
  - 数据集挑战因素分析

### File Exchange Pick of the Week

- Spider Plot

  https://blogs.mathworks.com/pick/2020/02/07/spider-plot-ii-custom-charts-intro/

  https://blogs.mathworks.com/pick/2020/02/14/spider-plot-iii-custom-charts-authoring/

- Heatmap

  https://blogs.mathworks.com/pick/2017/04/07/r2017a-heatmap/

- Subplot Position Calculator

  https://blogs.mathworks.com/pick/2017/05/19/subplot-position-calculator/

- Non-Uniform Contourf

  https://blogs.mathworks.com/pick/2018/01/12/non-uniform-contourf/

- Draggable Data Tips 可拖动小标签

  https://blogs.mathworks.com/pick/2019/02/08/draggable-data-tips/

- Multi-column legend, revisited 多行标签

  https://blogs.mathworks.com/pick/2019/03/22/multi-column-legend-revisited/

- Py_Addpath 运行python代码

  https://blogs.mathworks.com/pick/2019/12/06/py_addpath/

### 参考 | Reference

- [altmany/**export_fig**](https://github.com/altmany/export_fig): A MATLAB toolbox for exporting publication quality figures
- [vacancy/**Jacinle**](https://github.com/vacancy/Jacinle): MIT大佬个人代码库(python)