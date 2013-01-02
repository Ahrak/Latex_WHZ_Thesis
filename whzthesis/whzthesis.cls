%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% whzthesis.cls                                                            %%
%% Author: Tommy Hartmann (toha@zlug.org)                                   %%
%%                                                                          %%
%% Based on the hgbthesis class file from fh-hagenberg / Wilhelm Burger     %%
%%          --> http://staff.fh-hagenberg.at/burger/diplomarbeit/           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{whzthesis}%[LaTeX-Vorlage fuer Master- und Bachelorarbeiten]

%Basis=> Koma Script Book Klasse:
\LoadClass 
[
  	%pdftex,               % PDFTex verwenden da wir ausschliesslich ein PDF erzeugen.
	a4paper,               % Wir verwenden A4 Papier.
	oneside,               % Einseitiger Druck.
	12pt,                  % Grosse Schrift, besser geeignet für A4.
	%halfparskip,          % Halbe Zeile Abstand zwischen Absätzen.
	smallheadings,         % kleine überschriften
	ngerman                % deutsch
	%chapterprefix,        % Kapitel mit 'Kapitel' anschreiben.
	%footsepline,          % Linie vor Fusszeile.
	%bibtotocnumbered,     % Literaturverzeichnis im Inhaltsverzeichnis nummeriert einfügen.
	%idxtotoc              % Index ins Inhaltsverzeichnis einfügen.
]
{scrbook}

\RequirePackage[utf8x]{inputenc}  % zeichenencoding
\RequirePackage[T1]{fontenc}      % schriftencoding
\RequirePackage{whz}	          % load associated style file whz.sty
\RequirePackage{ifthen}           % kontrollstrukturen für latex
\RequirePackage{color}            % eigene Farben definieren
\RequirePackage{array}            % array funktionalitäten
\RequirePackage{float}            % floating fixes
\RequirePackage{translator}	  	  % UEbersetzungen
%\RequirePackage{keystroke}	  	  % tastatur symbole
\RequirePackage{wasysym}	  	  % erweiterte symbole
\RequirePackage{amssymb}	 	  % erw. mathe symbole
\RequirePackage{paralist}
\RequirePackage{colortbl}
\RequirePackage[normalem]{ulem}
\RequirePackage[noindentafter]{titlesec} 
\RequirePackage{appendix}   		%%Anhang 
\RequirePackage{enumitem}   		%% custom Listen 
%\RequirePackage{minitoc} 			%paket für weitere inhaltsverzeichnisse

% \RequirePackage[ngerman]{babel} 
% \RequirePackage{translator} 
\RequirePackage{multibib}

%% Captions mit Fontgroesse "small" und Abstand vom Seitenrand
%%-------------------------------------------------------------
\RequirePackage[small,bf]{caption}
\setlength{\captionmargin}{5mm}
\setlength{\abovecaptionskip}{10pt}
\setlength{\belowcaptionskip}{10pt}


%%
\RequirePackage{lmodern}
%\fontfamily{cmr}  %computer modern roman
\fontfamily{ptm}   %Times New Roman
%\fontfamily{pbk}  %Bookman
%\fontfamily{phv}  %Helvetica
%\fontfamily{pcr}  %Courier
%\fontfamily{cmtt} %Typewriter

%% use serif font
%\renewcommand{\familydefault}{\sfdefault}

%%======================================
%%       Dokumenten-setup             %%
%%======================================================================

%Titel
\newcommand{\titlename}[1]{
  \title{#1}
  \newcommand{\thetitle}{#1}
}

%Author
\newcommand{\authorname}[1]{
  \author{#1}
  \newcommand{\theauthor}{#1}
}

%Art der Arbeit
\newcommand{\@batitel}{Bachelorarbeit}
\newcommand{\@matitel}{Masterthesis}
\newcommand{\@datitel}{Diplomarbeit}
\newcommand{\@doctitel}{Wissenschaftliche Arbeit}
\DeclareOption{bachelor}{\renewcommand{\@doctitel}{\@batitel}}
\DeclareOption{diplom}{\renewcommand{\@doctitel}{\@datitel}}
\DeclareOption{master}{\renewcommand{\@doctitel}{\@matitel}}
\newcommand{\insertdoctitel}{\@doctitel}

%Professoren / Betreuer
\newcommand{\@whza}{, WH Zwickau}
\newcommand{\@betreuerA}{\@MissingArg{Betreunder\ Professor??}}
%\DeclareOption{golubski}{\renewcommand{\@betreuer}{Prof. Dr. Wolfgang Golubski\@whza}}
%\DeclareOption{haeber}{\renewcommand{\@betreuer}{Prof. Dr. Anke Häber\@whza}}
%\DeclareOption{remke}{\renewcommand{\@betreuer}{Prof. Dr. Werner Remke\@whza}}
%\DeclareOption{krauss}{\renewcommand{\@betreuer}{Prof. Dr.-Ing. Ludwig Krauss\@whza}}
%\DeclareOption{beier}{\renewcommand{\@betreuer}{Prof. Dr. rer. nat. Georg Beier\@whza}}
%\DeclareOption{lenk}{\renewcommand{\@betreuer}{Prof. Dr. rer. nat. Dieter Lenk\@whza}}
%\DeclareOption{schwarz}{\renewcommand{\@betreuer}{Prof. Dr. rer. nat. Sibylle Schwarz\@whza}}

%Druckfreundliche Version
\newboolean{printfriendly} 		
\setboolean{printfriendly}{false} 	
\DeclareOption{printfriendly}{\setboolean{printfriendly}{true}}

%Selbständigkeitserklärung
\newboolean{showSSE} 		
\setboolean{showSSE}{false} 	
\DeclareOption{selbsterkl}{\setboolean{showSSE}{true}}

%Kurzfassung
\newboolean{showShort} 		
\setboolean{showShort}{false} 	
\DeclareOption{kurzfassung}{\setboolean{showShort}{true}}

%Glossar
\newboolean{showGlossar} 		
\setboolean{showGlossar}{false} 	
\DeclareOption{glossar}{\setboolean{showGlossar}{true}}

%Abbildungsverzeichnis
\newboolean{showAbbverz} 		
\setboolean{showAbbverz}{false} 	
\DeclareOption{abbverz}{\setboolean{showAbbverz}{true}}

%Tabellenverzeichnis
\newboolean{showTabverz} 		
\setboolean{showTabverz}{false} 	
\DeclareOption{tabverz}{\setboolean{showTabverz}{true}}

%Listingverzeichnis
\newboolean{showLstverz} 		
\setboolean{showLstverz}{false} 	
\DeclareOption{lstverz}{\setboolean{showLstverz}{true}}

\DeclareOption{english}{\renewcommand{\whz@MainLanguage}{english}}
\DeclareOption{german}{\renewcommand{\whz@MainLanguage}{german}}
\DeclareOption*{\ClassWarning{whzthesis}{Unknown document option "\CurrentOption"}}
\ProcessOptions
%% end class options ---------------------------------------------


%%======================================
%%       hyperlink and link setup     %%
%%======================================================================
\RequirePackage[T1,hyphens,obeyspaces,spaces]{url}
\urlstyle{sf}

\ifthenelse{\boolean{printfriendly}}{
   \definecolor{LinkColor}{rgb}{0,0,0}
}{
   \definecolor{LinkColor}{rgb}{0,0,0.5}
}


\RequirePackage{hyperref}
\hypersetup{
   % pdftitle={\thetitle},
   % pdfauthor={\theauthor},
   % pdfsubject={},
   % pdfcreator={\theauthor},
   % pdfproducer={\theauthor},
   % pdfkeywords={},
    colorlinks=true,%        Aktivieren von farbigen Links im Dokument (keine Rahmen)
    linkcolor=LinkColor,%    Farbe festlegen.
    citecolor=LinkColor,%    Farbe festlegen.
    filecolor=LinkColor,%    Farbe festlegen.
    menucolor=LinkColor,%    Farbe festlegen.
    urlcolor=LinkColor%     Farbe von URL's im Dokument.
    %bookmarksnumbered=true%  �berschriftsnummerierung im PDF Inhalt anzeigen.
}%


%===========================================
%    Glossaries Stuff			%%
%============================================================================
 
%Glosar/Begriffserklärungen:
\RequirePackage[toc,acronym=true,translate=true]{glossaries}
%Glossar-Übersetzungen:
\RequirePackage{glossaries-babel}
\newcommand{\abk}[1]{\gls{#1}}
%Glossaries Docu: ftp://ftp.rrzn.uni-hannover.de/pub/mirror/tex-archive/macros/latex/contrib/glossaries/glossaries.pdf
%Beginners Guide: ftp://ftp.rrzn.uni-hannover.de/pub/mirror/tex-archive/macros/latex/contrib/glossaries/glossariesbegin.pdf

 
%===========================================
%	 set spacing 			%%
%============================================================================
%\setlength{\topmargin}{-50mm}
\RequirePackage[
    a4paper,
    reset,
	left=35mm,right=15mm,lines=46
]{geometry}
\RequirePackage{setspace}
\onehalfspacing                   % Zeilenabstand text
%\linespread{1.5}
\setstretch{1.2}		
\setlength{\itemsep}{0pt}         % Zeilenabstand aufzaehlung
%\setlength{\parsep}{0pt}         % zeilenabstand ???
\setlength{\parindent}{0in}	 	  % Einzug vor Absatzbegin
\RequirePackage{enumitem}	      % fix excessive vertical spacing in lists
\setlist{%                        %set spacings for lists
	partopsep = .0ex plus .1ex, 
	topsep    = .6ex plus .3ex, 
	itemsep   = .0ex plus .1ex, 
	parsep    = .4ex plus .2ex
}
% 
%weniger voffset -> weniger oberer seitenabstand
%\addtolength{\voffset}{-5mm}
%mehr texthoehe -> weniger unterer seitenabstand
%\addtolength{\textheight}{25mm}


%===========================================
%	 Anlagenmakros 			%%
%============================================================================
\RequirePackage{tocloft}
\newcommand{\anlagen}{%
	\newpage
% 	\addcontentsline{toc}{section}{Anlagenverzeichnis}
	\addcontentsline{toc}{chapter}{Anlagenverzeichnis}
	\listofanlage	
}
\newcommand{\listanlagename}{Anlagenverzeichnis}
\newlistof{anlage}{anl}{\listanlagename}
\newcommand{\anlage}[1]{%					
	\newpage
	\refstepcounter{anlage}
% 	
	%\Large\textbf{Anlage \Alph{anlage} }
	\chapter{#1}
	\normalsize
	%\vspace{7mm}
	\addcontentsline{anl}{section}{\textbf{Anlage \Alph{anlage}: #1}}
}

%%======================================
%%       document param setup        %%
%%======================================================================

\newcommand{\@gebdatum}{\@MissingArg{Geburtsdatum??}}
\newcommand{\gebdatum}[1]{%
	\renewcommand{\@gebdatum}{#1}
}

\newcommand{\@gebort}{\@MissingArg{Geburtsort??}}
\newcommand{\gebort}[1]{%
	\renewcommand{\@gebort}{#1}
}

\newcommand{\@hochschule}{Westsächsische Hochschule Zwickau}
\newcommand{\hochschule}[1]{%
	\renewcommand{\@hochschule}{#1}
}


\newcommand{\@fakultaet}{Fakultät Physikalische Technik / Informatik}
\newcommand{\fakultaet}[1]{%
	\renewcommand{\@fakultaet}{#1}
}


\newcommand{\@fachgruppe}{Fachgruppe Informatik}
\newcommand{\fachgruppe}[1]{%
	\renewcommand{\@fachgruppe}{#1}
}

\newcommand{\@studiengang}{Informatik}
\newcommand{\studiengang}[1]{%
	\renewcommand{\@studiengang}{#1}
}

\newcommand{\@studienort}{Zwickau}
\newcommand{\studienort}[1]{%
	\renewcommand{\@studienort}{#1}
}

\newcommand{\betreuerA}[1]{%
	\renewcommand{\@betreuerA}{#1}
}

\newcommand{\@betreuerB}{}
\newcommand{\betreuerB}[1]{
	\renewcommand{\@betreuerB}{#1}
}


\newcommand{\@nummer}{\@MissingArg{Arbeit Nummer??}}
\newcommand{\nummer}[1]{%
	\renewcommand{\@nummer}{#1}
}

\newcommand{\@gegenstand}{\@MissingArg{Gegenstand??}}
\newcommand{\gegenstand}[1]{%
	\renewcommand{\@gegenstand}{x#1}
}

\newcommand{\@semester}{\@MissingArg{Semester??}}
\newcommand{\semester}[1]{%
	\renewcommand{\@semester}{#1}
}

\newcommand{\@abgabedatum}{\@MissingArg{Monat??}}
\newcommand{\damonat}[1]{%
	\renewcommand{\@abgabedatum}{#1}
}
\newcommand{\abgabedatum}[1]{%
	\renewcommand{\@abgabedatum}{#1}
}


%%==========================================
%%      inject stuff into document        %%
%%=============================================================================

\AtBeginDocument{
%%%----------------------------------------------------------
\maketitle%
\setcounter{page}{1}
\setcounter{tocdepth}{1}
\pagenumbering{roman}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}} 
\pagestyle{empty}

    %Selbständigkeitserklärung
    \ifthenelse{\boolean{showSSE}}
    {
      \clearpage
      \thispagestyle{plain}
      \include{precontent/selbsterkl}
    }{}

    %Kurzfassung
    \ifthenelse{\boolean{showShort}}
    {
      \thispagestyle{plain}
      \include{precontent/kurzfassung}
    }{}

    %Inhaltsverzeichnis
    \thispagestyle{plain}
    \addcontentsline{toc}{chapter}{Inhaltsverzeichnis}
    \tableofcontents
    \thispagestyle{plain}
   
    %Glossar
    %-----------TODO---------------------------------
      \include{precontent/abkuerzungen}
      \makeglossaries 
      \deftranslation[to=\whz@MainLanguage]{Acronyms}{Abkürzungsverzeichnis} 
      \ProvidesDictionary{glossaries-dictionary}{\whz@MainLanguage}
    %--------------------------------------------
	  \makeatother
	  \makeindex
	  \makeglossaries
    \ifthenelse{\boolean{showGlossar}}
    {
	  %\printglossary[toctitle=Glossar,  style=super3colheader]
	  %\printglossary[toctitle=Glossar,  style=long3col]
	  \printglossary[type=\acronymtype, title=Abkürzungsverzeichnis, 
			 style=super3colheader , toctitle=Abkürzungsverzeichnis]	  
    }{}

    %Tabellenverzeichnis
    \ifthenelse{\boolean{showTabverz}}
    {
	  \clearpage
	  \listoftables
	  \addcontentsline{toc}{chapter}{Tabellenverzeichnis}
	
    }{}

    %aBBILDUNGSverzeichnis
    \ifthenelse{\boolean{showAbbverz}}
    {
	  \clearpage
	  \listoffigures
	  \addcontentsline{toc}{chapter}{Abbildungsverzeichnis}	
    }{}
	 
    %Listingverzeichnis
    \ifthenelse{\boolean{showLstverz}}
    {
      \renewcommand{\lstlistlistingname}{Listingverzeichnis}
	  \lstlistoflistings
	  \addcontentsline{toc}{chapter}{Listingverzeichnis}
    }{}

	%Anlagenverzeichnis
	{
		\anlagen
	}
	    
  \clearpage
  \pagenumbering{arabic}
  \setcounter{page}{1}

\pagestyle{scrheadings}
}

\AtEndDocument{
%%%----------------------------------------------------------

%Wenn noch todos da sind:
\ifnum\thetodocnt>0
{

    \chapter*{ToDo-Liste}
	\addcontentsline{toc}{chapter}{ToDo-Liste}
    \listoftodos
}
\fi

%Literaturverzeichnis
\clearpage 
\addcontentsline{toc}{chapter}{\bibname}
\bibliographystyle{alphadin} 
\bibliography{literatur/literatur}     %BibTeX-Datei literatur.bib
\label{chap:bib}
\clearpage

\include{appendix/Anhang}

}

%%=====================================
%%      Define Page-Templates        %%
%%=============================================================================

%------------------ Titelseiten -------------------\@title
\newcommand{\@titleseite}{%
\begin{titlepage}%
\begin{spacing}{1.0}%
\begin{minipage}{\textwidth}%
\vfill%FLOAT
\par\noindent
\vspace*{32mm}
	\begin{center}%
	  {\centering\Huge\textbf{\@doctitel}}%
	  \vspace*{22mm}%
	  {
		  %\setlength{\baselineskip}{20pt}
		  \hspace*{0.2cm}
		  \begin{minipage}{\textwidth}
		  {
			  \begin{center}
			  \Large\bf\@title
			  \end{center}
		  }
		  \end{minipage}    
	  } 

	  \vspace*{20mm}%
	  {\large\bf\@author}\\%
	  \vspace*{9mm}%
	  {geboren am \@gebdatum\  in \@gebort}\\%
	  \vspace*{20mm}%
	  {Studiengang \@studiengang}\\%
	  \vspace*{30mm}%
      {\@hochschule \\[1mm] \@fakultaet \\[1mm] \@fachgruppe}%
	\end{center}
    \vskip 16mm%
	\begin{tabular}{p{0.32\textwidth}l}
		Betreuer, Einrichtung:  & \@betreuerA \\
        \                       & \@betreuerB \\[5mm]
		Abgabetermin:           & \@abgabedatum \\
	\end{tabular}
\vfil\null%
\end{minipage}%
\end{spacing}%
\end{titlepage}%
%--------------------------------------------------
%\newcommand{\thetitle}{\@title}
%\newcommand{\theauthor}{\@author}
}

%------------------ Copyright-Seite -------------------
\newcommand{\@copyrightseite}{%
\newpage
\setcounter{page}{2}
\thispagestyle{plain}
\rule{0mm}{1mm}
\vspace*{75mm}
\begin{center}
\ifthenelse{\equal{\whz@MainLanguage}{german}}%
	{\copyright\ Copyright\ \@abgabejahr\ \@author\\
	\vspace{3mm} Alle Rechte vorbehalten}{}
\ifthenelse{\equal{\whz@MainLanguage}{english}}%
	{\copyright\ Copyright\ \@abgabejahr\ \@author\\
	\vspace{3mm} All Rights Reserved}{}
%\vspace{75mm} \copyright\ Copyright\ \@author\ \@abgabejahr\\
\end{center}
}

%------------------ Betreuer-Seite -------------------
\newcommand{\@babetreuerseite}{%
\newpage
\setcounter{page}{2}
\thispagestyle{plain}
\rule{0mm}{1mm}
\begin{center}
%
\vspace{40mm} 
{Diese Arbeit entstand im Rahmen des Gegenstands}\\
\vspace{6mm} 
{\Large\sf \@gegenstand\\ \mbox{}}\\
\medskip
im\\
\bigskip
{\@semester}\\
%
\vspace{45mm} 
{Betreuer:}\\
\vspace{3mm} 
{\Large\sf \@betreuerA\\ \mbox{}}
\end{center}
}

%------------ Struktur der Frontseiten -------------------

\renewcommand{\maketitle}{	%replace standard LaTeX-command
    \@titleseite
}

%%========================
%%      Headings        %%
%%=============================================================================
\RequirePackage[automark]{scrpage2} % Kopf- und Fusszeilen formatieren
\pagestyle{scrheadings}

%rewrite the \leftmark command --> translate chapter keyword
\renewcommand\chaptermark[1]{%
    \markboth{Kapitel \thechapter: #1}{}
}%

%rewrite the \rightmark command --> without chapter keyword and number!
\renewcommand\sectionmark[1]{%
    \markright{#1}
}%

\clearscrheadfoot               % clear head
\setheadsepline{0.4pt}          % set header line
\ihead{\footnotesize\textnormal\leftmark}               % left head
\chead{}                         % center head
\ohead{\footnotesize\textnormal\rightmark}              % right head

\ifoot{}
\cfoot[\pagemark]{\textnormal{\thepage}}                % pagenumber in foot
\ofoot{}


%%================================
%%      Additional Setup        %%
%%=============================================================================
\RequirePackage[noadjust]{cite} % vermeidet zusätzliches Spacing vor [..]

\RequirePackage{ifpdf}
\ifpdf % LaTeX is in native PDF mode (pdflatex) 
  \RequirePackage{epstopdf}		% zur automatischen Konvertierung von EPS-Dateien nach PDF für pdflatex
%  \pdfcompresslevel=0			  % 0 = keine Kompression, 9 = max. Kompression
%  \pdfimageresolution=300
\else % LaTeX is in emulation mode (DVI-PS-PDF)
  \RequirePackage[hyphenbreaks]{breakurl}	% erlaubt Zeilenumbruch von URLs auch ohne pdflatex (DIV, PS, PDF)
\fi	


\endinput