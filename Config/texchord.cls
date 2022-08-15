%==================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texchord}[2019/07/10 v0.0.1 by Walysson P. dos Reis]
%==================================================================
\LoadClass[12pt]{article}% Classe base do documento: Artigo
%==================================================================
\RequirePackage[utf8]{inputenc} % Reconhecimento de car.especiais.
\RequirePackage[chorded,noshading]{songs} % Songs Package.
\RequirePackage{xcolor} % Cores do documento.
\RequirePackage{listings} % Escreve bloco de cod. usado para TAB.
\RequirePackage{pst-barcode,pstricks} % QR-CODE.
\RequirePackage{bashful} % Buscar arquivos nos diretorios auto.
\RequirePackage{verbatim} % Fazer comentário em bloco.
\RequirePackage[ 
a4paper % Formato de papel.
,includeheadfoot % Incluir cabeçalho e rodapé.
,hmarginratio={2:1} % Aspecto entre texto e a margem horizontal.
,vmarginratio={1:1} % Aspecto entre texto e a margem vertical.
,outer={1.2cm} % Tamanho de margem esquerda e direita.
,bmargin={0.0cm} % Tamanho de margem superior e inferior.
]{geometry}% Formatação do documento.
%---------------------------------------------------------------
\RequirePackage[LGR,T1]{fontenc} % Base para as fontes
\RequirePackage{cyklop} % Fonte Cyklop | \scshape \itshape
\RequirePackage[sfdefault]{roboto}  % Fonte Roboto | \roboto
\usepackage{hyperref} % Permite hyperlink nas paginas
%================================================================
\pagestyle{empty}
%================================================================
% Entradas Do Cabeçalho
\newsongkey{album}{\let\songalbum\@empty}{\def\songalbum{#1}}
\newsongkey{id}{\let\songid\@empty}{\def\songid{#1}}
\newsongkey{rev}{\let\songrev\@empty}{\def\songrev{#1}}
\newsongkey{qr}{\let\songqr\@empty}{\def\songqr{#1}}
%================================================================
\renewcommand{\printsongnum}[1]{ % Definições do QR-CODE
    \begin{pspicture}(25mm,25mm) 
	\psbarcode[linecolor=qr]{\songqr}{eclevel=H width=1.0 height=1.0}{qrcode}
    \end{pspicture}    
}
%---------------------------------------------------------------
\renewcommand{\extendprelude}{ % Definições do Cabeçalho 
	{\showauthors\\}% Formatação Artista
	{\hbox{\footnotesize\it\color{album}\songalbum}}% Formatação @walyssondosreis
	{\hbox{\footnotesize\it\scshape\color{cod}\songid\ \color{rev}(Rev.\songrev)}} % Formatação Cod. e Rev
}
%---------------------------------------------------------------
\renewcommand{\printversenum}[1]{ % Definições do num. do Verso
\color{numVerse}\it\small#1. 
}
%================================================================
\renewcommand{\stitlefont}{\fontsize{28}{12}\scshape\bfseries\color{title}}% Formatação Título
\renewcommand{\showauthors}{\fontsize{22}{12}\scshape\bfseries\color{artist}\songauthors} % Formatação Artista
\renewcommand{\printchord}[1]{\fontsize{13}{12}\roboto\color{chord}{\bf#1}} % Formatação Acordes
\renewcommand{\lyricfont}{\normalsize\roboto\color{lyric}} % Formatação Letra
\renewcommand{\chorusfont}{\normalsize\it} % Formatação Refrão
%================================================================
\setlength{\songnumwidth}{7.5em} % Alinhamento QR-CODE
\setlength{\versenumwidth}{1em} % Alinhamento Versos
\setlength{\parindent}{0.5em} % Alinhamento Figura de Acordes
%================================================================
\newcommand{\tom}[2]{ % Macro de TOM
    \vspace{-1.0em}\musicnote{
	\color{tom}\normalsize\it\scshape Tom:\printchord{ \bf#1 }
    \color{tomArtist} \small \{ Tom do artista:{ \normalfont{\it#2}} \}
	}\vspace{-0.5em}
}
%---------------------------------------------------------------
\newcommand{\seq}[3]{ % Macro de Seq. de Acordes (Riff,Intro,etc)
	\vspace{-0.4em}\musicnote{
	\color{seq}\it\small\scshape{[ #1 ]:} \printchord{( \bf#2 )}  #3
	}\vspace{-0.6em}
}
%---------------------------------------------------------------
\newcommand{\act}[3]{ % Macro de Ações 
	\vspace{-0.4em}\musicnote{
	\small\it\scshape\color{act} {[ #1: #2 ]} {#3} 
	}\vspace{-0.6em}
}
%---------------------------------------------------------------
\newcommand{\tab}[1]{ % Macro de Tabalhatura
    \vspace{-0.4em}\musicnote{
    \footnotesize\bf {[#1]} }
	\vspace{-0.6em}
}
%================================================================