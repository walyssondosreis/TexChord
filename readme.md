# TexChord 
#### Autor: Walysson Pereira dos Reis
#### Data: 10/07/2019

Projeto Latex para criação de folhas de músicas cifradas personalizadas, com estilo CifraClub.

-----------------------------------------------
#### Para cada música devem haver 1 espelho X e 5 versões, uma em cada tom.
#### Os tons que derivam uma versão X, são os acordes de formas básicas ou variantes destes: 
| X |   C  |  D   |  E 	|   G  |   A  |
|---|------|------|-----|------|------|
| X |  Cm  |  Dm  |  Em |   Gm |   Am |


>| C C# | D D# | E F | F# G | G# A | A# B |

#### No espelho da cifra (cifra X) existem notas curingas ditas como X1,X2,X3. etc.
#### Acordes sustenidos (#) no código devem ser acompanhados de barra (\\) ex.: (\\#).
------------------------------------------------

## Como criar cifras de  uma música?
* Deve-se primeiro criar o arquivo de espelho para a música.
> No diretório CIFRA.TEX crie um novo arquivo .TEX no padrão: AA0000X Ex.: GB9999X.tex
* Vá ao arquivo main.tex e dentro do ambiente songs insira o caminho do arquivo criado.
>\begin{songs}{}
\input{CIFRA.TEX/GB9999X.tex}
\end{songs}
* No arquivo CIFRA.TEX/GB0000X copie todo código modelo para o novo arquivo criado.
* Apartir de agora basta preencher os dados da música seguindo os parâmetros do arquivo modelo.
> Lembrando que deve-se criar primeiro o arquivo de espellho X e só então copia-lo, criando assim as suas versões.
------------------------------------------------
## Parâmetros do arquivo de cifra
### Parâmetros obrigatórios

* \songcolumns{1} : Quantidade de colunas da cifra.
* {__} %TÍTULO : Insira o título da música entre os parênteses.
* by={__}, %ARTISTA : Insira o artista da música entre os parênteses.
* id={__} %COD.ID : Insira o código ID da música visto na pasta de trabalho WALYSSONDOSREIS.MUS.xlsx.
------------------------------------------------
* \tom{_} : Insira o tom da música. Caso seja o espelho, mantenha o padrão X1 ou X2 etc.
* \begin{verse*} \end{verse*} : Defina versos sem numeração.
> \begin{verse} \end{verse} : Defina versos com numeração, se preciso.
* \begin{chorus} \end{chorus} : Defina refrão.
* \gtab{\color{black}__}{0:000000} : Defina desenhos de acordes. 
------------------------------------------------
### Parâmetros opcionais
* \seq{NomeSeq}{Acordes}{NumRep} : Defina sequência de acordes. Exige nome da sequência, exemplo Intro, a sequência de notas
, exemplo E F\\#m C, e número de repetições, que pode ser deixado em branco, {}, ou informado, exemplo {2x}.
* \act{__}{__} : Define ação a ser tomada durante a música. Passar tipo de ação, exemplo Repetir, e objeto da ação, exemplo Verso 2.
* \tab{NomeTab}\begin{lstlisting}\end{lstlisting} : Define tablatura. Insira a tablatura no corpo de ambiente, entre as tags \begin{} e \end{}. Insira o nome da tablatura na tag \tab{}, exemplo \tab{Solo 1}. Se for necessário altere parâmetro de configurações de exibição da tablatura no comando \lstset{basicstyle=\scriptsize\bf}.
* \newchords{nomeAmbRep} : Cria registradores de repetição de acordes. Utilize \memorize[nomeAmbRep] em algum verso para atribuir sequencia de acordes ao registrador. Utilize \replay[nomeAmbRep] para utilizar a sequencia em algum verso ou refrão.
------------------------------------------------
## Declaração de Acordes
* \chordson : Liga modo de acordes para trecho de música.
* \chordoff : Desliga modo de acordes para trecho de música.
* \[acorde] : Forma para declarar acordes.
* ^ : Simbolo que substitui acorde referenciado na memoria (\memorize).

------------------------------------------------
## Legenda de Cifras X
-----------------------------------------------------------------
 PADRÃO [TonalidadeMaiorNOTAX.Variação] .Ex:[X50] [X50V1]
 PADRÃO [TonalidadeMenorNOTAX.Variação] .Ex:[mX50] [mX50V1]
 OBS: Variações são alterações do acorde em relação ao campo harmônico.
-----------------------------------------------------------------
 TIPOS DE VARIAÇÂO DOS ACORDES:
 V1 - ACORDE MENOR (m)
 V2 - ACORDE MAIOR (M)
 V3 - ACORDE MEIO TOM ABAIXO (Bemois)
 V4 - ACORDE COM QUARTA (C4)
 V5 - ACORDE COM QUINTA (C5)
 V6 - ACORDE COM SEXTA (C6)
 V7 - ACORDE COM SÉTIMA MENOR (C7)
 V8 - ACODE COM BAIXO DOIS TONS ACIMA (ex:D/F#)
 V9 - ACORDE COM NONA (C9)
 V10 - ACORDE MEIO TOM ACIMA (Sustenidos)
 V11 - ACORDE COM SÉTIMA MAIOR (C7M)
 V12 - ACORDE SUSPENSO (Sus)
 V13 - ACORDE COM VARIAÇÃO DIVERSA
%=================================================================
#### > Consultar documentação do Songs Package Latex para informações detalhadas.
