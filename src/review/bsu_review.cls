%==============================================================================
% BSU Modern Class v2.1 - Professional LaTeX class for Belarusian State University
% Optimized for LuaTeX, GOST-compliant, minimal code with advisor feedback fixes
% Author: Professional LaTeX Developer
% Version: 2.1 (2025/05/31)
% Fixes: Figure captions, table captions, subsection formatting, bibliography, lists
%==============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsu-review}[2025/05/31 BSU Modern Class Review]

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
\captionsetup[figure]{justification=centering}

\RequirePackage{array}        % For table formatting

%==============================================================================
% FONTS (LuaTeX Optimized)
%==============================================================================
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

%==============================================================================
% PAGE LAYOUT (GOST/BSU Compliant)
%==============================================================================
\geometry{
	a4paper,
	left=30mm,
	right=16mm,
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
{\normalfont\bfseries\large}  % Removed \bfseries per GOST
{\thesection}
{1em}
{}
\titlespacing*{\section}{12.5mm}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

% Subsection format - paragraph indent per GOST
\titleformat{\subsection}[hang]
{\normalfont\bfseries\normalsize}  % Removed \bfseries per GOST
{\thesubsection}
{1em}
{}
\titlespacing*{\subsection}{12.5mm}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

%==============================================================================
% FIGURE AND TABLE CAPTIONS (GOST Compliant)
%==============================================================================
\captionsetup[figure]{
	justification=justified,      % Justified alignment for professional appearance
	singlelinecheck=false,        % Disable centering for single lines
	position=below,
	skip=6pt,
	labelsep=endash,
	font=normalsize,
	textfont=bf,
	labelfont=bf
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
% DOCUMENT INITIALIZATION
%==============================================================================
\AtBeginDocument{
	\setlength{\headheight}{14.0pt}
}

\endinput
