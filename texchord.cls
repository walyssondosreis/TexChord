%==================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texchord}[2019/07/10 v0.0.1 by Walysson P. dos Reis]
%==================================================================
\LoadClass[12pt]{article}
%==================================================================
\RequirePackage[chorded,noshading]{songs}
\RequirePackage{xcolor}
\RequirePackage{listings} % Escreve bloco de cod. usado para TAB.
\RequirePackage[
a4paper % Formato de papel.
,includeheadfoot % Inclui cabeçalho e rodapé.
,hmarginratio={2:1} % Aspecto entre texto e a margem horizontal.
,outer={1.2cm} % Tamanho de margem esquerda e direita.
,vmarginratio={1:1} % Aspecto entre texto e a margem vertical.
,bmargin={0.0cm} % Tamanho de margem superior e inferior.
]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[LGR,T1]{fontenc}
\RequirePackage[sfdefault]{roboto}
\RequirePackage{roboto-mono}
%================================================================
\nosongnumbers
\pagestyle{empty}
%---------------------------------------------------------------
\definecolor{chord-orange}{HTML}{e65c00}
\definecolor{chord-yellow}{HTML}{e68a00}
\definecolor{chord-purple}{HTML}{8600b3}
\definecolor{chord-red}{HTML}{cc0000}
\definecolor{chord-green}{HTML}{003300}
\definecolor{chord-brown}{HTML}{663300}
\definecolor{chord-blue}{HTML}{0000b3}
\definecolor{artist-blue}{HTML}{0000ff}
%---------------------------------------------------------------
\newsongkey{album}{\let\songalbum\@empty}{\def\songalbum{#1}}
\newsongkey{id}{\let\songid\@empty}{\def\songid{#1}}
%================================================================
\newcommand{\tom}[1]{ % Macro de TOM
    \vspace{-0.5em}
	\musicnote{\bf\small Tom: \printchord{#1}}
	\vspace{-0.4em}
}
%---------------------------------------------------------------
\newcommand{\seq}[3]{ % Macro de Seq. de Acordes (Riff,Intro,etc)
	\vspace{-0.4em}
	\musicnote{\small{[#1]:} ( \printchord{\bf#2 }\color{black})  #3
	}
	\vspace{-0.5em}
}
%---------------------------------------------------------------
\newcommand{\tab}[1]{ % Macro de Tabalhatura
    \vspace{-5pt}
	\musicnote{\footnotesize\bf {[#1]} }
	\vspace{-5pt}
}
%---------------------------------------------------------------
\newcommand{\act}[3]{ % Macro de Ações 
	\vspace{-5pt}
	\musicnote{\nolyrics\small {[ #1: #2 ]} {#3} }
	\vspace{-5pt}
}
%================================================================
\renewcommand{\extendprelude}{
	{\bfseries\large\showauthors}
	{\hbox{\footnotesize\it\songalbum}}
	{\hbox{\footnotesize\it\songid}}
}
%---------------------------------------------------------------
\renewcommand{\stitlefont}{\LARGE\bf}
\renewcommand{\printchord}[1]{\color{chord-orange}\small{\bf#1}} % Fonte de acordes
\renewcommand{\lyricfont}{\normalfont\normalsize} %Fonte da letra
\renewcommand{\chorusfont}{\it}
\renewcommand{\showauthors}{\color{chord-orange}\hbox{\songauthors}}
%---------------------------------------------------------------
\setlength{\parindent}{0.5em} % Identação do Dicionario de Acordes
\setlength{\versenumwidth}{1em} % Identação dos Versos
%================================================================