# 北京工业大学耿丹学院本科生毕业设计（论文）LaTeX 模板

## 文件清单

| 文件名 | 说明 |
| --- | --- |
| `gengdan-thesis.cls` | **核心模板文件**，包含全部格式定义 |
| `main.tex` | 示例论文源文件，可直接参考其结构撰写 |
| `refs.bib` | BibTeX 参考文献数据库示例（可选） |

## 编译方式

推荐使用 **XeLaTeX** 编译，完整流程如下：

### 情况一：不使用 BibTeX（手动编写参考文献）

```bash
xelatex main.tex
xelatex main.tex
```

### 情况二：使用 BibTeX 管理参考文献（推荐）

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

> **注意**：若使用 BibTeX，请将 `main.tex` 中参考文献部分的手写 `thebibliography` 环境替换为：
> ```latex
> \bibliographystyle{gbt7714-numerical}
> \bibliography{refs}
> ```

## 模板格式对照表

| 模板要求 | LaTeX 实现 |
| --- | --- |
| 一级标题（第X章/摘要/Abstract/目录/结论/参考文献/附录/致谢）：黑体小二号居中，行距2.41 | `\section{标题}` 或 `\section*{标题}` |
| 二级标题：黑体小三号顶格，1.5倍行距 | `\subsection{标题}` |
| 三级标题：黑体小四号顶格，1.5倍行距 | `\subsubsection{标题}` |
| 四级标题：宋体小四号，run-in | `\paragraph{标题}` |
| 正文：宋体小四号，首行缩进2字符，1.5倍行距 | 直接书写即可 |
| 图表编号（图1-1、表1-1） | 自动按章编号 |
| 参考文献：GB/T 7714-2015 | 由 `gbt7714` 宏包自动处理 |
| 引用上角标 `[1]` | `\cite{key}` |
| 行内引用 `[1]` | `\citep{key}` |

## 论文结构撰写指南

```latex
\documentclass{gengdan-thesis}

% 1. 填写封面信息
\title{论文题目}
\author{姓名}
\college{信息工程学院}
\major{计算机科学与技术}
\class{计算机2101-1班}
\studentid{20210001}
\advisor{李四}
\date{2025.04}

\begin{document}

% 2. 封面与诚信承诺（无页码）
\makecover
\makepromise

% 3. 中文摘要（页码：I, II, ...）
\begin{cabstract}
摘要内容...
\researchdirection{计算机应用；人工智能}
\keywords{关键词1；关键词2；关键词3}
\end{cabstract}

% 4. 英文摘要（页码继续罗马数字）
\begin{eabstract}
Abstract content...
\researcharea{Computer Application; Artificial Intelligence}
\keywordsen{keyword1; keyword2; keyword3}
\end{eabstract}

% 5. 目录
\tableofcontents

% 6. 正文（页码切换为阿拉伯数字 1, 2, 3...）
\mainmatter

\section{绪论}
\subsection{研究背景}
正文内容...

\section{第2章标题}
...

% 7. 结论（无编号一级标题）
\makeconclusion
结论内容...

% 8. 参考文献
\begin{thebibliography}{99}
\bibitem{key1} 作者. 标题[M]. 出版地: 出版社, 年份.
\end{thebibliography}
% 或采用 BibTeX：
% \bibliographystyle{gbt7714-numerical}
% \bibliography{refs}

% 9. 附录（可选）
\makeappendix
...

% 10. 致谢
\makeacknowledgement
致谢内容...

\end{document}
```

## 注意事项

1. **字数统计**：模板本身不限制字数，但请遵守学校对不同专业的字数要求（工学类不少于 7000 字，文管类不少于 8000 字，艺术类不少于 5000 字）。
2. **图表环境**：表标题（`\caption`）必须放在 `\begin{tabular}` 之前；图标题必须放在 `\includegraphics` 之后。
3. **表格内字体**：模板要求表格内文字为小五号。建议在 `tabular` 环境前手动添加 `\zihao{-5}\songti`。
4. **系统字体**：模板默认调用 `Times New Roman` 作为西文字体。若 Linux 系统无此字体，会自动回退到 `TeX Gyre Termes`（效果一致）。
5. **诚信承诺**：打印后需在签名处手写签字，日期须与封面日期一致。

## 常见问题

**Q1：参考文献标题没有出现在目录中？**
> 请确认使用了 `\bibliographystyle{gbt7714-numerical}` + `\bibliography{refs}`，或手动环境 `\begin{thebibliography}`。模板已自动将参考文献标题加入目录。

**Q2：如何插入图片？**
> ```latex
> \begin{figure}[htbp]
>     \centering
>     \includegraphics[width=0.8\textwidth]{image.png}
>     \caption{图片标题}
>     \label{fig:label}
> \end{figure}
> ```

**Q3：如何输入公式？**
> 行内公式：`$E=mc^2$`
> 独立编号公式：
> ```latex
> \begin{equation}
>     x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
>     \label{eq:label}
> \end{equation}
> ```

---

如有问题，可根据学校模板要求自行微调 `gengdan-thesis.cls` 中的参数，或咨询指导教师。
