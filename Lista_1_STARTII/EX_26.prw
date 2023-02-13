#INCLUDE 'TOTVS.CH'
/*26 - Faça um algoritmo que calcule e escreva a
média aritmética dos números inteiros entre 15
(inclusive) e 100 (inclusive).*/

User Function MediaAritmetica() 

  Local nCont := 0, nNum := 0, nSoma := 0

  for nCont := 15 to 100
    nSoma += nCont       //* o valores de nCont (de 15 até 100) são armazenados em nSoma 
    nNum += 1            //* nNum armazena a quantidade de vezes que o ciclo foi realizado
  next

  FwAlertInfo('A soma dos valores é '+ ALLTRIM(STR(nSoma/nNum)), 'Resultado') //* Realiza a média aritmética e exibe os resultado

Return
