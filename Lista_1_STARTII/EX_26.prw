#INCLUDE 'TOTVS.CH'
/*26 - Fa�a um algoritmo que calcule e escreva a
m�dia aritm�tica dos n�meros inteiros entre 15
(inclusive) e 100 (inclusive).*/

User Function MediaAritmetica() 

  Local nCont := 0, nNum := 0, nSoma := 0

  for nCont := 15 to 100
    nSoma += nCont       //* o valores de nCont (de 15 at� 100) s�o armazenados em nSoma 
    nNum += 1            //* nNum armazena a quantidade de vezes que o ciclo foi realizado
  next

  FwAlertInfo('A soma dos valores � '+ ALLTRIM(STR(nSoma/nNum)), 'Resultado') //* Realiza a m�dia aritm�tica e exibe os resultado

Return
