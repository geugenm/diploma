\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsu}[2024/03/24 BSU Report Class v1.0]

\LoadClass[14pt, a4paper]{extreport}

%-------------------------------------------------------------------------------
%    Language and encoding
%-------------------------------------------------------------------------------
\RequirePackage[main=russian, english]{babel}

%-------------------------------------------------------------------------------
%    Fonts and typography
%-------------------------------------------------------------------------------
\RequirePackage{fontspec}
\setmainfont{Liberation Serif}

%-------------------------------------------------------------------------------
%    Core packages
%-------------------------------------------------------------------------------
\RequirePackage{graphicx}
% BSU margins: left 30mm, right 10mm, top/bottom 20mm
\RequirePackage[a4paper, left=30mm, right=10mm, top=20mm, bottom=20mm, includefoot]{geometry}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{subcaption}
\RequirePackage{authblk}
\RequirePackage{amsmath}
\RequirePackage{listings}
\RequirePackage{textcomp}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{hyperref}
\RequirePackage{array}
\RequirePackage{caption}
\RequirePackage{xcolor}

\RequirePackage{microtype}
\microtypesetup{protrusion=false}

\setlength{\emergencystretch}{10em}

%-------------------------------------------------------------------------------
%    Page numbering and headers/footers (BSU standard)
%-------------------------------------------------------------------------------
\pagenumbering{arabic}

% Page numbering at bottom center as per BSU requirements
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Special style for chapter pages
\fancypagestyle{plain}{
	\fancyhf{}
	\fancyfoot[C]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}

%-------------------------------------------------------------------------------
%    List configuration
%-------------------------------------------------------------------------------
\setlist[itemize]{noitemsep, topsep=0pt, partopsep=0pt, parsep=0pt}

%-------------------------------------------------------------------------------
%    Heading configuration (BSU style)
%-------------------------------------------------------------------------------
% Chapter format - centered, uppercase per BSU requirements
\titleformat{\chapter}[display]
{\normalfont\large\bfseries\centering}
{\MakeUppercase{\chaptertitlename\ \thechapter}}
{0pt}
{\large\centering\MakeUppercase}
\titlespacing*{\chapter}{0pt}{0pt}{15pt}

% Section format with proper BSU indentation
\titleformat{\section}[hang]
{\normalfont\Large\bfseries}
{\thesection}
{1em}
{\raggedright}
\titlespacing*{\section}{1.25cm}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% Subsection format
\titleformat{\subsection}[hang]
{\normalfont\bfseries}
{\thesubsection}
{1em}
{\raggedright}
\titlespacing*{\subsection}{1.25cm}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

% Subsubsection format
\titleformat{\subsubsection}[hang]
{\normalfont\bfseries}
{\thesubsubsection}
{1em}
{\raggedright}
\titlespacing*{\subsubsection}{1.25cm}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

% Header/footer marks
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\arabic{section}.\ #1}}

%-------------------------------------------------------------------------------
%    Table configuration
%-------------------------------------------------------------------------------
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Table captions
\addto\captionsrussian{\renewcommand{\tablename}{Таблица}}

%-------------------------------------------------------------------------------
%    Code listing configuration
%-------------------------------------------------------------------------------
\lstdefinestyle{bsustyle}{
	commentstyle=\color{gray}\itshape,
	keywordstyle=\color{black}\bfseries,
	stringstyle=\color{black}\ttfamily,
	basicstyle=\ttfamily\footnotesize,
	numbers=left,
	numberstyle=\tiny,
	stepnumber=1,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=4,
	breaklines=true,
	breakatwhitespace=false,
	captionpos=b,
	frame=single,
	framesep=2pt
}

\lstset{style=bsustyle}

%-------------------------------------------------------------------------------
%    Links and footnotes configuration
%-------------------------------------------------------------------------------
\hypersetup{
	colorlinks=false,
	pdfborder={0 0 0},
}

\renewcommand{\thefootnote}{\arabic{footnote}}

%-------------------------------------------------------------------------------
%    Line spacing and paragraph configuration (BSU requirements)
%-------------------------------------------------------------------------------
\onehalfspacing % 1.5 spacing as required by BSU
\setlength{\parindent}{1.25cm} % BSU standard paragraph indent
\linespread{1.5}

%-------------------------------------------------------------------------------
%    Figure caption configuration
%-------------------------------------------------------------------------------
\addto\captionsrussian{\renewcommand{\figurename}{Рисунок}}

\renewcommand{\@makecaption}[2]{%
	\vskip\abovecaptionskip
	\sbox\@tempboxa{#1 \textemdash\ #2}%
	\ifdim\wd\@tempboxa >\hsize
		#1 \textemdash\ #2\par
	\else
		\global\@minipagefalse
		\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
	\fi
	\vskip\belowcaptionskip}

\renewcommand{\thefigure}{\@arabic\c@figure}

%-------------------------------------------------------------------------------
%    BSU-specific environments
%-------------------------------------------------------------------------------
% Abstract/Summary page (реферат)
\newenvironment{bsuabstract}{%
	\clearpage
	\thispagestyle{empty}
	\begin{center}
		\textbf{\large РЕФЕРАТ}
	\end{center}
	\vspace{1em}
	\addcontentsline{toc}{chapter}{РЕФЕРАТ}
}{\clearpage}

% List of abbreviations
\newenvironment{abbreviations}{%
	\clearpage
	\chapter*{ПЕРЕЧЕНЬ УСЛОВНЫХ ОБОЗНАЧЕНИЙ}
	\addcontentsline{toc}{chapter}{ПЕРЕЧЕНЬ УСЛОВНЫХ ОБОЗНАЧЕНИЙ}
}{}

% Conclusion environment
\newenvironment{conclusion}{%
	\clearpage
	\chapter*{ЗАКЛЮЧЕНИЕ}
	\addcontentsline{toc}{chapter}{ЗАКЛЮЧЕНИЕ}
}{}

%-------------------------------------------------------------------------------
%    Title page (BSU format)
%-------------------------------------------------------------------------------
\newcommand{\mytitlepage}{
	\begin{titlepage}
		\thispagestyle{empty} % No page number on title page per BSU requirements
		\begin{center}
			\textbf{МИНИСТЕРСТВО ОБРАЗОВАНИЯ РЕСПУБЛИКИ БЕЛАРУСЬ\\
				БЕЛОРУССКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ\\
				ФАКУЛЬТЕТ РАДИОФИЗИКИ И КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ}

			\vspace{0.5cm}
			Кафедра физики и аэрокосмических технологий
		\end{center}

		\vspace{2cm}

		\begin{center}
			\textbf{\Large\thetitle}
		\end{center}

		\begin{center}
			{Дипломная работа}
		\end{center}

		\vspace{1.0cm}

		\hfill
		\parbox{17em}{
			Глеба Евгения Михайловича \newline
			обучающегося 4 курса специальности \newline
			«Аэрокосмические радиоэлектронные и информационные системы и технологии»

			\vspace{0.5cm}

			Научный руководитель: \newline
			Баранова Василина Сергеевна \newline
			старший преподаватель\newline
			кафедры физики и аэрокосмических технологий
		}

		\vfill

		\begin{center}
			Минск, \the\year
		\end{center}
	\end{titlepage}
}

%-------------------------------------------------------------------------------
%    Table of contents customization (BSU style)
%-------------------------------------------------------------------------------
\renewcommand{\contentsname}{ОГЛАВЛЕНИЕ}

%-------------------------------------------------------------------------------
%    Document initialization
%-------------------------------------------------------------------------------
\AtBeginDocument{
	\setlength{\headheight}{14.0pt}
	\mytitlepage
	\addtocontents{toc}{\protect\thispagestyle{empty}}
	\tableofcontents
	\thispagestyle{empty}
	\clearpage
	\setcounter{page}{1} % Start numbering after TOC per BSU requirements
}

\endinput

