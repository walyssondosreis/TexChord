%==================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texchord}[2019/07/10 v0.0.1 by Walysson P. dos Reis]
%==================================================================
\LoadClass[12pt]{article}
%==================================================================
\RequirePackage[chorded,noshading]{songs}
\RequirePackage{xcolor} % Cores do Documento.
\RequirePackage{listings} % Escreve bloco de cod. usado para TAB.
\RequirePackage{pst-barcode,pstricks} % QR-CODE.
\RequirePackage[ 
a4paper % Formato de papel.
,includeheadfoot % Inclui cabeçalho e rodapé.
,hmarginratio={2:1} % Aspecto entre texto e a margem horizontal.
,outer={1.2cm} % Tamanho de margem esquerda e direita.
,vmarginratio={1:1} % Aspecto entre texto e a margem vertical.
,bmargin={0.0cm} % Tamanho de margem superior e inferior.
]{geometry}% Geométria do Documento.
\RequirePackage[utf8]{inputenc}
\RequirePackage[LGR,T1]{fontenc}
\RequirePackage[sfdefault]{roboto}
\RequirePackage{roboto-mono}
%================================================================
\pagestyle{empty}
%---------------------------------------------------------------
% Padrão de Cores do Documento

\definecolor{artist}{HTML}{1C1C1C}% Artista
\definecolor{chord}{HTML}{4F4F4F}% Acorde Na Letra
\definecolor{act-gray}{HTML}{808080}% Ações
\definecolor{qrColor}{HTML}{000000}% QR-CODE
\definecolor{titleColor}{HTML}{6A5ACD}% Título 
\definecolor{lyricColor}{HTML}{008000}% Letra

%---------------------------------------------------------------
\color{red}
%---------------------------------------------------------------
\newsongkey{album}{\let\songalbum\@empty}{\def\songalbum{#1}}
\newsongkey{id}{\let\songid\@empty}{\def\songid{#1}}
\newsongkey{rev}{\let\songrev\@empty}{\def\songrev{#1}}
\newsongkey{qr}{\let\songqr\@empty}{\def\songqr{#1}}
%================================================================
\newcommand{\tom}[2]{ % Macro de TOM
    \vspace{-1.0em}
	\musicnote{
	\small\it\color{pink}{Tom:} \color{chord}{\bf{#1}}
    \color{yellow} \{ Tom do artista:{ #2} \}
	}\vspace{-0.5em}
}
%---------------------------------------------------------------
\newcommand{\seq}[3]{ % Macro de Seq. de Acordes (Riff,Intro,etc)
	\vspace{-0.4em}
	\musicnote{
	\color{orange}\it\small{[ #1 ]:} \printchord{( \bf#2 })  #3
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
	\small\it\color{red} {[ #1: #2 ]} {#3} 
	}\vspace{-5pt}
}
%================================================================
\renewcommand{\printsongnum}[1]{ % TAG do QR-CODE
    \begin{pspicture}(27mm,27mm) 
	\psbarcode[linecolor=qrColor]{\songqr}{eclevel=H width=1.1 height=1.1}{qrcode}
    \end{pspicture}    
}
\renewcommand{\printversenum}[1]{\color{blue}\it\small#1.\ } % Num. Do Verso
%---------------------------------------------------------------
\renewcommand{\extendprelude}{
    
	{\bfseries\large\showauthors}
	{\hbox{\color{blue}\footnotesize\it\songalbum}}
	{\hbox{\color{brown}\footnotesize\it\songid\ \color{red}(Rev.\songrev)}}
}
%---------------------------------------------------------------
\renewcommand{\stitlefont}{\color{titleColor}\Huge\bf}
\renewcommand{\printchord}[1]{\color{chord}\small{\bf#1}} % Fonte de acordes
\renewcommand{\lyricfont}{\color{lyricColor}\normalfont\normalsize} %Fonte da letra
\renewcommand{\chorusfont}{\it}
\renewcommand{\showauthors}{\LARGE\color{artist}\hbox{\songauthors}}
%---------------------------------------------------------------
\setlength{\parindent}{0.5em} % Identação do Dicionario de Acordes
\setlength{\versenumwidth}{1em} % Identação dos Versos
\setlength{\songnumwidth}{7.9em} % Identação do QR-CODE
%================================================================