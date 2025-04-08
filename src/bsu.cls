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
\setmainfont[
	Path=../fonts/,
	UprightFont=*-regular,
	BoldFont=*-bold,
	ItalicFont=*-italic,
	BoldItalicFont=*-italic,
	Extension=.ttf,
	Ligatures=TeX,
]{times_new_roman}

%-------------------------------------------------------------------------------
%    Core packages
%-------------------------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage[a4paper, margin=2cm, right=2cm, includefoot]{geometry}
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

\pagenumbering{arabic}

%-------------------------------------------------------------------------------
%    List configuration
%-------------------------------------------------------------------------------
\setlist[itemize]{noitemsep, topsep=0pt, partopsep=0pt, parsep=0pt}

%-------------------------------------------------------------------------------
%    Heading configuration
%-------------------------------------------------------------------------------
% Chapter format
\titleformat{\chapter}[display]
{\normalfont\large\bfseries\centering}
{\chaptertitlename\ \thechapter}
{0pt}
{\large\centering}
\titlespacing*{\chapter}{0pt}{0pt}{15pt}

% Section format
\titleformat{\section}[hang]
{\normalfont\Large\bfseries}
{\hspace*{1cm}\thesection}
{1em}
{\raggedright}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% Subsection format
\titleformat{\subsection}[hang]
{\normalfont\bfseries}
{\hspace*{1cm}\thesubsection}
{1em}
{\raggedright}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

% Subsubsection format
\titleformat{\subsubsection}[hang]
{\normalfont\bfseries}
{\hspace*{1cm}\thesubsubsection}
{1em}
{\raggedright}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

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
%    Line spacing and paragraph configuration
%-------------------------------------------------------------------------------
\onehalfspacing
\setlength{\parindent}{1.25cm}
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
%    Title page
%-------------------------------------------------------------------------------
\newcommand{\mytitlepage}{
	\begin{titlepage}
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

		\vspace{2.0cm}

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
%    Document initialization
%-------------------------------------------------------------------------------
\AtBeginDocument{
	\setlength{\headheight}{14.0pt}
	\mytitlepage
	\addtocontents{toc}{\protect\thispagestyle{empty}}
	\tableofcontents
	\thispagestyle{empty}
	\clearpage
	\setcounter{page}{1}
}

\endinput
