%%
%% This is file `epsconf.cls',
%%
%% Copyright (C) 2003 by Maarten Sneep <sneep@nat.vu.nl>
%% Modified 2004 by B.Ph. van Milligen <boudewijn.vanmilligen@ciemat.es>
%% Modified 2005 by G. Vlad <vlad@frascati.enea.it>
%% Modified 2018 by M. Riesch <michael.riesch@tum.de>
%%
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{epsconf}[2018/12/17 v1.2 EPS conference abstract]

% load article base class
\LoadClass[10pt,a4paper,notitlepage]{article}

% set paper size and margins
\RequirePackage[a4paper,includemp=false,margin=2.5cm,noheadfoot]{geometry}

% font encoding and face (Times)
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext,newtxmath}
\renewcommand{\familydefault}{\rmdefault}

% custom references section
\RequirePackage{cite}
\let\oldthebibliography=\thebibliography
\let\endoldthebibliography=\endthebibliography
\renewenvironment{thebibliography}[1]{%
  \FloatBarrier
  \begin{oldthebibliography}{#1}%
    \setlength{\parskip}{0ex}%
    \setlength{\itemsep}{0ex}%
    \normalfont\footnotesize
}{%
  \end{oldthebibliography}%
}

% input encoding
\RequirePackage[utf8]{inputenc}

% avoid widows and orphans
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

% Load base packages
\RequirePackage[english]{babel}
\RequirePackage{graphicx}
\RequirePackage[hidelinks,breaklinks]{hyperref}

% affiliations
\newcommand{\authormark}[1]{\textsuperscript{\normalfont#1}}
\newcounter{affil}
\let\theaffil\empty
\newcommand{\printaffil}[2]{%
  \ifnum\value{affil}>1{%
    #1.\quad#2%
  }\else{%
    #2%
  }\fi
}
\newcommand{\affil}[2][]{%
  \ifnum\value{affil}>0{%
    \makeatletter
    \g@addto@macro{\theaffil}{\par\printaffil{#1}{#2}}
    \makeatother
  }\else{%
    \makeatletter
    \g@addto@macro{\theaffil}{\printaffil{#1}{#2}}
    \makeatother
  }\fi
  \addtocounter{affil}{1}
}

% custom ((sub-)sub-)section titles
\RequirePackage[noindentafter]{titlesec}
\titleformat{\section}{\normalfont\normalsize\bfseries}{}{0pt}{}
\titlespacing*{\section}{0pt}{1em}{0pt}
\titleformat{\subsection}{\normalfont\normalsize\bfseries}{}{0pt}{}
\titlespacing*{\subsection}{0pt}{1em}{0pt}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{}{0pt}{}
\titlespacing*{\subsubsection}{0pt}{1em}{0pt}

% prevent floats in title
\RequirePackage{placeins}

% custom title
\makeatletter
\renewcommand{\maketitle}{%
  \newpage
  \begin{center}
    \Large\textbf{\@title}\par
    \vskip 14pt
    \normalsize\textbf{\@author}\par
    \footnotesize\textit{\theaffil}\par
    \vskip 14pt
  \end{center}
  \FloatBarrier
  \@afterindentfalse
  \@afterheading
}
\makeatother

% no page numbers
\thispagestyle{empty}

% indentation
\setlength{\parindent}{0.5cm}

% custom captions
\RequirePackage[margin=1cm]{caption}
\DeclareCaptionLabelFormat{figureabbr}{Fig.~#2}
\DeclareCaptionLabelFormat{tableabbr}{Tab.~#2}
\captionsetup[figure]{labelformat=figureabbr,labelfont=bf,font=footnotesize,
  labelsep=space}
\captionsetup[table]{labelformat=tableabbr,labelfont=bf,font=footnotesize,
  labelsep=space}

% custom page bottom
\renewcommand{\footnoterule}{}
\raggedbottom
\AtEndDocument{%
  \clearpage
}
%%
%% End of file `epsconf.cls'.
