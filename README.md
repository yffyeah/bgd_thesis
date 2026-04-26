# 北京工业大学耿丹学院本科生毕业设计（论文）LaTeX 模板

## 1. 安装 TeX

本模板需要 TeX Live 2024 或更高版本。

### macOS 用户

推荐使用 MacTeX：

1. 下载地址：https://tug.org/mactex/
2. 下载完成后双击 `.pkg` 文件安装
3. 安装时间约 10-15 分钟

### Windows 用户

1. 下载地址：https://tug.org/texlive/
2. 下载 `texlive.iso` 并挂载
3. 运行 `install-tl-windows.bat`
4. 安装时间约 20-30 分钟

### Linux 用户

```bash
sudo apt-get install texlive-full  # Ubuntu/Debian
sudo yum install texlive-full      # CentOS/RHEL
```

## 2. 验证安装成功

安装完成后，打开终端（macOS/Linux）或 PowerShell（Windows），输入以下命令：

```bash
xelatex --version
```

如果显示类似以下内容，说明安装成功：

```
XeTeX 3.141592653-2.6-0.999996 (TeX Live 2024)
```

## 3. 修改章节内容

论文正文内容在 `contents` 文件夹中，每个章节对应一个 `.tex` 文件：

| 文件 | 内容 |
| --- | --- |
| `contents/chapter1.tex` | 第1章 绪论 |
| `contents/chapter2.tex` | 第2章 相关技术与理论 |
| `contents/chapter3.tex` | 第3章 模板系统的设计与实现 |
| `contents/chapter4.tex` | 第4章 实验验证 |
| `contents/chapter5.tex` | 第5章 参考文献格式说明 |
| `contents/chapter6.tex` | 第6章 AI 赋能 LaTeX 论文写作 |
| `contents/conclusion.tex` | 结论 |

用文本编辑器打开对应的文件，修改其中的内容即可。

## 4. 添加图片

1. 将图片文件放入 `figures` 文件夹
2. 支持的图片格式：`pdf`、`png`、`jpeg`
3. 在正文中引用图片：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/图片文件名.png}
    \caption{图片标题}
    \label{fig:example}
\end{figure}
```

## 5. 修改个人信息

打开 `main.tex` 文件，修改以下信息：

```latex
% 封面信息设置
\title{你的论文题目}
\author{你的姓名}
\college{你的学院}
\major{你的专业}
\class{你的班级}
\studentid{你的学号}
\advisor{你的导师}
\date{2025.06}
```

## 6. 添加参考文献

打开 `refs.bib` 文件，按照以下格式添加参考文献：

```bibtex
@article{key1,
  author = {作者},
  title = {文章标题},
  journal = {期刊名},
  year = {2025},
  volume = {1},
  pages = {1-10}
}

@book{key2,
  author = {作者},
  title = {书名},
  publisher = {出版社},
  year = {2025},
  address = {出版地}
}
```

在正文中引用时，使用 `\cite{key1}` 或 `\citep{key2}`。

## 编译论文

在终端中进入项目文件夹，执行以下命令编译论文：

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex
```

或者使用自动化工具：

```bash
latexmk -xelatex main.tex
```

编译成功后，会在当前文件夹生成 `main.pdf` 文件。

## 常见问题

**编译失败？**
> 确保使用 XeLaTeX 编译，而不是 pdflatex。

**图片显示不出来？**
> 检查图片路径是否正确，确保图片放在 `figures` 文件夹中。

**参考文献引用显示 [?]？**
> 按照"编译论文"的步骤多编译几次，LaTeX 需要多次编译才能解析引用。
