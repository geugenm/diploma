%==============================================================================
% BSU Modern Class - Professional LaTeX class for Belarusian State University
% Optimized for LuaTeX, GOST-compliant, minimal code
% Author: Professional LaTeX Developer
% Version: 2.0 (2025/05/31)
%==============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsu-modern}[2025/05/31 BSU Modern Class v2.0 - Professional GOST-compliant]

%==============================================================================
% CLASS OPTIONS AND BASE
%==============================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}
\ProcessOptions\relax
\LoadClass[14pt,a4paper]{extreport}

%==============================================================================
% CORE PACKAGES (Minimal Set)
%==============================================================================
\RequirePackage{iftex}
\RequirePackage{geometry}
\RequirePackage[main=russian,english]{babel}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{hyperref}

%==============================================================================
% FONTS (LuaTeX Optimized)
%==============================================================================
\RequirePackage{fontspec}
\setmainfont{Liberation Serif}

%==============================================================================
% PAGE LAYOUT (GOST/BSU Compliant)
%==============================================================================
\geometry{
    a4paper,
    left=30mm,
    right=10mm,
    top=20mm,
    bottom=20mm,
    includefoot
}

%==============================================================================
% TYPOGRAPHY SETTINGS
%==============================================================================
\onehalfspacing
\setlength{\parindent}{12.5mm}
\setlength{\emergencystretch}{3em}

%==============================================================================
% HEADERS AND FOOTERS
%==============================================================================
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Plain style for chapter pages
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

%==============================================================================
% SECTION FORMATTING (GOST Compliant)
%==============================================================================
% Chapter format - centered, uppercase
\titleformat{\chapter}[display]
    {\centering\normalfont\large\bfseries}
    {\MakeUppercase{\chaptertitlename\ \thechapter}}
    {0pt}
    {\large\centering\MakeUppercase}
\titlespacing*{\chapter}{0pt}{0pt}{15pt}

% Section format
\titleformat{\section}[hang]
    {\normalfont\Large\bfseries}
    {\thesection}
    {1em}
    {}
\titlespacing*{\section}{12.5mm}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% Subsection format
\titleformat{\subsection}[hang]
    {\normalfont\bfseries}
    {\thesubsection}
    {1em}
    {}
\titlespacing*{\subsection}{12.5mm}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

%==============================================================================
% LISTS CONFIGURATION
%==============================================================================
\setlist[itemize]{noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt}
\setlist[enumerate]{noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt}

%==============================================================================
% HYPERREF CONFIGURATION
%==============================================================================
\hypersetup{
    colorlinks=false,
    pdfborder={0 0 0},
    unicode=true,
    pdfauthor={},
    pdftitle={},
    pdfkeywords={}
}

%==============================================================================
% BSU ENVIRONMENTS
%==============================================================================
% Abstract environment
\newenvironment{bsuabstract}{%
    \clearpage
    \thispagestyle{empty}
    \begin{center}
        \textbf{\large РЕФЕРАТ}
    \end{center}
    \vspace{1em}
    \addcontentsline{toc}{chapter}{РЕФЕРАТ}
}{\clearpage}

% Conclusion environment
\newenvironment{conclusion}{%
    \clearpage
    \chapter*{ЗАКЛЮЧЕНИЕ}
    \addcontentsline{toc}{chapter}{ЗАКЛЮЧЕНИЕ}
}{}

%==============================================================================
% TITLE PAGE COMMAND
%==============================================================================
\newcommand{\bsutitle}[4]{%
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{center}
            \textbf{МИНИСТЕРСТВО ОБРАЗОВАНИЯ РЕСПУБЛИКИ БЕЛАРУСЬ\\
                БЕЛОРУССКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ\\
                ФАКУЛЬТЕТ РАДИОФИЗИКИ И КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ}
            
            \vspace{0.5cm}
            Кафедра физики и аэрокосмических технологий
        \end{center}

        \vspace{2cm}

        \begin{center}
            \textbf{\Large#1}
        \end{center}

        \begin{center}
            {#2}
        \end{center}

        \vspace{1.0cm}

        \hfill
        \parbox{17em}{
            #3

            \vspace{0.5cm}

            Научный руководитель: \\
            #4
        }

        \vfill

        \begin{center}
            Минск, \the\year
        \end{center}
    \end{titlepage}
}

%==============================================================================
% TABLE OF CONTENTS CUSTOMIZATION
%==============================================================================
\renewcommand{\contentsname}{ОГЛАВЛЕНИЕ}

%==============================================================================
% DOCUMENT INITIALIZATION
%==============================================================================
\AtBeginDocument{
    \setlength{\headheight}{14.0pt}
}

\endinput
%==============================================================================
% END OF CLASS
%==============================================================================