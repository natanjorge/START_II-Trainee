#INCLUDE 'TOTVS.CH'
/*• 20 - Escreva um algoritmo para imprimir os 10
primeiros números inteiros maiores que 100.*/

User Function MaioresCem() 

  Local nCont := 0, nNum := 101
  Local cArmazena := ''

  while nCont < 10 //* Os valores de nNum são armazenados em cArmazena, e a cada ciclo o valor de nNum aumenta e do nCont, fazendo com que em 10 ciclos o looping se encerre.
    cArmazena += cValtoChar(nNum) + CRLF
    nCont++
    nNum++
  end
  
  FwAlertInfo(cArmazena, 'Resultado') // Exibindo o resultado

Return
