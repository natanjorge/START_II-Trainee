
#INCLUDE 'TOTVS.CH'
/*18 - Escreva um algoritmo para imprimir os números
de 1 (inclusive) a 10 (inclusive) em ordem
crescente.*/

User Function ImprimirCresce() 

  Local nCont     := 0
  Local cArmazena := ''

  for nCont := 1 to 10 //* A variável "cArmazena" recebe os valores que aumentam gradativamente com o uso do for.
    cArmazena += cValtoChar(nCont) + CRLF
  next
  
  FwAlertInfo(cArmazena, 'Resultado') // Exibindo o resultado

Return
