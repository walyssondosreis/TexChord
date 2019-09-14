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
a4paper % Formato de papel.qr
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
\definecolor{qr}{HTML}{191970}% QR-CODE
\definecolor{title}{HTML}{000080}% Título 
\definecolor{artist}{HTML}{483D8B}% Artista
\definecolor{album}{HTML}{000080}% @walyssondosreis
\definecolor{cod}{HTML}{000080}% Código 
\definecolor{rev}{HTML}{483D8B}% Revisão
\definecolor{tom}{HTML}{000080}% Tom
\definecolor{tomArtist}{HTML}{191970}% Tom do Artista
\definecolor{seq}{HTML}{000080}% Sequencias 
\definecolor{chord}{HTML}{000080}% Acorde Na Letra
\definecolor{lyric}{HTML}{000000}% Letra
\definecolor{numVerse}{HTML}{000080}% Número do Verso
\definecolor{act}{HTML}{191970}% Ações
\definecolor{nameChord}{HTML}{000080}% Nome Desenho Acorde
\definecolor{drawChord}{HTML}{000080}% Desenho Acorde
\definecolor{general}{HTML}{000000}% Cor Geral
%---------------------------------------------------------------
\color{general} % Define cor ao restante do texto do documento
%================================================================
% Entradas Do Cabeçalho
\newsongkey{album}{\let\songalbum\@empty}{\def\songalbum{#1}}
\newsongkey{id}{\let\songid\@empty}{\def\songid{#1}}
\newsongkey{rev}{\let\songrev\@empty}{\def\songrev{#1}}
\newsongkey{qr}{\let\songqr\@empty}{\def\songqr{#1}}
%================================================================
\renewcommand{\printsongnum}[1]{ % Definições do QR-CODE
    \begin{pspicture}(27mm,27mm) 
	\psbarcode[linecolor=qr]{\songqr}{eclevel=H width=1.1 height=1.1}{qrcode}
    \end{pspicture}    
}
%---------------------------------------------------------------
\renewcommand{\extendprelude}{ % Definições do Cabeçalho 
	{\bfseries\large\showauthors}
	{\hbox{\color{album}\footnotesize\it\songalbum}}
	{\hbox{\color{cod}\footnotesize\it\songid\ \color{rev}(Rev.\songrev)}}
}
%---------------------------------------------------------------
\renewcommand{\printversenum}[1]{ % Definições do num. do Verso
\color{numVerse}\it\small#1. 
}
%================================================================
\renewcommand{\stitlefont}{\color{title}\Huge\bf}% Formatação Título
\renewcommand{\showauthors}{\LARGE\color{artist}\hbox{\songauthors}} % Formatação Autor
\renewcommand{\printchord}[1]{\color{chord}\small{\bf#1}} % Formatação Acordes
\renewcommand{\lyricfont}{\color{lyric}\normalfont\normalsize} % Formatação Letra
\renewcommand{\chorusfont}{\it} % Formatação Refrão
%================================================================
\setlength{\songnumwidth}{7.9em} % Alinhamento QR-CODE
\setlength{\versenumwidth}{1em} % Alinhamento Versos
\setlength{\parindent}{0.5em} % Alinhamento Figura de Acordes
%================================================================
\newcommand{\tom}[2]{ % Macro de TOM
    \vspace{-1.0em}\musicnote{
	\color{tom}\small\it{Tom:} \color{chord}{\bf{#1}}
    \color{tomArtist} \{ Tom do artista:{ #2} \}
	}\vspace{-0.5em}
}
%---------------------------------------------------------------
\newcommand{\seq}[3]{ % Macro de Seq. de Acordes (Riff,Intro,etc)
	\vspace{-0.4em}\musicnote{
	\color{seq}\it\small{[ #1 ]:} \printchord{( \bf#2 })  #3
	}\vspace{-0.5em}
}
%---------------------------------------------------------------
\newcommand{\act}[3]{ % Macro de Ações 
	\vspace{-5pt}\musicnote{
	\small\it\color{act} {[ #1: #2 ]} {#3} 
	}\vspace{-5pt}
}
%---------------------------------------------------------------
\newcommand{\tab}[1]{ % Macro de Tabalhatura
    \vspace{-5pt}\musicnote{
    \footnotesize\bf {[#1]} }
	\vspace{-5pt}
}
%================================================================