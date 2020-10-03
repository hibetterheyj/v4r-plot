# v4r-plot

> For better scientific plotting pipeline 😀

## At a glance

### Matlab

<details open>   <summary><b>算法复杂度曲线</b></summary> <div align="center"> <img src="https://raw.githubusercontent.com/hibetterheyj/v4r-plot/master/Yujie-plot/%E7%AE%97%E6%B3%95%E5%A4%8D%E6%9D%82%E5%BA%A6%E6%9B%B2%E7%BA%BF/complexityPlot.png" alt="算法复杂度曲线"> </div> </details>
<details open>   <summary><b>折线图-跟踪过程指标变化</b></summary> <div align="center"> <img src="https://raw.githubusercontent.com/hibetterheyj/v4r-matlab-plot/master/Yujie-plot/%E6%8A%98%E7%BA%BF%E5%9B%BE-%E8%B7%9F%E8%B8%AA%E8%BF%87%E7%A8%8BCLE%E5%8F%98%E5%8C%96%E5%9B%BE/S0601_Overlap.png" alt="折线图-跟踪过程指标变化"> </div> </details>
<details>   <summary><b>折线图-图中图</b></summary>   <div align="center"> <img src="https://raw.githubusercontent.com/hibetterheyj/v4r-matlab-plot/master/Yujie-plot/%E5%9B%BE%E4%B8%AD%E5%9B%BE/ReCF_succ_gH.png" alt="折线图-图中图"> </div> </details>
<details>   <summary><b>星星图-跟踪性能/运行速度图</b></summary>   <div align="center"> <img src="https://raw.githubusercontent.com/hibetterheyj/v4r-matlab-plot/master/Yujie-plot/%E6%98%9F%E6%98%9F%E5%9B%BE/TB_BiCF_prec_log_star.png" alt="星星图-跟踪性能/运行速度图"> </div> </details>
<details>   <summary><b>柱状图-两个y轴不同跟踪性能</b></summary>   <div align="center"> <img src="https://raw.githubusercontent.com/hibetterheyj/v4r-matlab-plot/master/Yujie-plot/%E6%9F%B1%E7%8A%B6%E5%9B%BE-%E5%A4%9A%E6%95%B0%E6%8D%AE%E9%9B%86(or%E6%B6%88%E8%9E%8D%E5%AE%9E%E9%AA%8C)%E5%88%86%E6%9E%90/yyaxis_bar_plot.png" alt="柱状图-两个y轴不同跟踪性能"> </div> </details>
---

## Detailed scripts

### Python

- [ ] 基本指令（画图，字体设置，字体大小，坐标轴字体，图片导出设置与Office系列的联动）
- [ ] 折线堆积图+透明度
- [ ] SLAM场景output/gt比较图

### Matlab

#### [Yujie-plot](https://github.com/hibetterheyj/v4r-matlab-plot/tree/master/Yujie-plot)

- [x] 折线与条形图（20200429，v1）
- [x] 折线图-跟踪过程CLE变化图（20200416，v2）
- [x] 星星图
  - [x] 普通版本（20200330，v2）
  - [x] Log版（20200417，v2）
- [x] 图中图（20200313，v1）
- [x] 棒棒糖图
- [x] 多角度响应图
- [x] 折线图-不同指标（20200415，v1）
- [x] 折线图-参数分析
  - [x] 添加额外垂直线，强调顶点（20200417，v1）
  - [x] 水平与垂直折线（20200416，v2）
- [x] 柱状图
  - [x] 多bar（20200406，v1）
  - [x] 单bar（20200415，v1）
  - [x] 左右轴多bar（20200426，v1）
- [x] 其他
  - 数据集尺度分析
  - 数据集挑战因素分析
- [x] 算法复杂度曲线|ComplexityPlot（20201004，v1）

#### [Fuling-plot](https://github.com/hibetterheyj/v4r-matlab-plot/tree/master/Fuling-plot)

- [x] TB-BiCF柱状图！（20200416，v1）

#### [Van-plot](https://github.com/hibetterheyj/v4r-matlab-plot/tree/master/Van-plot)

TODO

---

## 参考 | Reference

#### Python

- Matplotlib gallery: https://matplotlib.org/3.3.1/gallery/index.html
- [vacancy/**Jacinle**](https://github.com/vacancy/Jacinle): MIT前辈个人代码库(python)
- [Python 和数据科学笔记](https://website2.readthedocs.io/index.html)

#### Matlab

- [altmany/**export_fig**](https://github.com/altmany/export_fig): A MATLAB toolbox for exporting publication quality figures

- [MATLAB之折线图、柱状图、饼图以及常用绘图技巧](https://www.cnblogs.com/HZL2017/p/6880613.html)

- [Matlab用户需要一张画图速查表 | Matlab Plot Cheatsheet](https://zhuanlan.zhihu.com/p/112229373)

  ![MATLAB_cheatsheet](http://home.ustc.edu.cn/~pjer1316/img/cheatsheet_huge.png)
- [MATLAB之折线图、柱状图、饼图以及常用绘图技巧](https://www.cnblogs.com/HZL2017/p/6880613.html)