#INCLUDE 'TOTVS.CH'
/*27 - Escreva um algoritmo que imprima as seguintes
sequências de números:
o (1, 1 2 3 4 5 6 7 8 9 10)
o (2, 1 2 3 4 5 6 7 8 9 10)
o (3, 1 2 3 4 5 6 7 8 9 10)
o (4, 1 2 3 4 5 6 7 8 9 10)
e assim sucessivamente, até que o primeiro número
(antes da vírgula), também chegue a 10.
Obs: Utilize laço de repetição para o
preenchimento dos números antes e depois da
vírgula.*/

User Function SequenciaNum() 

  Local nCont := 0
  Local cArmazena := ''

  for nCont := 1 to 10
    cArmazena += cValToChar(nCont) +', 1 2 3 4 5 6 7 8 9 10' + CRLF //* Os valores de nCont vão de 1 até 10 e a mensagem é gravada como '1, 1 2 3 4 5 6 7 8 9 10' em cArmazena
  next

  FwAlertInfo('A sequências de números é: '+ CRLF + cArmazena, 'Resultado') // Exibindo o resultado

Return
