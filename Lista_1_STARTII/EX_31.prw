#INCLUDE 'TOTVS.CH'
/*� 31 - Fa�a um algoritmo para ler 10 n�meros e
armazenar em um array. Ap�s isto, o algoritmo deve
ordenar os n�meros no array em ordem crescente.
Escrever o vetor ordenado.             */

User Function OrdenaArray() 

  Local aNumeros [10]
  Local nCont := 0
  Local cPrint := ''

  for nCont := 1 to 10
    aNumeros[nCont] := FWInputBox('Insira um n�mero: ') //* N�meros s�o salvos no array
  next

  ASORT(aNumeros) //* Coloca o array na ordem crescente

  for nCont := 1 to 10
    cPrint += aNumeros[nCont] + CRLF //* N�meros s�o salvos na vari�vel para impress�o dos valores
  next

  MSGINFO(cPrint)

Return
