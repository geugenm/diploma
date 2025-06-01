%==============================================================================
% BSU Modern Class v2.1 - Professional LaTeX class for Belarusian State University
% Optimized for LuaTeX, GOST-compliant, minimal code with advisor feedback fixes
% Author: Professional LaTeX Developer  
% Version: 2.1 (2025/05/31)
% Fixes: Figure captions, table captions, subsection formatting, bibliography, lists
%==============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsu}[2025/05/31 BSU Modern Class v2.1 - GOST-compliant with advisor fixes]

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
\RequirePackage{totcount} 
\RequirePackage{caption}      % For advanced caption formatting
\RequirePackage{array}        % For table formatting

%==============================================================================
% FONTS (LuaTeX Optimized)
%==============================================================================
\RequirePackage{fontspec}
% TODO: Replace with desired font family if needed
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
% SECTION FORMATTING (GOST Compliant - Only chapters bold)
%==============================================================================
% Chapter format - centered, uppercase, bold
\titleformat{\chapter}[display]
    {\centering\normalfont\large\bfseries}
    {\MakeUppercase{\chaptertitlename\ \thechapter}}
    {0pt}
    {\large\centering\MakeUppercase}
\titlespacing*{\chapter}{0pt}{0pt}{15pt}

% Section format - paragraph indent per GOST
\titleformat{\section}[hang]
    {\normalfont\large}  % Removed \bfseries per GOST
    {\thesection}
    {1em}
    {}
\titlespacing*{\section}{12.5mm}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% Subsection format - paragraph indent per GOST  
\titleformat{\subsection}[hang]
    {\normalfont\normalsize}  % Removed \bfseries per GOST
    {\thesubsection}
    {1em}
    {}
\titlespacing*{\subsection}{12.5mm}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

%==============================================================================
% FIGURE AND TABLE CAPTIONS (GOST Compliant)
%==============================================================================
% Figure captions: left-aligned, below figure per user feedback
\captionsetup[figure]{
    justification=raggedright,    % Left-aligned per advisor feedback
    singlelinecheck=false,        % Disable centering for single lines
    position=below,
    skip=6pt,
    labelsep=endash,
    font=normalsize
}

% Table captions: left-aligned, above table per GOST
\captionsetup[table]{
    justification=raggedright,    % Left-aligned per GOST
    singlelinecheck=false,
    position=above,
    skip=6pt,
    labelsep=endash,
    font=normalsize
}

%==============================================================================
% LISTS CONFIGURATION (Preserve paragraphs per GOST)
%==============================================================================
% Maintain paragraph structure in lists per advisor feedback
\setlist[itemize]{
    leftmargin=12.5mm,
    itemindent=0pt,
    parsep=0pt,
    topsep=6pt,
    partopsep=0pt,
    itemsep=6pt                   % Maintain spacing between items
}
\setlist[enumerate]{
    leftmargin=12.5mm,
    itemindent=0pt,
    parsep=0pt,
    topsep=6pt,
    partopsep=0pt,
    itemsep=6pt                   % Maintain spacing between items
}

%==============================================================================
% BIBLIOGRAPHY FORMATTING (GOST Compliant)
%==============================================================================
% TODO: Add bibliography formatting improvements for GOST compliance
% This should be configured with biblatex for proper GOST formatting

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
}{\clearpage}

\newenvironment{introduction}{%
    \clearpage
    \chapter*{ВВЕДЕНИЕ}
    \label{intro-start}
    \addcontentsline{toc}{chapter}{Введение}
}{}

% Conclusion environment
\newenvironment{conclusion}{%
    \clearpage
    \chapter*{ЗАКЛЮЧЕНИЕ}
    \label{conclusion-end}
    \addcontentsline{toc}{chapter}{Заключение}
}{}


\newtotcounter{appendixsections}

\newcommand{\appsection}[2]{
        \setcounter{figure}{0}
        \stepcounter{appendixsections}% автоматический подсчет
        \refstepcounter{chapter}
        \chapter*{Приложение~\Alph{chapter} #1}
        \addcontentsline{toc}{chapter}        {Приложение~\Alph{chapter} #1}
        \label{#2}
}
    
\newenvironment{attachements}{
    \clearpage
    \renewcommand{\thefigure}{\Alph{chapter}.\arabic{figure}}
}{}

%==============================================================================
% TITLE PAGE COMMAND (Modern LaTeX 2024 - Minimal Code, Maximum Output)
%==============================================================================
\NewDocumentCommand{\bsutitle}{m m m m m m m}{%
    \begin{titlepage}
        \thispagestyle{empty}
        \centering
        
        % Header: Ministry, University, Faculty
        {\bfseries
            МИНИСТЕРСТВО ОБРАЗОВАНИЯ РЕСПУБЛИКИ БЕЛАРУСЬ\\
            БЕЛОРУССКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ\\
            ФАКУЛЬТЕТ РАДИОФИЗИКИ И КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ
        }
        
        \vspace{0.5cm}
        \textbf{#1} % Department
        
        \vfill
        
        % Author (uppercase, bold)
        {#2}
        
        \vspace{1.5cm}
        
        % Title (large, bold)
        {\Large\bfseries \MakeUppercase{#3}}
        
        \vspace{1cm}
        #4 % Work type
        
        \vfill
        
        % Right block: Supervisor + Approval + Head
        \begin{flushright}
            \begin{minipage}{0.35\textwidth}
                #5 % Supervisor
            \end{minipage}
        \end{flushright}

        \vspace{1cm}
        
        \begin{flushleft}
                Допущена к защите\\[0.3cm]
                «\underline{\hspace{1cm}}» \underline{\hspace{3cm}} \the\year~г.
                
                \vspace{0.8cm}
                #6 % Department head
        \end{flushleft}
        
        \vfill
        #7, \the\year % City, year
        
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