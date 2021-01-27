% Template - BTH degree project: Master of Science in computer science | software engineering [for engineers]
%
% CHANGELOG (most recent change at top):
% --------------------------------------
% Version 1.2 (2018-02-10) - JUB
% Added ``Sammanfattning'' (Swedish abstract).

% Version 1.1 (2016-03-08) - JUB
% Fixed alignment of chapter titles that span several lines.
%
% Version 1.0 (2013-12-25)
% --------------------------------------
% Authors of earlier versions of parts of this file: Hannes Tribus, Martin Stokhof, Marco Vervoort, Maarten de Rijke
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bth}[2018/02/12 BTH Master Thesis Style]
\newcommand{\@mult}{1.2}
\newcommand{\@typesizeopt}{12pt}
\DeclareOption{10pt}{%
   \renewcommand{\@mult}{1}
   \renewcommand{\@typesizeopt}{10pt}
}
\DeclareOption{11pt}{%
   \renewcommand{\@mult}{1.1}
   \renewcommand{\@typesizeopt}{11pt}
}
\DeclareOption{12pt}{%
   \renewcommand{\@mult}{1.2}
   \renewcommand{\@typesizeopt}{12pt}
}
\DeclareOption{openbib}{%  To provide backwards compatibility with versions
   \AtEndOfPackage{%       of the book class that do not use @openbib@code
      \renewcommand\@openbib@code{%
         \addtolength{\leftmargin}{\bibindent}
         \setlength{\itemindent}{-\bibindent}
         \setlength{\listparindent}{\itemindent}
         \setlength{\parsep}{\z@}
      }
      \renewcommand\newblock{\par}
   }
   \PassOptionsToClass{\CurrentOption}{book}
}
\newcommand{\@papersizeopt}{a4paper}
\DeclareOption{a4paper}{\renewcommand{\@papersizeopt}{a4paper}}
\DeclareOption{a5paper}{\renewcommand{\@papersizeopt}{a5paper}}
\DeclareOption{b5paper}{\renewcommand{\@papersizeopt}{b5paper}}
\DeclareOption{letterpaper}{\renewcommand{\@papersizeopt}{letterpaper}}
\DeclareOption{legalpaper}{\renewcommand{\@papersizeopt}{legalpaper}}
\DeclareOption{executivepaper}{\renewcommand{\@papersizeopt}{executivepaper}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[\@papersizeopt,\@typesizeopt]{book}
\RequirePackage{graphicx}
%
%   To provide backwards compatibility with versions of the book class that 
%   do not define \@openbib@code, \newblock, \paperwidth or \paperheight:
%
\providecommand{\@openbib@code}{}
\providecommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\providecommand{\paperwidth}{\pagewidth}
\providecommand{\paperheight}{\pageheight}
%
%   New values for some lengths, proportional to fontsize
%
\newcommand{\setmlength}[3]{\setlength{#1}{#3}\setlength{#1}{#2#1}}
\setmlength{\textheight}{\@mult}{0.67\paperheight}%18.2cm for a4paper WAS 0.613
\setmlength{\textwidth}{\@mult}{0.6\paperwidth}%12.1cm for a4paper WAS 0.579
\setmlength{\headheight}{\@mult}{12pt}
\setmlength{\headsep}{\@mult}{18pt}
\setmlength{\topskip}{\@mult}{10pt}
\setmlength{\footskip}{\@mult}{25pt}

\setlength{\topmargin}{0.5\paperheight}
\addtolength{\topmargin}{-0.5\textheight}
\addtolength{\topmargin}{-0.5\headheight}
\addtolength{\topmargin}{-0.5\headsep}
\addtolength{\topmargin}{-0.5\footskip}
\addtolength{\topmargin}{-1in}
\setlength{\oddsidemargin}{0.5\paperwidth}
\addtolength{\oddsidemargin}{-0.5\textwidth}
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}
%
%   Chapterheads: chapternr, horizontal line, chaptertitle
%       Vertical spaces are proportional to fontsize
%       Note that, as opposed to in book.cls, here the definition
%       of \@makechapterhead does _not_ end with a \nobreak command
%       but with a \mbox{}, since we'd rather not have the chapter
%       head move to the next page even if that would result in 
%       the chapter head being the _only_ thing on the page. 
%
\newlength{\@spacebeforechapterhead}
\setmlength{\@spacebeforechapterhead}{\@mult}{15pt}
\newlength{\@spaceinchapterhead}
\setmlength{\@spaceinchapterhead}{\@mult}{3.5pt}
\newlength{\@spaceafterchapterhead}
\setmlength{\@spaceafterchapterhead}{\@mult}{80pt}

\renewcommand{\@makechapterhead}[1]{{%
   \vspace*{\@spacebeforechapterhead}%
   \parindent 0pt \Large\bfseries
   \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
         \@chapapp\enspace\thechapter
      \fi
   \fi
   \interlinepenalty\@M
   \vspace*{\@spaceinchapterhead}%
   \hrule
   \vspace*{\@spaceinchapterhead}%
   \raggedleft
   {\LARGE \bfseries #1}%
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
%   \mbox{}\par
%   \mbox{}\par
%   \vspace*{\@spaceafterchapterhead}\vspace{\stretch{0.01}\par\mbox{}\par
}}

\renewcommand{\@makeschapterhead}[1]{{%
   \vspace*{\@spacebeforechapterhead}%
   \parindent 0pt \Large\bfseries
   \phantom{\@chapapp}%
   \interlinepenalty\@M
   \vspace*{\@spaceinchapterhead}%
   \hrule
   \vspace*{\@spaceinchapterhead}%
   {\hfill \LARGE \bfseries #1}%
   \mbox{}\par
   \mbox{}\par
   \mbox{}\par
%   \mbox{}\par
%   \mbox{}\par
%   \mbox{}\par
% Note: the above works better when there is little text on the first
% page of the chapter
%   \vspace*{\@spaceafterchapterhead}\vspace{\stretch{0.01}}\par\mbox{}\par
}}
%
%   No pagenumber or headers on skipped pages with cleardoublepage
%
\renewcommand{\cleardoublepage}{%
   \clearpage\if@twoside \ifodd\c@page\else
   \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi
}
%
%   Theorems: {\bf number.} {\sc type.} {\rm description} \it contents
%
\def\@begintheorem#1#2{%
   \itshape
   \trivlist% changing this in '\begin{trivlist}' yields an error
   \item[\hspace{\labelsep}{\upshape\bfseries #2.}\ {\scshape #1.}]%
}

\renewcommand{\@opargbegintheorem}[3]{%
   \itshape
   \trivlist% changing this in `\begin{trivlist}' yields an error
  \item[\hspace{\labelsep}{\upshape\bfseries #2.}\ {\scshape #1\ ({#3}).}]%
}
%
%   Chapters, sections and other environments are redefined here to no 
%       longer cause uppercased headings. Headings are italized instead of 
%       slanted. The bibliography and index appear in the table of contents.
%
\if@twoside
   \renewcommand{\ps@headings}{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \def\chaptermark##1{\markboth{%
         \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter \@chapapp\ \thechapter. \ \fi
         \fi
         ##1}{}}%
      \def\sectionmark##1{\markright{%
         \ifnum \c@secnumdepth >\z@ \thesection. \ \fi
         ##1}}%
   }
\else
   \renewcommand{\ps@headings}{%
      \let\@oddfoot\@empty
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \def\chaptermark##1{\markright{%
         \ifnum \c@secnumdepth >\m@ne
            \if@mainmatter \@chapapp\ \thechapter. \ \fi
         \fi
         ##1}}
   }
\fi

\renewcommand{\ps@myheadings}{%
   \let\@oddfoot\@empty\let\@evenfoot\@empty
   \def\@evenhead{\thepage\hfil\slshape\leftmark}%
   \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
   \let\@mkboth\@gobbletwo
   \let\chaptermark\@gobble
   \let\sectionmark\@gobble
}

\renewcommand{\tableofcontents}{%
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse
   \fi
   \chapter*{\contentsname
        \@mkboth{\contentsname}{\contentsname}}%    Headings not uppercased
   \@starttoc{toc}%
   \if@restonecol\twocolumn\fi
}

\renewcommand{\listoffigures}{%
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse
   \fi
   \chapter*{\listfigurename
      \@mkboth{\listfigurename}{\listfigurename}}%  Headings not uppercased
   \@starttoc{lof}%
   \if@restonecol\twocolumn\fi
}

\renewcommand{\listoftables}{%
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse
   \fi
   \chapter*{\listtablename
      \@mkboth{\listtablename}{\listtablename}}%    Headings not uppercased
   \@starttoc{lot}%
   \if@restonecol\twocolumn\fi
}

\renewenvironment{thebibliography}[1]{%
   \chapter*{References
      \@mkboth{References}{References}}%            Headings not uppercased
   \addcontentsline{toc}{chapter}{References}%      Add to table-of-contents
   \list{\@biblabel{\arabic{enumiv}}}{%
      \settowidth\labelwidth{\@biblabel{#1}}%
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \@openbib@code
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand{\theenumiv}{\arabic{enumiv}}%
   }%
   \sloppy\clubpenalty4000\widowpenalty4000%
   \sfcode`\.=\@m
}{%
   \def\@noitemerr{%
      \@latex@warning{Empty `thebibliography' environment}%
   }%
   \endlist
}
%\addcontentsline{toc}{chapter}{References}
%\markboth{References}{References}

\renewenvironment{theindex}{%
   \cleardoublepage%                               Start on a right-hand page
   \if@twocolumn
      \@restonecolfalse
   \else
      \@restonecoltrue
   \fi
   \columnseprule \z@
   \columnsep 35\p@
   \twocolumn[\phantom{\Large\bf\chaptername}%
              \@makeschapterhead{\indexname}]%
   \@mkboth{\indexname}{\indexname}%           Headings not uppercased
   \addcontentsline{toc}{chapter}{Index}%      Add to table-of-contents
   \thispagestyle{plain}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem
}{%
   \if@restonecol\onecolumn\else\clearpage\fi
}

%
%   Define new end-matter environments
%
\newenvironment{thesymbols}{%
   \cleardoublepage%                             Start on a right-hand page
   \if@twocolumn
      \@restonecolfalse
   \else
      \@restonecoltrue
   \fi
   \columnseprule \z@
   \columnsep 35\p@
   \twocolumn[\phantom{\Large\bf\chaptername}%
              \@makeschapterhead{List of symbols}]%
   \@mkboth{List of symbols}{List of symbols}%   Headings not uppercased
   \addcontentsline{toc}{chapter}{List of Symbols}% Add to table-of-contents
   \thispagestyle{plain}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem
}{%
   \if@restonecol\onecolumn\else\clearpage\fi
}

\newcommand{\acknowledgments}{%
   \chapter*{Acknowledgments}%
   \addcontentsline{toc}{chapter}{Acknowledgments}%
   \markboth{Acknowledgments}{Acknowledgments}%
}

\newcommand{\listOfDefinitions}{%
   \chapter*{Glossary}%
   \addcontentsline{toc}{chapter}{Glossary}%
   \markboth{Glossary}{Glossary}%
}
   
\newcommand{\zusammenfassung}{%
   \chapter*{Zusammenfassung}%
   \addcontentsline{toc}{chapter}{Zusammenfassung}%
   \markboth{Zusammenfassung}{Zusammenfassung}%
}
   
\newcommand{\sammanfattning}{%
   \chapter*{Sammanfattning}%
   \addcontentsline{toc}{chapter}{Sammanfattning}%
   \markboth{Sammanfattning}{Sammanfattning}%
}

\newcommand{\abstract}{%
   \chapter*{Abstract}%
   \addcontentsline{toc}{chapter}{Abstract}%
   \markboth{Abstract}{Abstract}%
}

\newcommand{\curriculum}{%
   \chapter*{Curriculum Vitae and Publications}%
   \addcontentsline{toc}{chapter}{Curriculum Vitae and Publications}%
  \markboth{Curriculum Vitae}{Curriculum Vitae and Publications}%
}

\newenvironment{noindentdescription}%
  {\begin{list}{}{\setlength{\labelwidth}{0pt}
   \setlength{\leftmargin}{\labelwidth}
   \setlength{\itemsep}{-\itemsep}
   \renewcommand{\makelabel}{\descriptionlabel}}}%
  {\end{list}}
  

% Environment to temporarly change the pagewidth

\newenvironment{changemargin}[2]{%
  \begin{list}{}{%
    \setlength{\topsep}{0pt}%
    \setlength{\leftmargin}{#1}%
    \setlength{\rightmargin}{#2}%
    \setlength{\listparindent}{\parindent}%
    \setlength{\itemindent}{\parindent}%
    \setlength{\parsep}{\parskip}%
  }%
  \item[]}{\end{list}}

% Description environment where the item described is typeset in
% italics.

\newenvironment{descriptionItalicA}
{
  \begin{description}[font=\itshape,labelindent=0mm,leftmargin=*,topsep=0mm]
}
{
  \end{description}
}

% Description environment with the description on the next line.

\newenvironment{descriptionB}
{
  \begin{description}[style=nextline,leftmargin=17mm,topsep=0mm,noitemsep]
}
{
  \end{description}
}

% Useful description list that indents based on the length of a
% parameter, presumably the longest label.

\newenvironment{VarDescription}[1]%
  {\begin{list}{}{\renewcommand{\makelabel}[1]{\textbf{##1:}\hfil}%
    \settowidth{\labelwidth}{\textbf{#1:}}%
    \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}}}%
  {\end{list}}

% Same without itemseparation
  
\newenvironment{VarDescriptionNoSep}[1]%
  {\begin{list}{}{\renewcommand{\makelabel}[1]{\textbf{##1:}\hfil}%
    \settowidth{\labelwidth}{\textbf{#1:}}%
	\setlength{\itemsep}{-\itemsep}%
    \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}}}%
  {\end{list}}

%
%   Italized theorem-like environments
%
\newtheorem{theorem}{Theorem}[section]
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
%
%   Non-italized theorem-like environments:
%
\newtheorem{@definition}[theorem]{Definition}
\newenvironment{definition}{\begin{@definition}\upshape}{\end{@definition}}
\newtheorem{@remark}[theorem]{Remark}
\newenvironment{remark}{\begin{@remark}\upshape}{\end{@remark}}
\newtheorem{@example}[theorem]{Example}
\newenvironment{example}{\begin{@example}\upshape}{\end{@example}}
\newtheorem{@convention}[theorem]{Convention}
\newenvironment{convention}{\begin{@convention}\upshape}{\end{@convention}}
\newtheorem{@fact}[theorem]{Fact}
\newenvironment{fact}{\begin{@fact}\upshape}{\end{@fact}}
\newtheorem{@question}[theorem]{Question}
\newenvironment{question}{\begin{@question}\upshape}{\end{@question}}
%
%   Symbols for AmsTex and bth
%
\newcommand{\bthcslogo}[1]{%
   \includegraphics[width=#1]{bth}%
}
\newcommand{\bthcsnotextlogo}[1]{%
   \includegraphics[width=#1]{bthnotext}%
}
\newcommand{\bthlogo}[1]{%
   \includegraphics[width=#1]{bth}%
}

\endinput
