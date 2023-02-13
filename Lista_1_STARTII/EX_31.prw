#INCLUDE 'TOTVS.CH'
/*• 31 - Faça um algoritmo para ler 10 números e
armazenar em um array. Após isto, o algoritmo deve
ordenar os números no array em ordem crescente.
Escrever o vetor ordenado.             */

User Function OrdenaArray() 

  Local aNumeros [10]
  Local nCont := 0
  Local cPrint := ''

  for nCont := 1 to 10
    aNumeros[nCont] := FWInputBox('Insira um número: ') //* Números são salvos no array
  next

  ASORT(aNumeros) //* Coloca o array na ordem crescente

  for nCont := 1 to 10
    cPrint += aNumeros[nCont] + CRLF //* Números são salvos na variável para impressão dos valores
  next

  MSGINFO(cPrint)

Return
