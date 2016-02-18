\ProvidesClass{deedy-resume}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[tikz]{article}

\usepackage[lmargin=0.625cm, vmargin=0.375cm, rmargin=0.5cm]{geometry}
\usepackage{hyperref}
\usepackage{amssymb}

\usepackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows,shapes}
\usetikzlibrary{arrows.meta}

\definecolor{primary}{HTML}{101010}
\definecolor{headings}{HTML}{202020}
\definecolor{topheadings}{HTML}{F0a050}
\definecolor{subheadings}{HTML}{000000}
\definecolor{date}{HTML}{666666}

\usepackage{fontspec}

\setmainfont[Color=primary, Path = fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig}

\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}

\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\usepackage{mdframed}
\usepackage{calc}

\setlength{\TPHorizModule}{0.01\paperwidth}
\setlength{\TPVertModule}{0.01\paperwidth}
\newcommand{\lastupdated}{
\begin{textblock}{25}(5,125)
\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont
Last Updated on \today
\end{textblock}}

\tikzstyle{every picture}+=[remember picture]

\newcommand{\chrule}[1]{\begin{minipage}{#1}
        \begin{mdframed}[rightline=false, leftline=false, bottomline=false, linewidth=1pt]
        \end{mdframed}
        \end{minipage}}

        \newcommand{\cvrule}[2]{\hspace{#1}\begin{minipage}{1pt}
        \begin{mdframed}[rightline=false, topline=false, bottomline=false]
            \vspace{#2}
        \end{mdframed}
        \end{minipage}}

\newcommand{\namesection}[3]{
\centering{
\fontsize{30pt}{45pt}
\fontspec[Path = fonts/lato/]{Lato-Hai}\selectfont #1
\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #2
} \\[5pt]
\centering{
\color{headings}
\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{8pt}{11pt}\selectfont #3}
}

\usepackage[center]{titlesec}

\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionspace}{\vspace{8pt}}

\titleformat{\section}{
\color{topheadings}\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{16pt}{24pt}\selectfont}{}{1em}{}

\titleformat{\subsection}{
\color{subheadings}\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{12pt}\selectfont}{}{0em}{}

\newcommand{\runsubsection}[1]{
\color{subheadings}\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{12pt}\selectfont\textsc{#1} \normalfont
}

\newcommand{\descript}[1]{
\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1} \normalfont}

\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

\newcommand{\lstyle}[1]{
\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont \textcolor{headings}{#1}\normalfont}

\newenvironment{tightitemize}
{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}

\usepackage{enumitem}
\renewcommand{\labelitemi}{\textcolor{topheadings}{$\mathbf{\rightarrow}$}}

\newcommand{\separatepages}[4]{%
    \vspace{2.5pt}
    \begin{minipage}[t]{#1\textwidth}
        #3
    \end{minipage}
    \begin{minipage}[t]{#2\textwidth}
        #4
    \end{minipage}
    \vspace{2.5pt}
}

\newcommand{\sidesection}[2]{%
    \def\lhs{\rotatebox{90}{\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{12pt}\selectfont \textcolor{topheadings}{\textsc{#1}}\normalfont}}
    \def\rhs{%
            \begin{minipage}{\textwidth-2em}
            #2
            \vspace{2em}
            \end{minipage}
    }
    \begin{tikzpicture}[<->]
        \node[anchor=north west,inner sep=0] (title) at (0,0) {%
            \lhs
        };

        \node[anchor=north west,inner sep=0] (sidesection) at (2em,0) {%
            \rhs
        };

        \draw[-{Stealth[scale=2, length=4, width=4]}, line width=0.1em, color=topheadings]
                let \p{titlesouth} = (title.south),
                    \p{ssouth} = (sidesection.south),
                    \p{to} = (\x{titlesouth}, {min(\y{ssouth}, \y{titlesouth})})
                    in
                {(title.south) + (0, -5pt)}
                -+ (\p{to});

    \end{tikzpicture}
}

\newcommand{\sidesectionlast}[2]{%
    \def\lhs{\rotatebox{90}{\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{12pt}\selectfont \textcolor{topheadings}{\textsc{#1}}\normalfont}}
    \def\rhs{%
            \begin{minipage}{\textwidth-2em}
            #2
            \vspace{10pt}
            \end{minipage}
    }
    \begin{tikzpicture}
        \node[anchor=north west,inner sep=0] (title) at (0,0) {%
            \lhs
        };

        \node[anchor=north west,inner sep=0] (sidesection) at (2em,0) {%
            \rhs
        };


    \end{tikzpicture}
}

\newcommand{\trial}{%
    \begin{tikzpicture}[<->,x=1em, y=1em]
        \draw[-{Stealth[scale=2, length=4, width=4]}, line width=0.1em, color=topheadings]
                (0, 0) -+ (0, 0.25em);
    \end{tikzpicture}
}

\newcommand*{\LargerCdot}{\raisebox{-0.25ex}{\scalebox{1.5}{$\cdot$}}}
\newcommand{\sepbullet}{\hspace{1pt}$\LargerCdot$\hspace{1pt}}
