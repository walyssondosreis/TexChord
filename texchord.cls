%==================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texchord}[2019/07/10 v0.0.1 by Walysson P. dos Reis]
%==================================================================
\LoadClass[12pt]{article}
%==================================================================
\RequirePackage[chorded,noshading]{songs}
\RequirePackage{xcolor}
\RequirePackage{listings} % Escreve bloco de cod. usado para TAB.
\RequirePackage{pst-barcode} % QR-CODE ,pstricks
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
%\nosongnumbers
\pagestyle{empty}
%---------------------------------------------------------------
\definecolor{chord-orange}{HTML}{e65c00}
\definecolor{chord-gray}{HTML}{A9A9A9}
\definecolor{artist-gray}{HTML}{696969}
\definecolor{act-gray}{HTML}{C0C0C0}
%---------------------------------------------------------------
\newsongkey{album}{\let\songalbum\@empty}{\def\songalbum{#1}}
\newsongkey{id}{\let\songid\@empty}{\def\songid{#1}}
\newsongkey{rev}{\let\songrev\@empty}{\def\songrev{#1}}
\newsongkey{qr}{\let\songqr\@empty}{\def\songqr{#1}}
%================================================================
\newcommand{\tom}[2]{ % Macro de TOM
    \vspace{-1.0em}
	\musicnote{
	\small\it\color{chord-gray}{Tom:} \color{artist-gray}{#1}
    \color{chord-gray} \{ Tom do artista:{ #2} \}
	}\vspace{-0.5em}
}
%---------------------------------------------------------------
\newcommand{\seq}[3]{ % Macro de Seq. de Acordes (Riff,Intro,etc)
	\vspace{-0.4em}
	\musicnote{
	\color{chord-gray}\it\small{[ #1 ]:} ( \printchord{\bf#2 })  #3
	}\vspace{-0.5em}
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
	\musicnote{
	\small\it\color{act-gray} {[ #1: #2 ]} {#3} 
	}\vspace{-5pt}
}
%================================================================
\renewcommand{\printsongnum}[1]{ % TAG do QR-CODE
    \begin{pspicture}(25mm,25mm) 
	\psbarcode{\songqr}{eclevel=H width=1.0 height=1.0}{qrcode}
    \end{pspicture}    
}
\renewcommand{\printversenum}[1]{\color{act-gray}\it\scriptsize#1.\ } % Num. Do Verso
%---------------------------------------------------------------
\renewcommand{\extendprelude}{
    
	{\bfseries\large\showauthors}
	{\hbox{\footnotesize\it\songalbum}}
	{\hbox{\footnotesize\it\songid\ (Rev.\songrev)}}
}
%---------------------------------------------------------------
\renewcommand{\stitlefont}{\LARGE\bf}
\renewcommand{\printchord}[1]{\color{chord-gray}\small{\bf#1}} % Fonte de acordes
\renewcommand{\lyricfont}{\normalfont\normalsize} %Fonte da letra
\renewcommand{\chorusfont}{\it}
\renewcommand{\showauthors}{\color{artist-gray}\hbox{\songauthors}}
%---------------------------------------------------------------
\setlength{\parindent}{0.5em} % Identação do Dicionario de Acordes
\setlength{\versenumwidth}{1em} % Identação dos Versos
\setlength{\songnumwidth}{7.3em} % Identação do QR-CODE
%================================================================