# TexChord v1.0
**Autor: Walysson Pereira dos Reis  
Data: 10/07/2019**

Projeto Latex para criação de cifras personalizadas, utilizando biblioteca [Songs](http://songs.sourceforge.net/).

-----------------------------------------------
## Tudo começa pelo tom da música ...
Toda música deve ser cifrada em um tom curinga (X).

* As cifras de tom curinga são armazenadas no diretório CIFRA.TEX/XCHORD.  
* As cifras de tons da escala harmônica são armazenadas no diretório CIFRA.TEX/VERSION.  
* As cifras mistas (medley) são armazenadas no diretório CIFRA.TEX/MEDLEY.  

Sugere-se derivar uma cifra de tom curinga nos seguintes tons:
  
|    |  C C#  |  D D#  | E F F# |  G G#  | A A# B |
|:--:|:------:|:------:|:------:|:------:|:------:|
| 1º |   C    |   D    |   E    |   G    |   A    | 
| 2º |   -    |   -    |   F    |   -    |   B    |
| 3º |   Db   |   Eb   |   Gb   |   Ab   |   Bb   |


------------------------------------------------  
## Como cifrar músicas de tonalidades menores?  

Não é permitido cifrar músicas por tonalidades menores, portanto deve-se usar a relativa maior do tom desejado: 

| Para o tom de :| Cm | C#m| Dm | D#m| Em | Fm | F#m| Gm | G#m| Am | A#m| Bm | 
|:--------------:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| Use :          | Eb | E  | F  | Gb | G  | Ab | A  | Bb | B  | C  | Db | D  |
> Obs.: A relativa maior de um tom menor é o tom menor um tom e meio acima, claro agora em estado maior.                                             
------------------------------------------------
## O que são cifras curingas?  

As cifras de tom curingas (X) são cifras de músicas as quais independem de qualquer campo harmônico.
Elas são compostas por notas curingas que vão de X1 a X7, onde X1 é o primeiro acorde de
um campo harmônico maior natural X e X7 é o último.  
Para representar as variações dos acordes pertencentes ao campo harmônico as notas curingas são concatenadas a notações de variação.
> Obs.: Consulte a tabela de variações de acordes ao final da página.

Campo Harmônico Maior Natural

| Tônica | menor | menor | MAIOR | MAIOR | menor | Ø (m7(b5)) |
|:-----: |:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
| **X1** | **X2**| **X3**| **X4**| **X5**| **X6**|**X7** |
| C      | Dm    | Em    | F     | G     | Am    | BØ    |
| Db\|C# | Eb\|D#| F     | Gb\|F#| Ab\|G#| Bb\|A#| CØ    |
| D      | Em    | F#m   | G     | A     | Bm    | C#Ø   |
| Eb\|D# | F     | G     | Ab\|G#| Bb\|A#| C     | D     |
| E      | F#m   | G#m   | A     | B     | C#m   | D#Ø   |
| F      | Gm    | Am    | Bb    | C     | Dm    | EØ    |
| Gb\|F# | Ab\|G#| Bb\|A#| B     | Db\|C#| Eb\|D#| FØ    |
| G      | Am    | Bm    | C     | D     | Em    | F#Ø   |
| Ab\|G# | Bb\|A#| C     | Db\|C#| Eb\|D#| F     | GØ    |
| A      | Bm    | C#m   | D     | E     | F#m   | G#Ø   |
| Bb\|A# | C     | D     | Eb\|D#| F     | G     | A     |
| B      | C#m   | D#m   | E     | F#    | G#m   | A#Ø   |


------------------------------------------------
## Como cifrar  uma música?
* Deve-se primeiro criar o arquivo de tom curinga para a música.
> No diretório CIFRA.TEX crie um novo arquivo .TEX no padrão: AA0000X Ex.: GB9999X.tex
* Vá ao arquivo input.tex e dentro da chave \\input{} insira o caminho do arquivo criado.
Ex.: \input{CIFRA.TEX/GB9999X.tex}
* No arquivo NoChord/GB0000X copie todo código modelo para o novo arquivo criado.
* Apartir de agora basta preencher os dados da música seguindo os parâmetros do arquivo modelo.
------------------------------------------------
## Parâmetros do arquivo de cifra
### Parâmetros obrigatórios

* \songcolumns{1} : Quantidade de colunas da cifra.
* {NomeDaMusica} : Insira o título da música.
* by={NomeDoArtista} : Insira o artista da música.
* id={CodId (Rev.0)} : Insira o código ID da música visto na pasta de trabalho WALYSSONDOSREIS.MUS.xlsx. 'Rev' irá identificar a fase de modificação da cifra, caso tenha acabado de ser criada, comece com Rev.0, ao revisar a cifra incremente o valor.
------------------------------------------------
* \tom{X1} : Insira o tom da música. Caso seja o arquivo curinga, considere X1 como tom da música.
* \begin{verse} MeuVersoAqui \end{verse} : Defina versos com numeração.
* \begin{verse*} MeuVersoAqui \end{verse*} : Defina versos sem numeração.
* \begin{chorus} MeuRefraoAqui \end{chorus} : Defina o refrão.
* \gtab{\color{black} X1}{0:000000} : Defina desenhos de acordes. 
------------------------------------------------
### Parâmetros opcionais
* \seq{NomeSeq}{Acordes}{NumRep} : Defina sequência de acordes. Exige nome da sequência, exemplo Intro, a sequência de notas
, exemplo E F\\#m C, e número de repetições, que pode ser deixado em branco, {}, ou informado, exemplo {2x}.
* \act{Ordem}{Objeto}{NumRep} : Define ação a ser tomada durante a música. Passar tipo de ação, exemplo Repetir, objeto da ação, exemplo Verso 2 e quantidade de repetições, exemplo 4x.NumRep pode ser deixado em branco.
* \tab{NomeTab}\begin{lstlisting} MinhaTabAqui \end{lstlisting} : Define tablatura. Insira o nome da tablatura na tag \tab{}, exemplo \tab{Solo 1}. Se for necessário altere parâmetro de configurações de exibição da tablatura no comando \lstset{basicstyle=\scriptsize\bf}.
* \newchords{nomeAmbRep} : Cria registradores de repetição de acordes. Utilize \memorize[nomeAmbRep] em algum verso para atribuir sequencia de acordes ao registrador. Utilize \replay[nomeAmbRep] para utilizar a sequencia memorizada em algum verso ou refrão.
------------------------------------------------
## Declaração de Acordes
* \chordson MeuTrechoAqui: Liga modo de acordes para trecho de música.
* \chordoff MeuTrechoAqui: Desliga modo de acordes para trecho de música.
* \\[MeuAcordeAqui] : Forma para declarar acordes.
* ^ : Simbolo que substitui acorde referenciado na memoria (\memorize).  
Obs.: Acordes sustenidos (#) no código devem ser acompanhados de barra (\\) ex.: (\\#).
------------------------------------------------
## Legenda de Cifras X

 > Padrão: [NotaX+Variação1+VaricaçãoN] .Ex: X7, X5V3V7  
 > Obs: Variações são alterações do acorde em relação ao seu campo harmônico.

|  Código | Tipo de Variação do Acorde        | Exemplo    |
|:-----:|-----------------------------------|------------|
| V0    | Outro                             | G7(b13)    | 
| V1    | Menor (m)                         | C=>Cm      |  
| V2    | Maior (M)                         | G#m=>G#    |
| V3    | Meio Tom Abaixo (Bemol)           | F#=>F      |
| V4    | Com Quarta                        | A4         |
| V5    | Com Quinta                        | F5         |
| V6    | Com Sexta                         | D6         |
| V7    | Com Sétima Menor                  | A7         |
| V8    | Com baixo dois Tons Acima         | D/F#       |
| V9    | Com Nona                          | A9         |
| V10   | Meio Tom Acima (Sustenido)        | F=>F#      |
| V11   | Com Sétima Maior                  | CM7        |
| V12   | Suspenso (Sus)                    | Csus4      |
| V13   | Com baixo dois Tons e Meio Acima  | A/E        |
| V14   | Com baixo um Tom e Meio Acima     | D9/F       | 
| V15   | Meio-Diminuto (Ø)                 | AØ         |
| N15   | NÃO Meio-Diminuto                 | AØ=>A      |
| V16   | Diminuto (o)                      | Ao         |
| N16   | NÃO Diminuto                      | Ao=>A      |
| V17   | Com baixo um Tom Acima            | C/D        |
------------------------------------------------
#### > Consultar documentação do Songs Package Latex para informações detalhadas.
