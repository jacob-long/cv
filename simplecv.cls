% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% -*- coding: UTF-8; -*-

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This LaTeX class is based on the work of 
%% <https://github.com/zachscrivena/simple-resume-cv>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{simplecv}

\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{article}}

% Run in non-stop mode.
\DeclareOption{nonstopmode}{\nonstopmode}

% Draft mode.
\newcommand{\TypesetInDraftMode}{0}
\DeclareOption{draftmode}{\renewcommand{\TypesetInDraftMode}{1}}

% Datestamp format (default): {yyyy}{MM}{dd} ---> MMM yyyy (e.g., Jan 2008).
\newcommand{\DatestampYMD}[3]{\mbox{\ShortMonth{#2} #1}}
\newcommand{\DatestampYM}[2]{\mbox{\ShortMonth{#2} #1}}
\newcommand{\DatestampY}[1]{#1}
\DeclareOption{MMMyyyy}{} % default

% Datestamp format: {yyyy}{MM}{dd} ---> dd MMM yyyy (e.g., 15 Jan 2008).
\DeclareOption{ddMMMyyyy}{%
\renewcommand{\DatestampYMD}[3]{\mbox{#3 \ShortMonth{#2} #1}}
\renewcommand{\DatestampYM}[2]{\mbox{\ShortMonth{#2} #1}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> MMMM yyyy (e.g., January 2008).
\DeclareOption{MMMMyyyy}{%
\renewcommand{\DatestampYMD}[3]{\mbox{\LongMonth{#2} #1}}
\renewcommand{\DatestampYM}[2]{\mbox{\LongMonth{#2} #1}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> dd MMMM yyyy (e.g., 15 January 2008).
\DeclareOption{ddMMMMyyyy}{%
\renewcommand{\DatestampYMD}[3]{\mbox{#3 \LongMonth{#2} #1}}
\renewcommand{\DatestampYM}[2]{\mbox{\LongMonth{#2} #1}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> yyyy-MM-dd (e.g., 2008-01-15).
\DeclareOption{yyyyMMdd}{%
\renewcommand{\DatestampYMD}[3]{\mbox{#1-#2-#3}}
\renewcommand{\DatestampYM}[2]{\mbox{#1-#2}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> yyyy-MM (e.g., 2008-01).
\DeclareOption{yyyyMM}{%
\renewcommand{\DatestampYMD}[3]{\mbox{#1-#2}}
\renewcommand{\DatestampYM}[2]{\mbox{#1-#2}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> yyyy (e.g., 2008).
\DeclareOption{yyyy}{%
\renewcommand{\DatestampYMD}[3]{#1}
\renewcommand{\DatestampYM}[2]{#1}
\renewcommand{\DatestampY}[1]{#1}}

\ProcessOptions\relax

% Use article class as the base class.
\LoadClass[10pt,oneside]{article}

% PDF settings and properties.
\RequirePackage{hyperref}

% Geometry package for page margins.
\RequirePackage[
left=0.70in,
right=0.70in,
top=0.60in,
bottom=0.45in,
nohead,
includefoot]{geometry}

% Hyphenation: Disabled.
\RequirePackage[none]{hyphenat}

% Colors.
\RequirePackage[usenames]{color}
% \definecolor{MyDarkBlue}{RGB}{0,90,160}
% {\color{MyDarkBlue}This text is dark blue}

% Current date and time.
\RequirePackage{datetime2}

% Timestamp.
\newcommand{\Timestamp}{{\DTMnow}}

% XeLaTeX packages.
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
% \RequirePackage{xunicode}
\RequirePackage{xltxtra}

% Font: Use "Cabin" as the main typeface (\textnormal{}, \normalfont).
% Available via Google Fonts
\setmainfont
[Path=./Fonts/,
ItalicFont=Cabin-Italic,
BoldFont=Cabin-Bold,
BoldItalicFont=Cabin-BoldItalic,
Scale = 1.05]
{Cabin-Regular.ttf}

% Secondary font: "Raleway".
% Available via Google Fonts
\newcommand{\UseSecondaryFont}{
\fontspec
[Path=./Fonts/,
ItalicFont=Raleway-Italic,
BoldFont=Raleway-Bold,
BoldItalicFont=Raleway-BoldItalic]
{Raleway-Regular.ttf}
}

% Sans-serif font: Changed to main font, Cabin.
\renewcommand{\sffamily}{\rmfamily}

% Typewriter (monospace) font: Changed to "IBM Plex Mono".
% Available via Google Fonts and elsewhere
\renewcommand{\ttfamily}{
\fontspec
[Path=./Fonts/,
ItalicFont=IBMPlexMono-Italic,
BoldFont=IBMPlexMono-Bold,
BoldItalicFont=IBMPlexMono-BoldItalic,
Scale = 0.95]
{IBMPlexMono-Regular.ttf}
}

% Small caps font: Changed to "Playfair Display SC" but for now, not used.
% Available via Google Fonts
% \renewcommand{\scshape}{
%   % \rmfamily
%   \fontspec
% [Path=./Fonts/,
% ItalicFont=PlayfairDisplaySC-Italic,
% BoldFont=PlayfairDisplaySC-Bold,
% BoldItalicFont=PlayfairDisplaySC-BoldItalic]
% {PlayfairDisplaySC-Regular.otf}
% }
%\renewcommand{\textsc}[1]{\textbf{\MakeUppercase{#1}}}

% Font styles.
\newcommand{\UseHeadingFont}{\normalfont}
\newcommand{\UseHeaderFooterFont}{\UseHeadingFont\fontsize{8.2pt}{9.5pt}\selectfont}
\newcommand{\UseNoteFont}{\UseHeadingFont\fontsize{8pt}{9.6pt}\selectfont}
\newcommand{\UseTitleFont}{\UseSecondaryFont\fontsize{28pt}{33.6pt}\selectfont}
\newcommand{\UseSubTitleFont}{\normalfont\fontsize{9.5pt}{10.3pt}\selectfont}
\newcommand{\UseSectionFont}{\UseSecondaryFont\fontsize{10pt}{12pt}\selectfont\itshape}
\newcommand{\UseSubSectionFont}{\UseHeadingFont\fontsize{10pt}{12pt}\selectfont\bfseries}
\newcommand{\UseSubSubSectionFont}{\UseHeadingFont\fontsize{8.6pt}{10.3pt}\selectfont}
\newcommand{\UseDetailFont}{\normalfont\fontsize{8.6pt}{10.3pt}\selectfont}

% Symbols (Unicode).
% See: https://unicode-table.com/en/
% \newcommand{\BulletSymbol}{{\normalfont\fontsize{6.5}{7.8}\selectfont\raisebox{0.17em}{\char"25A0}}}
% \newcommand{\SubBulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{\char"25CF}}}
% \newcommand{\SubSubBulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{\char"25CB}}}
% \newcommand{\TildeSymbol}{{\normalfont\char"007E}}

% Headers and footers: Blank header, page number in footer.
\AtEndDocument{\null\label{LastPage}}
\newcommand{\PageKOfN}{{\UseHeaderFooterFont{Page}~\thepage~of~\pageref{LastPage}}}
\newcommand{\DraftStamp}{{\UseHeaderFooterFont\color{red}DRAFT~\Timestamp}}

\ifnum\TypesetInDraftMode=0
\newcommand{\HeaderText}{}
\newcommand{\FooterText}{\hfill\PageKOfN\hfill}
\else
\newcommand{\HeaderText}{}
\newcommand{\FooterText}{\null\hphantom{\DraftStamp}\hfill%
\PageKOfN\hfill%
\DraftStamp\null}
\fi

\def\ps@plain{%
\def\@oddhead{\HeaderText}%
\def\@evenhead{\HeaderText}%
\def\@oddfoot{\FooterText}%
\def\@evenfoot{\FooterText}}

\pagestyle{plain}

% Paragraph style.
\setlength{\parindent}{0in} % No indentation at the beginning of each paragraph.
\setlength{\parskip}{.1in} % Some vertical space between paragraphs.

% Avoid bad page breaks within paragraphs.
\widowpenalties 1 10000
\clubpenalties 1 10000
\raggedbottom

% Avoid overfull lines.
\sloppy

% Footnotes: Use symbols instead of numbers for labels.
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Macro: Title (name).
\newcommand{\Title}[1]{%
\par\pdfbookmark[1]{#1}{#1}%
\setlength{\parskip}{0in}
\begingroup\centering%
\UseTitleFont{#1}%
\par\endgroup
\rule[-1pt]{\textwidth}{0.4pt}
\par}

% Macro: SubTitle (personal information below name).
\newenvironment{SubTitle}
{\par\vspace{0.25\baselineskip}%
\setlength{\parskip}{0.02in}
\begingroup\centering%
\UseSubTitleFont}
{\par\endgroup
\rule[4pt]{\textwidth}{0.4pt}
\setlength{\parskip}{.1in}
\par}

% Macro: Body (rest of the document).
\newenvironment{Body}
{%
\par\vspace{1.5\baselineskip}%
\begin{list}
{}
{\setlength\leftmargin{1.2in}%
\setlength\rightmargin{0in}%
\setlength\labelwidth{1.2in}%
\setlength\labelsep{0in}%
\setlength\listparindent{0in}%
\setlength\itemindent{0in}%
\setlength\parskip{0.05in}%
\setlength\topsep{0in}%
\setlength\parsep{0.05in}%
\setlength\itemsep{0.90\baselineskip}%
\setlength\partopsep{0in}%
%\raggedright%
}%
}
{%
\end{list}%
\par%
}

% Macro: Gap (vertical gap between items in the same section).
\newcommand{\Gap}{\par\vspace{0.45mm}\par}

% Macro: BigGap (big vertical gap between items in the same section).
\newcommand{\BigGap}{\par\vspace{2.25mm}\par}

% Macro: Section (new section for Education, Research Experience, etc.).
\renewcommand{\section}[3]
{\smallskip
\par\pdfbookmark[2]{#2}{#3}%
\item[\smash{\parbox[t]{1.2in}{\UseSectionFont\raggedright{#1}}}]% eliminated \MakeUppercase{#1} after \raggedright
\par}

% Macro: SubSection.
\renewcommand{\subsection}[3]
{\smallskip
\par\pdfbookmark[3]{#2}{#3}%
{\UseSubSectionFont\raggedright{#1}}% eliminated \MakeUppercase{#1} after \raggedright
\par}

% Macro: SubSubSection.
\renewcommand{\subsubsection}[3]
{\par\pdfbookmark[3]{#2}{#3}%
{\UseSubSubSectionFont\raggedright{#1}}%
\par}

% Macro: Detail (text in smaller font under an item).
\newenvironment{Detail}
{\par\begingroup\UseDetailFont}
{\par\endgroup\par}

% Customize appearance of lists
\usepackage{enumitem}
% Add space between bullets and text
\setlist[itemize]{labelsep = 5pt, font = \normalfont}
% Eliminate bullet for top-level items
\setlist[itemize, 1]{label = {}, labelsep = 0pt}
% Set 2nd-level bullet to be actual bullet, use smaller font
\setlist[itemize, 2]{before = \UseDetailFont, label= \BulletSymbol}

% End of class file.
\endinput
