#INCLUDE 'TOTVS.CH'
/*• 19 - Escreva um algoritmo para imprimir os números
de 1 (inclusive) a 10 (inclusive) em ordem
decrescente.*/
User Function ImprimiDecrescente() 

  Local nCont     := 0
  Local cArmazena := ''

  for nCont := 10 to 1 STEP -1 //* A variável "cArmazena" recebe os valores que diminuem gradativamente com o uso do for STEP -1, gerando uma ordem decrescente.
    cArmazena += cValtoChar(nCont) + CRLF
  next
  
  FwAlertInfo(cArmazena, 'Resultado') // Exibindo o resultado

Return
