% ============================================================
% 北京工业大学耿丹学院本科生毕业设计（论文）LaTeX 模板
% 文档类：gengdan-thesis.cls
% 版本：v1.0 (2026/04/24)
% 编译方式：XeLaTeX -> BibTeX -> XeLaTeX*2
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gengdan-thesis}[2026/04/24 v1.0 Beijing Gengdan Institute Thesis Template]

% ============================================================
% 1. 选项处理与基础文档类加载
% ============================================================
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{ctexart}%
}
\ProcessOptions\relax

% 基于 ctexart，小四号(12pt)作为 normalsize，单面打印
\LoadClass[UTF8,a4paper,zihao=-4,oneside]{ctexart}

% ============================================================
% 2. 必要宏包
% ============================================================
\RequirePackage{geometry}        % 页面设置
\RequirePackage{setspace}        % 行距控制
\RequirePackage{xeCJK}           % CJK 字体精细化控制
\RequirePackage{indentfirst}     % 首段缩进
\RequirePackage{titlesec}        % 标题格式（用于 paragraph 等低级标题）
\RequirePackage{titletoc}        % 目录格式
\RequirePackage{fancyhdr}        % 页眉页脚
\RequirePackage{caption}         % 图表标题
\RequirePackage{float}           % 浮动体控制
\RequirePackage{graphicx}        % 插图
\RequirePackage{amsmath}         % 数学公式
\RequirePackage{booktabs}        % 三线表
\RequirePackage{array}           % 表格列格式
\RequirePackage{longtable}       % 跨页表格
\RequirePackage{multirow}        % 表格多行合并
\RequirePackage{tabularx}        % 可变宽表格
\RequirePackage{enumitem}        % 列表环境
% 列表环境设置：段后不需要空行
\setlist[enumerate]{noitemsep, topsep=0pt, partopsep=0pt, parsep=0pt}
\setlist[itemize]{noitemsep, topsep=0pt, partopsep=0pt, parsep=0pt}
\RequirePackage{ulem}            % 下划线
\RequirePackage[sort&compress]{gbt7714}  % GB/T 7714-2015 参考文献
% 保持 cite 命令生成右上角的角标，让 citep 命令不生成右上角的角标
\let\oldcitep\citep
\renewcommand{\citep}[1]{\begingroup\citestyle{numbers}\oldcitep{#1}\endgroup}
\RequirePackage{hyperref}        % 超链接（最后加载）

% ============================================================
% 3. 页面设置
% ============================================================
\geometry{
    paperwidth=210mm,
    paperheight=297mm,
    top=2.54cm,
    bottom=2.54cm,
    left=3.17cm,
    right=3.17cm,
    headsep=1em
}

% ============================================================
% 4. 字体设置
% ============================================================
% 西文强制 Times New Roman（若系统无此字体，可换为 TeX Gyre Termes）
\IfFontExistsTF{Times New Roman}{%
    \setmainfont{Times New Roman}%
    \setsansfont{Times New Roman}%
    \setmonofont{Times New Roman}%
}{%
    \setmainfont{TeX Gyre Termes}%
    \setsansfont{TeX Gyre Termes}%
    \setmonofont{TeX Gyre Termes}%
}

% 字体配置：优先使用方正免费字体，Windows 系统使用微软雅黑作为备选
\ifcsname ifxetex\endcsname
    \ifxetex
        % 检查方正书宋字体是否存在
        \IfFontExistsTF{方正书宋-简体}{% 
            % 从本地文件夹加载方正免费字体
            \setCJKmainfont[Path=./方正免费字体/,BoldFont=方正黑体-简体]{方正书宋-简体}%
            \setCJKsansfont[Path=./方正免费字体/,BoldFont=方正黑体-简体]{方正黑体-简体}%
            \setCJKmonofont[Path=./方正免费字体/,BoldFont=方正黑体-简体]{方正仿宋-简体}%
        }{% 
            % Windows 系统字体配置，使用 微软雅黑 以接近 Word 显示效果
            \IfFontExistsTF{Microsoft YaHei}{% 
                \setCJKmainfont[BoldFont={Microsoft YaHei Bold},ItalicFont={Microsoft YaHei Light}]{Microsoft YaHei}%
                \setCJKsansfont[BoldFont={Microsoft YaHei Bold},ItalicFont={Microsoft YaHei Light}]{Microsoft YaHei}%
                \setCJKmonofont[BoldFont={Microsoft YaHei Bold},ItalicFont={Microsoft YaHei Light}]{Microsoft YaHei}%
            }{}
        }
    \fi
\fi

% 为中文字体设置伪斜体
\setCJKfamilyfont{zhitsong}[Path=./方正免费字体/,AutoFakeSlant=0.3]{方正书宋-简体}%

% 确保英文摘要等环境中的字体正确
\newcommand{\gengdan@setenglishfont}{%
    \normalfont\rmfamily%
}

% ============================================================
% 5. 行距与段落设置
% ============================================================
% 全局正文 1.5 倍行距（setspace 的 \onehalfspacing 已针对 LaTeX 优化，
% 对 12pt 正好的相当于 Word 的 1.5 倍行距）
\onehalfspacing

% 首行缩进 2 个中文字符
\setlength{\parindent}{2\ccwd}

% 段落段前段后 0.5 倍行距
\setlength{\parskip}{0.5\baselineskip}

% ============================================================
% 6. 章节标题格式（ctexset）
% ============================================================
% 计数器深度设置
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{3}

\ctexset{
    % 一级标题：黑体小二号居中，段前段后0.5行，多倍行距2.41
    section = {
        format        = \vspace*{-45pt}\centering\heiti\zihao{-2}\linespread{2.41}\selectfont,
        nameformat    = {},
        numberformat  = {},
        titleformat   = {},
        aftername     = \quad,
        beforeskip    = 0.5\baselineskip,
        afterskip     = 0.5\baselineskip,
        name          = {第,章},
        number        = \arabic{section}
    },
    % 二级标题：黑体小三号顶格，段前段后0行，1.5倍行距
    subsection = {
        format        = \heiti\zihao{-3},
        aftername     = \quad,
        beforeskip    = 0pt,
        afterskip     = 0pt,
        number        =  \arabic{section}.\arabic{subsection},
    },
    % 三级标题：黑体小四号顶格，段前段后0行，1.5倍行距
    subsubsection = {
        format        = \heiti\zihao{-4},
        aftername     = \quad,
        beforeskip    = 0pt,
        afterskip     = 0pt,
        number        =  \arabic{section}.\arabic{subsection}.\arabic{subsubsection},
    },
    % % 四级标题：宋体小四号顶格，run-in 格式，题序与标题间空一格
    % paragraph = {
    %     format        = \zihao{-4}\songti,
    %     numberformat  = \zihao{-4}\songti,
    %     aftername     = \hspace{1em},
    %     beforeskip    = 0pt,
    %     afterskip     = 0pt,
    %     runin         = true,
    %     number        =  \arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph},
    % },
    % % 五级标题保留标准定义，建议用户使用 enumerate/itemize
    % subparagraph = {
    %     format        = \zihao{-4}\songti,
    %     beforeskip    = 0pt,
    %     afterskip     = 0pt,
    %     runin         = true,
    %     number        =  \arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}.\arabic{subparagraph},
    % },
}

% ============================================================
% 修正目录页码：\section 前强制换页，且不影响 \section*
% ============================================================
% 将 \clearpage 从 section/format 中移出，确保 \addcontentsline 在断页之后执行，
% 避免目录中的页码比实际页码少 1。
\let\gengdan@oldsection\section
\renewcommand{\section}{%
    \@ifstar
        \gengdan@oldsection@s
        \gengdan@oldsection@ns
}
\newcommand{\gengdan@oldsection@s}{\gengdan@oldsection*}
\newcommand{\gengdan@oldsection@ns}{\clearpage\gengdan@oldsection}

% ============================================================
% 7. 目录格式（titletoc）
% ============================================================
% 目录标题改为"目  录"（两字之间空两格）
\renewcommand{\contentsname}{目\quad~录}

% 重定义目录命令，使其标题符合一级标题格式，但不进入目录自身
\renewcommand{\tableofcontents}{%
    \clearpage
    \section*{\contentsname}
    \vspace{0.5\baselineskip}
    {%
        \setstretch{0.5}%
        \@starttoc{toc}
    }%
}

% 一级目录：黑体小四号
\titlecontents{section}[0pt]
    {\heiti\zihao{-4}}
    {\thecontentslabel\quad}
    {}
    {\titlerule*[0.5pc]{.}\thecontentspage}

% 二级目录：宋体小四号
\titlecontents{subsection}[2\ccwd]
    {\zihao{-4}\songti}
    {\thecontentslabel\quad}
    {}
    {\titlerule*[0.5pc]{.}\thecontentspage}

% 三级目录：宋体小四号
\titlecontents{subsubsection}[4\ccwd]
    {\zihao{-4}\songti}
    {\thecontentslabel\quad}
    {}
    {\titlerule*[0.5pc]{.}\thecontentspage}



% ============================================================
% 8. 页眉页脚设置
% ============================================================
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\zihao{5}\songti\leftmark}
\fancyfoot[C]{\zihao{5}\thepage}
\renewcommand{\headrulewidth}{0.4pt}
%\renewcommand{\footrulewidth}{0pt}

% 定义一个命令来切换到正文模式（固定标题页眉）
\newcommand{\startmainbody}{%
    \clearpage
    \pagenumbering{arabic}
    \pagestyle{fancy}
    \fancyhead[C]{\zihao{5}\songti\gengdantitle}
    \thispagestyle{fancy}
}

% 定义标题命令，在标题设置后更新页眉
\newcommand{\gengdantitle}{基于 LaTeX 的毕业论文排版系统设计与实现}
\renewcommand{\title}[1]{%
    \gdef\@title{#1}
    \gdef\gengdantitle{#1}
}

% 封面、诚信承诺等使用 empty 样式
% ============================================================
% 9. 图表标题格式
% ============================================================
% 自定义字号命令供 caption 使用（需先声明）
\newcommand{\gengdan@captop}{\zihao{5}\songti}
\DeclareCaptionFont{gengdancap}{\gengdan@captop}

% 图表编号按章编排（图 1-1，表 1-1）
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

% 每章开始时重置图表公式计数器
\@addtoreset{figure}{section}
\@addtoreset{table}{section}
\@addtoreset{equation}{section}

% 图标题：五号宋体居中，序号与文字空一格，段前段后 6pt
\captionsetup[figure]{
    font          = gengdancap,
    labelsep      = space,
    justification = centering,
    skip          = 6pt,
    position      = below,
    singlelinecheck = on,
}

% 表标题：五号宋体居中，序号与文字空一格，段前段后 6pt
\captionsetup[table]{
    font          = gengdancap,
    labelsep      = space,
    justification = centering,
    skip          = 6pt,
    position      = above,
    singlelinecheck = on,
}

% ============================================================
% 10. 封面信息定义
% ============================================================
\newcommand{\@gengdantitle}{}
\renewcommand{\title}[1]{\gdef\@gengdantitle{#1}}

\newcommand{\@gengdanauthor}{}
\renewcommand{\author}[1]{\gdef\@gengdanauthor{#1}}

\newcommand{\@gengdancollege}{}
\newcommand{\college}[1]{\gdef\@gengdancollege{#1}}

\newcommand{\@gengdanmajor}{}
\newcommand{\major}[1]{\gdef\@gengdanmajor{#1}}

\newcommand{\@gengdanclass}{}
\newcommand{\class}[1]{\gdef\@gengdanclass{#1}}

\newcommand{\@gengdanstudentid}{}
\newcommand{\studentid}[1]{\gdef\@gengdanstudentid{#1}}

\newcommand{\@gengdanadvisor}{}
\newcommand{\advisor}[1]{\gdef\@gengdanadvisor{#1}}

\newcommand{\@gengdandate}{}
\renewcommand{\date}[1]{\gdef\@gengdandate{#1}}

% ============================================================
% 11. 封面生成命令
% ============================================================
\newcommand{\makecover}{%
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        \vspace*{2cm}
        {\zihao{-0}\heiti 北京工业大学耿丹学院}\par
        \vspace{0.6cm}
        {\zihao{-0}\heiti 毕业设计（论文）}\par
        \vspace{2.5cm}
        {\zihao{3}\songti \@gengdantitle}\par
        \vspace{3cm}
        \renewcommand{\arraystretch}{1.8}
        \begin{tabular}{r @{\hspace{1em}} l}
            \songti\zihao{3} 姓\quad\quad 名： & \zihao{3}\songti\underline{\makebox[10em][c]{\@gengdanauthor}} \\[0.2cm]
            \songti\zihao{3} 二级学院： & \zihao{3}\songti\underline{\makebox[10em][c]{\@gengdancollege} }\\[0.2cm]
            \songti\zihao{3} 专\quad\quad 业： & \zihao{3}\songti\underline{\makebox[10em][c]{\@gengdanmajor}} \\[0.2cm]
            \songti\zihao{3} 行政班级： & \zihao{3}\songti\underline{\makebox[10em][c]{\@gengdanclass}} \\[0.2cm]
            \songti\zihao{3} 学\quad\quad 号： & \zihao{3}\songti\underline{\makebox[10em][c]{\@gengdanstudentid}} \\[0.2cm]
            \songti\zihao{3} 指导教师： & \zihao{3}\songti\underline{\makebox[10em][c]{\@gengdanadvisor}} \\[0.2cm]
            \songti\zihao{3} 日\quad\quad 期： & \zihao{3}\songti\underline{\makebox[10em][c]{\@gengdandate}} \\[0.2cm]
        \end{tabular}
    \end{center}
    \clearpage
}

% ============================================================
% 12. 诚信承诺页
% ============================================================
\newcommand{\makepromise}{%
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        \vspace*{1cm}
        {\zihao{-2}\heiti 诚信承诺}\par
    \end{center}
    \vspace{1cm}
    {\zihao{-2}\songti
    % \setstretch{1.5}
    \quad\quad 本人 \underline{\makebox[4em]{\includegraphics[width=4em]{figures/signature.png}}} 声明，本论文及其研究工作是由本人在导师指导下独立完成，论文所利用的一切资料均符合论文著作要求，且在参考文献中列出。\par
    \vspace{4cm}
    \begin{flushright}
    签名：\underline{\makebox[3em]{\includegraphics[width=3em]{figures/signature.png}}} \hspace{0.5em} 日期：\underline{\makebox[2.5cm]{\@gengdandate}} \par
    \end{flushright}
    }
    \vfill
    \clearpage
}

% ============================================================
% 13. 中文摘要环境
% ============================================================
\newenvironment{cabstract}{%
    % \clearpage
    \fancyhead[C]{\zihao{5}\songti 摘\quad~要}
    \markboth{摘\quad~要}{摘\quad~要}
    \thispagestyle{fancy}
    \section*{摘\quad~要}
    \addcontentsline{toc}{section}{摘\quad~要}
    \pagenumbering{Roman}
    \vspace{0.5\baselineskip}
    \setstretch{1.5}
    \setlength{\parindent}{2\ccwd}
}{%
    \vspace{0.5\baselineskip}
    % \clearpage
}

\newcommand{\researchdirection}[1]{%
    \par\vspace{0.5\baselineskip}
    \noindent{\heiti\zihao{-4}研究方向：}{\zihao{-4}\songti #1}%
    \par
}

\newcommand{\keywords}[1]{%
    \vspace{0.5\baselineskip}
    \noindent{\heiti\zihao{-4}关键词：}{\zihao{-4}\songti #1}%
    \par
}

% ============================================================
% 14. 英文摘要环境
% ============================================================
\newenvironment{eabstract}{%
    \clearpage
    \fancyhead[C]{\zihao{5}\rmfamily\textbf{Abstract}}
    \markboth{Abstract}{Abstract}
    \thispagestyle{fancy}
    \section*{Abstract}
    \addcontentsline{toc}{section}{Abstract}
    \vspace{0.5\baselineskip}
    \gengdan@setenglishfont
    % \setstretch{1.5}
    \setlength{\parindent}{0pt}   % 英文摘要首行顶格（不缩进）
}{%
    \vspace{0.5\baselineskip}
    \clearpage
}

\newcommand{\researcharea}[1]{%
    \vspace{0.5\baselineskip}
    \noindent{\bfseries\zihao{-4} Research Area: }{\zihao{-4} #1}%
    \par
}

\newcommand{\keywordsen}[1]{%
    \vspace{0.5\baselineskip}
    \noindent{\bfseries\zihao{-4} Key Words: }{\zihao{-4} #1}%
    \par
}

% ============================================================
% 15. 正文切换命令（页码从阿拉伯数字 1 开始）
% ============================================================
\newcommand{\mainmatter}{%
    \startmainbody
    \counterwithin{section}{part}
}

% ============================================================
% 16. 便捷命令：结论、附录、致谢（无编号一级标题）
% ============================================================
\newcommand{\makeconclusion}{%
    \clearpage
    \section*{结\ \ 论}%
    \addcontentsline{toc}{section}{结\ \ 论}%
}

\newcommand{\makeappendix}{%
    \clearpage
    \section*{附\ \ 录}%
    \addcontentsline{toc}{section}{附\ \ 录}%
}

\newcommand{\makeacknowledgement}{%
    \clearpage
    \section*{致\ \ 谢}%
    \addcontentsline{toc}{section}{致\ \ 谢}%
}

% ============================================================
% 17. 参考文献标题处理
% ============================================================
% 将参考文献标题重定义延迟到文档开始，以覆盖 gbt7714 的设置
\AtBeginDocument{%
    \def\bibsection{%
        \section*{参考文献}%
        \addcontentsline{toc}{section}{参考文献}%
        \@mkboth{\MakeUppercase{\bibname}}{\MakeUppercase{\bibname}}%
    }%
}

% 参考文献条目格式：宋体/ Times New Roman 小四号，1.5 倍行距，段前段后 0.5 行
% 通过重定义 thebibliography 环境实现
\let\oldthebibliography\thebibliography
\let\endoldthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{%
    \clearpage%
    \oldthebibliography{#1}%
    % \setstretch{1.5}%
    \zihao{-4}\songti%
}{%
    \endoldthebibliography%
}

% ============================================================
% 18. 浮动体参数优化（减少图表分页概率）
% ============================================================
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{3}
\setcounter{totalnumber}{6}

% ============================================================
% 19. 超链接设置（最后加载以保证稳定）
% ============================================================
\hypersetup{
    colorlinks = true,
    linkcolor  = black,
    citecolor  = black,
    urlcolor   = black,
    bookmarksnumbered = true,
    pdfdisplaydoctitle = true,
}

% ============================================================
% 19. Demo 命令
% ============================================================
\newif\ifshowdemo

\newsavebox\demobox
\newenvironment{demoenv}{%
    \ifshowdemo%
        \begin{trivlist}\item[\CJKfamily{zhitsong}\textit{\textcolor{red}{\textbf{注：}}}]%
        \color{red}\CJKfamily{zhitsong}\ignorespaces%
    \fi%
}{%
    \ifshowdemo%
        \par%
        \end{trivlist}%
    \fi%
}

\newcommand{\demo}[1]{%
    \ifshowdemo%
        \par{\color{red}\CJKfamily{zhitsong}\textit{#1}}\par%
    \fi%
}

% ============================================================
% 20. 结束
% ============================================================
\endinput