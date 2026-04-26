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

## 3. 下载模板

本模板已托管在 GitHub 仓库，你可以直接下载或克隆：

```bash
git clone https://github.com/yffyeah/bgd_thesis.git
```

或者访问 https://github.com/yffyeah/bgd_thesis 点击 "Code" -> "Download ZIP" 下载压缩包。

## 4. 使用 IDE 打开

使用 Trae 或任何 vibe coding 的 IDE（如 VS Code）打开项目文件夹中的 `main.tex` 文件即可开始编辑。

## 5. 尝试编译

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

## 6. 修改个人信息

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

同时需要修改 `contents` 文件夹中的关键词和研究方向文件：

| 文件 | 内容 | 说明 |
| --- | --- | --- |
| `contents/keywords.tex` | 中文关键词 | 用中文分号隔开，3-7个 |
| `contents/researchdirection.tex` | 研究方向 | 中文填写 |
| `contents/keywordsen.tex` | 英文关键词 | 用英文分号隔开，与中文关键词对应 |
| `contents/researcharea.tex` | 英文研究领域 | 与中文研究方向内容相对应 |

## 7. 添加参考文献和图片

打开 `refs.bib` 文件，按照以下格式添加参考文献。

### 7.1 从知网导出 BibTeX 格式（推荐）

1. 打开知网（https://cnki.net），搜索你需要的文献
2. 点击文献标题进入详情页
3. 在页面右侧找到"导出/参考文献"按钮
4. 选择 "BibTeX" 格式，复制生成的代码
5. 将复制的代码粘贴到 `refs.bib` 文件中
图形化步骤参见 `main.pdf`。

### 7.2 手动添加示例（不推荐）

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

在正文中引用时：
- 使用 `\cite{key1}` 生成右上角角标格式
- 使用 `\citep{key1}` 生成行内数字格式 [1]

## 8.添加图片

1. 将图片文件放入 `figures` 文件夹
2. 支持的图片格式：`pdf`、`png`、`jpeg`
3. 在正文中插入图片：

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{figures/图片文件名.png}
    \caption{图片标题}
    \label{fig:example}
\end{figure}
```

4. 引用图片：

在正文中使用 `\ref{fig:example}` 命令引用图片，例如：

```latex
如 \ref{fig:example} 所示，这是一个示例图片。
```

系统会自动生成图片编号，如 "图1-1"。

## 9. 添加表格

1. 表格标题必须放在表格之前，使用 `\caption{表格标题}` 命令
2. 表格内字体建议使用小五号：`\zihao{-5}\songti`
3. 基本表格结构：

```latex
\begin{table}[htbp]
    \caption{表格标题}
    \centering
    \zihao{-5}\songti
    \begin{tabular}{ccc}
        \toprule
        列1 & 列2 & 列3 \\
        \midrule
        内容1 & 内容2 & 内容3 \\
        内容4 & 内容5 & 内容6 \\
        \bottomrule
    \end{tabular}
    \label{tab:example}
\end{table}
```

4. 引用表格：

在正文中使用 `\ref{tab:example}` 命令引用表格，例如：

```latex
如 \ref{tab:example} 所示，这是一个示例表格。
```

系统会自动生成表格编号，如 "表1-1"。

## 10. 常见问题

**编译失败？**
> 确保使用 XeLaTeX 编译，而不是 pdflatex。
> 
> 建议：如果遇到编译错误，可以将错误信息复制给 AI（如 ChatGPT、Claude 等），它们通常能快速识别并解决 LaTeX 编译问题。

**图片显示不出来？**
> 检查图片路径是否正确，确保图片放在 `figures` 文件夹中。

**参考文献引用显示 [?]？**
> 按照"编译论文"的步骤多编译几次，LaTeX 需要多次编译才能解析引用。
