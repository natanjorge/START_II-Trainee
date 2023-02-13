#INCLUDE 'TOTVS.CH'
/*27 - Escreva um algoritmo que imprima as seguintes
sequ�ncias de n�meros:
o (1, 1 2 3 4 5 6 7 8 9 10)
o (2, 1 2 3 4 5 6 7 8 9 10)
o (3, 1 2 3 4 5 6 7 8 9 10)
o (4, 1 2 3 4 5 6 7 8 9 10)
e assim sucessivamente, at� que o primeiro n�mero
(antes da v�rgula), tamb�m chegue a 10.
Obs: Utilize la�o de repeti��o para o
preenchimento dos n�meros antes e depois da
v�rgula.*/

User Function SequenciaNum() 

  Local nCont := 0
  Local cArmazena := ''

  for nCont := 1 to 10
    cArmazena += cValToChar(nCont) +', 1 2 3 4 5 6 7 8 9 10' + CRLF //* Os valores de nCont v�o de 1 at� 10 e a mensagem � gravada como '1, 1 2 3 4 5 6 7 8 9 10' em cArmazena
  next

  FwAlertInfo('A sequ�ncias de n�meros �: '+ CRLF + cArmazena, 'Resultado') // Exibindo o resultado

Return
