\ProvidesClass{deedy-resume}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[tikz]{article}

\usepackage[lmargin=0.05in, vmargin=0.375cm, rmargin=0.5cm]{geometry}
\usepackage{hyperref}
\usepackage{amssymb}

\usepackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows,shapes}
\usetikzlibrary{arrows.meta}

\definecolor{primary}{HTML}{101010}
\definecolor{headings}{HTML}{202020}
\definecolor{topheadings}{HTML}{40a0F0}
\definecolor{subheadings}{HTML}{000000}
\definecolor{date}{HTML}{666666}

\usepackage{fontspec}

\setmainfont[Color=primary, Path = fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig}

\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}

\usepackage[absolute]{textpos}
\usepackage[UKenglish]{isodate}
\usepackage{mdframed}
\usepackage{calc}
\usepackage{luatextra}

\begin{luacode*}
selection="..." -- the characters we consider to be coloured
    function capme(text)
        text=" "..text -- the first letter of a string is also considered for change
        text=unicode.utf8.gsub(text, "([%s{])("..selection..")", "%1\\colorme{%2}")
        text=unicode.utf8.sub(text,2) -- delete that extra space
        print(text) -- a new text written to the terminal
        tex.print(text) -- deliver the result back to TeX
    end -- function capme
\end{luacode*}

\def\capme#1{%
    % We neither need \noexpand\textit nor \noexpand{#1} and \\textit.
    \directlua{capme([[#1]])}
}
\def\colorme#1{{\color{topheadings}{\fontspec[Path = fonts/raleway/]{Raleway-Heavy}\fontsize{11pt}{11pt}\selectfont #1}}}

\setlength{\TPHorizModule}{0.01\paperwidth}
\setlength{\TPVertModule}{0.01\paperwidth}
\newcommand{\lastupdated}{
\begin{textblock}{25}(0.4,10.5)
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

\usepackage[center]{titlesec}

\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionspace}{\vspace{5pt}}

\titleformat{\section}{
\fontspec[Path = fonts/raleway/]{Raleway-Bold}\fontsize{11pt}{11pt}\selectfont}{}{1em}{}

\let\oldsection\section
\renewcommand{\section}[1] {%
    \oldsection{\capme{#1}}
    \vspace{0.2cm}
}

\titleformat{\subsection}{
\color{subheadings}\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont}{}{0em}{}

\newcommand{\runsubsection}[1]{
\color{subheadings}\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont\textsc{#1} \normalfont
}

\newcommand{\descript}[1]{
\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{8pt}{13pt}\selectfont {#1} \normalfont}

\newcommand{\location}[1]{
\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{8pt}{12pt}\selectfont {#1\\} \normalfont\fontsize{9pt}{9pt}\selectfont}

\newcommand{\lstyle}[1]{
\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont \textcolor{headings}{#1}\normalfont\fontsize{9pt}{9pt}\selectfont}

\newcommand{\smalllstyle}[1]{
\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{10pt}\selectfont \textcolor{headings}{#1}\normalfont}

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
    \def\rhs{%
            \begin{minipage}{\textwidth-2em}
            \vspace{1em}

            \hspace{1em}\fontspec[Path = fonts/raleway/]{Raleway-Bold}\fontsize{12pt}{12pt}\selectfont{\capme{#1}}\normalfont

            \vspace{1em}

            #2
            \end{minipage}
    }
    \begin{tikzpicture}[<->]
        \node[anchor=north west,inner sep=0] (sidesection) at (15pt,0) {%
            \rhs
        };

        % \draw[-, line width=0.1em, color=topheadings]
        %     let
        %         \p{sw} = (sidesection.south west),
        %         \p{height} = (0, \y{sw})
        %         in
        %     (0, 0) -- (\p{height}) ;

        \draw[-{Stealth[scale=2, length=4, width=4]}, line width=0.1em, color=topheadings]
            let
                \p{sw} = (sidesection.north west),
                \p{height} = (0, \y{sw}-1.45em),
                \p{height1} = (-0.2, {\y{sw}-1.45em})
                in
            (\p{height1}) -- (\p{height}) ;

        % \draw[-{Stealth[scale=2, length=4, width=4]}, line width=0.1em, color=topheadings]
        %         let \p{titlesouth} = (title.south),
        %             \p{ssouth} = (sidesection.south),
        %             \p{to} = (\x{titlesouth}, {min(\y{ssouth}, \y{titlesouth})})
        %             in
        %         {(title.south) + (0, -5pt)}
        %         -+ (\p{to});

    \end{tikzpicture}
}

\newcommand{\sidesectionlast}[2]{%
    \def\lhs{\rotatebox{90}{\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{12pt}\selectfont \textcolor{topheadings}{\textsc{#1}}\normalfont}}
    \def\rhs{%
            \begin{minipage}{\textwidth-2em}
            #2
            \vspace{1em}
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
                (0, 0) -+ (-0.1em, 0);
    \end{tikzpicture}
}

\newcommand{\project}[3]{%
    \runsubsection{#1}\lstyle{| #2}\hfill\trial

    \begin{adjustwidth}{0pt}{10pt}
        #3
    \end{adjustwidth}

    \sectionspace
}

\newcommand{\work}[5]{%
    \runsubsection{#1}
    \descript{| #2}\hfill\trial

    \location{#3 | #4}
    \vspace{0.2em}
    #5

    \sectionspace
}

\newcommand{\namesection}[3]{%
\vspace{0pt}

\begin{tikzpicture}[<->,x=1pt,y=1pt]
    \node[anchor=south west,inner sep=0] (namesection) at (0,0) {%
        \begin{minipage}{\textwidth}
            \begin{center}

                \fontsize{24pt}{24pt}
                \fontspec[Path = fonts/lato/]{Lato-Hai}\selectfont{#1}
                \fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont{#2}

                \includesvg[height=20pt]{blackbird3-outlinesvg}

                \lstyle{%
                    #3
                }

            \end{center}
        \end{minipage}
    };

    \draw[-, line width=0.1em, color=topheadings] % lower left arc%
        {(namesection.south west)+(5, -20)}
        arc (180:90:10);

    % draw the bottom line
    \draw[-, line width=0.1em, color=topheadings]
        let
            \p{sw} = (namesection.south west),
            \p{se} = (namesection.south east),
            \p{from} = ({\x{sw} + 15}, {\y{sw} - 10}),
            \p{to} = ({\x{se} - 10}, {\y{se} - 10})
        in
        (\p{from}) -+ (\p{to}) ;

    % the right arc
    \draw[-, line width=0.1em, color=topheadings] % lower left arc%
        {(namesection.south east)+(-10, -10)}
        arc (-90:0:10);

    % the right line
    \draw[-, line width=0.1em, color=topheadings]
        (namesection.south east) -+ (namesection.north east) ;

    % top arrow
    \draw[-{Stealth[scale=2, length=4, width=4]},
          line width=0.1em, color=topheadings]
            {(namesection.north east) + (0, 0.01)} -- (namesection.north east);

    % the left line
    \draw[-, line width=0.1em, color=topheadings]
        let
            \p{sw} = (namesection.south west),
            \p{nw} = (namesection.north west),
            \p{from} = ({\x{sw} + 5pt, \y{sw} - 20pt}),
            \p{to} = ({\x{nw} + 5pt, \y{nw}})
        in
        (\p{from}) -+ (\p{to}) ;

    % the left arrow
    \draw[-{Stealth[scale=2, length=4, width=4]},
          line width=0.1em, color=topheadings]
            let \p{nw} = (namesection.north west),
                \p{to} = (\x{nw} + 5, \y{nw})
                in
            {(namesection.north west) + (5, 0.01)} -- (\p{to});


    \draw[-{Stealth[scale=2, length=4, width=4]},
          line width=0.1em, color=topheadings]
            (5, -20) -- (5, -30);

    % \begin{scope}[x={(namesection.south east)},y={(namesection.north west)}]
    %     \draw[-, line width=0.1em, color=topheadings] (0.95, -0.03) -- (0.95, 1);
    %     \draw[-{Stealth[scale=2, length=4, width=4]}, line width=0.1em, color=topheadings] (0.95, 1) -- (0.95, 0.99);
    %     \draw[-, line width=0.1em, color=topheadings] ({0.5em + 10pt}, -10pt) -- (0.88, -10pt);
    %     \draw[-, line width=0.1em, color=topheadings] (0.88,-10pt) arc (-90:0:0.07);
    %     \draw[-, line width=0.1em, color=topheadings] (0.5em,-20pt) arc (180:90:10pt);
    %     \draw[-{Stealth[scale=2, length=4, width=4]}, line width=0.1em, color=topheadings] (0.5em, -20pt) -- (0.5em, -30pt);
    % \end{scope}
\end{tikzpicture}
}

\newcommand*{\LargerCdot}{\raisebox{-0.25ex}{\scalebox{1.5}{$\cdot$}}}
\newcommand{\sepbullet}{\hspace{1pt}$\LargerCdot$\hspace{1pt}}
