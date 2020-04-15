### TODO 双折线图！

- `yyaxis`：https://ww2.mathworks.cn/help/matlab/ref/yyaxis.html

- `plotyy`：https://ww2.mathworks.cn/help/matlab/ref/plotyy.html

  不推荐使用 `plotyy`。请改用 [`yyaxis`](https://ww2.mathworks.cn/help/matlab/ref/yyaxis.html)。目前没有删除 `plotyy` 的计划。

  从 R2016a 开始，可以使用 `yyaxis` 函数创建具有两个 y 轴的图。`yyaxis` 函数相对于 `plotyy` 函数有多项优势。

  - 与 `plotyy` 不同，`yyaxis` 函数会创建一个具有两个 y 轴的 `Axes` 对象。`plotyy` 创建两个可能不同步的重叠 `Axes` 对象。
  - 您可以将 `yyaxis` 与任何二维绘图函数结合使用。`plotyy` 仅限于与 `function(x,y)` 形式的绘图函数结合使用。它不适用于其他绘图函数，例如 `errorbar`。

  

  下表显示了 `plotyy` 的一些典型用法，以及如何更新代码以改用 `yyaxis`。

  | 不推荐                                            | 推荐                                                         |
  | :------------------------------------------------ | :----------------------------------------------------------- |
  | `plotyy(x1,y1,x2,y2)`                             | `yyaxis left  plot(x1,y1)  yyaxis right  plot(x2,y2)`        |
  | `plotyy(x1,y1,x2,y2,... 'function1','function2')` | `yyaxis left  function1(x1,y1)  yyaxis right  function2(x2,y2)` |