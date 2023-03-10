%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Developers:
%   - Artemy Sazonov (July 2022 - now)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vegapresentation}[2022/08/16 Vega Presentation Class]
\LoadClass[aspectratio=169]{beamer}

\beamertemplatenavigationsymbolsempty
\setbeamersize{text margin left=1cm,text margin right=2cm}

\setbeamertemplate{enumerate items}[default]
\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{blocks}[rounded][shadow=false]

\setbeamertemplate{theorems}[numbered]

\setbeamertemplate{footline}
{
  \hbox{\begin{beamercolorbox}[wd=1\paperwidth,ht=0ex,dp=1ex,right]{framenumber}%
      \usebeamerfont{framenumber}\insertframenumber{} / \inserttotalframenumber\hspace*{0.6cm}
    \end{beamercolorbox}}%
  \vskip3pt%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options: > russian: pass if document is in Russian to change the language of pre-defined text
%          > 
%          > 
%          > 
%          > 
%          > 
%          > 
%          > 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Packages and Options
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{cmap}
\RequirePackage[T1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{kvoptions}

\RequirePackage{tikz}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}

\RequirePackage{booktabs}
\RequirePackage{bbm}
\RequirePackage{hyperref}

\RequirePackage{amsmath,amssymb}
\RequirePackage{mathtext}
\RequirePackage{amsthm}

\RequirePackage[backend=biber,style=alphabetic,sorting=ynt]{biblatex}
\RequirePackage{csquotes}


% Bool options
\DeclareBoolOption{russian}
\DeclareBoolOption{figures}
\DeclareBoolOption{tables}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Headers and Footers
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Colors, Fonts, and General Settings
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{paratype}


\RequirePackage{xcolor}


\definecolor{color1bg}{HTML}{2C3389}
\definecolor{color2bg}{HTML}{EFA69D}
\definecolor{color2lightened}{HTML}{FBE9E7}
\definecolor{color3bg}{HTML}{B16D95}

\definecolor{colormainblue}{HTML}{2B3189}

\newcommand{\headlinecolor}{\normalcolor}

\hypersetup
{
	colorlinks=true,
	linkcolor=[HTML]{B16D95},
	filecolor=magenta,      
	urlcolor=cyan,
	citecolor=black
}

\setbeamercolor{palette primary}{bg=white,fg=colormainblue}
\setbeamercolor{palette secondary}{bg=white,fg=color3bg}
\setbeamercolor{palette tertiary}{bg=white,fg=colormainblue}
\setbeamercolor{palette quaternary}{bg=white,fg=colormainblue}
\setbeamercolor{structure}{fg=colormainblue} % itemize, enumerate, etc
\setbeamercolor{section in toc}{fg=colormainblue} % TOC sections

% Override palette coloring with secondary
\setbeamercolor{subsection in head/foot}{bg=white,fg=colormainblue}

\setbeamercolor{footnote}{fg=color3bg}
\setbeamercolor{footnote mark}{fg=color3bg}

\setbeamercolor{title}{fg=white}
\setbeamercolor{author}{fg=white}

\setbeamercolor{footline}{fg=color3bg}

\setbeamercolor{block title}{bg=color2lightened}
\setbeamercolor{block body}{bg=color2lightened}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language-dependent commands
% Default:   English
% Available: English, Russian
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProcessKeyvalOptions*
\ifvegapresentation@russian
    \RequirePackage[english,russian]{babel}
    \renewcommand{\epsilon}{\varepsilon}
    \renewcommand{\phi}{\varphi}

\else
    \RequirePackage[russian,english]{babel}
\fi

\newcommand{\textLectureNotes}   {Lecture Notes}

\newcommand{\textTableofcontents}{Table of Contents}
\newcommand{\textListoffigures}  {List of Figures}
\newcommand{\textListoftables}   {List of Tables}
\newcommand{\textIntroduction}   {Introduction}
\newcommand{\textConclusion}     {Conclusion}
\newcommand{\textReferences}     {Bibliography}

\newcommand{\textDefinition}     {Definition}
\newcommand{\textTheorem}        {Theorem}
\newcommand{\textLemma}          {Lemma}
\newcommand{\textCorollary}      {Corollary}
\newcommand{\textExample}        {Example}
\newcommand{\textProposition}    {Proposition}

\newtheorem*{nb}{NB}


\ProcessKeyvalOptions*
\ifvegapresentation@russian
    \renewcommand{\textLectureNotes}   {???????????????? ????????????}

    \renewcommand{\textTableofcontents}{????????????????????}
    \renewcommand{\textListoffigures}  {???????????? ??????????????????????}
    \renewcommand{\textListoftables}   {???????????? ????????????}
    \renewcommand{\textIntroduction}   {????????????????}
    \renewcommand{\textConclusion}     {????????????????????}
    \renewcommand{\textReferences}     {???????????? ????????????????????}

    \renewcommand{\textDefinition}     {??????????????????????}
    \renewcommand{\textTheorem}        {??????????????}
    \renewcommand{\textLemma}          {??????????}
    \renewcommand{\textCorollary}      {??????????????????}
    \renewcommand{\textExample}        {????????????}
    \renewcommand{\textProposition}    {??????????????????????}
\fi

\AtBeginSection{\begin{frame}\frametitle{\textTableofcontents}\tableofcontents[currentsection,hideallsubsections]\end{frame}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title page etc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\defindent}{0cm}
\def\maketitle
{
    \frame[plain,noframenumbering]{
        \begin{tikzpicture}[remember picture,overlay]
            \node [fill, rectangle, top color=color1bg,  bottom color=color2bg, anchor=north, minimum width=\paperwidth, minimum height=\paperheight,shading angle=20] (box) at (current page.north){};
            \node [anchor=north east] at (current page.north east){\includegraphics[width=2cm]{vega_letter_white.pdf}};
        \end{tikzpicture}
        \vspace{4.5cm}

        {\color{white}
            \hspace{\defindent}\small{\insertsubtitle}\par
            \hspace{\defindent}\usebeamerfont{title}\textbf{\inserttitle}\par

            \bigskip
            \hspace{\defindent}\usebeamerfont{author}\small{\insertauthor}\par
            \smallskip
            \hspace{\defindent}\usebeamerfont{institute}\insertinstitute\par
            \medskip
            \hspace{\defindent}\usebeamerfont{date}\insertdate\par
        }
    }
}

\setbeamertemplate{endpage}{
    {
        \frame[plain,noframenumbering]{
            \begin{tikzpicture}[remember picture,overlay]
                \node [anchor=center] at (current page.center){\includegraphics[width=5cm]{vega_letter_color.pdf}};
            \end{tikzpicture}
        }
    }
}
\AtEndDocument{\usebeamertemplate{endpage}}



\setbeamertemplate{frametitle}{
    \vspace*{10pt}
    \ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
    \@tempdima=\textwidth%
    \advance\@tempdima by\beamer@leftmargin%
    \advance\@tempdima by\beamer@rightmargin%
    \hspace*{14.17pt}%
    \begin{beamercolorbox}[sep=0.5cm,left,wd=\the\@tempdima]{frametitle}
        \usebeamerfont{frametitle}%
        \vbox{}\vskip-1ex%
        \if@tempswa\else\csname beamer@ftecenter\endcsname\fi%
        \strut\textbf{\insertframetitle}\strut\par%
        {%
            \ifx\insertframesubtitle\@empty%
            \else%
            {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\insertframesubtitle\strut\par}%
            \fi
        }%
        \vskip-1ex%
        \if@tempswa\else\vskip-.3cm\fi% set inside beamercolorbox... evil here...
    \end{beamercolorbox}%
    \begin{tikzpicture}[remember picture,overlay]
        \node [anchor=north east] at (current page.north east){\includegraphics[width=2cm]{vega_letter_color.pdf}};
    \end{tikzpicture}
}



%\renewtheorem{definition}{\textDefinition}
%\renewtheorem{theorem}{\textTheorem}
%\renewtheorem{corollary}{\textCorollary}[theorem]
%\renewtheorem{lemma}[theorem]{\textLemma}
%\renewtheorem{example}{\textExample}
%\newtheorem{proposition}{\textProposition}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Maths commands
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareMathOperator*{\sgn}{sgn}
\DeclareMathOperator*{\var}{var}   
\DeclareMathOperator*{\cov}{cov}
\DeclareMathOperator*{\law}{Law}

\newcommand{\1}{\mathbbm{1}} 
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\E}{\mathbb{E}}

\newcommand{\independent}{\perp\!\!\!\!\perp}


\newcommand\cA{{\cal A}}
\newcommand\cE{{\cal E}}
\newcommand\cC{{\cal C}}
\newcommand\cF{{\cal F}}
\newcommand\cG{{\cal G}}
\newcommand\cK{{\cal K}}
\newcommand\cL{{\cal L}}
\newcommand\cB{{\cal B}}
\newcommand\cN{{\cal N}}
\newcommand\cM{{\cal M}}
\newcommand\cX{{\cal X}}
\newcommand\cD{{\cal D}}
\newcommand\cR{{\cal R}}
\newcommand\cP{{\cal P}}
\newcommand\cQ{{\cal Q}}
\newcommand\cS{{\cal S}}
\newcommand\cT{{\cal T}}
\newcommand\cV{{\cal V}}
\newcommand\cZ{{\cal Z}}