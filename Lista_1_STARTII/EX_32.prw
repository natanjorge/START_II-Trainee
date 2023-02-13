#INCLUDE 'TOTVS.CH'
/*• 32 - Faça um algoritmo para ler dois arrays
aArray1 e aArray2 de 5 números cada. Calcular e
escrever a quantidade de vezes que aArray1 e
aArray2 possuem os mesmos números e nas mesmas
posições.        */

User Function ArraysIguais() 

  Local aArray1 [15]
  Local aArray2 [15]
  Local nCont := 0, nSoma := 0
  Local cPrint := ''

  cPrint := 'Primeiro Array' + CRLF
  for nCont := 1 to 15
    aArray1[nCont] := FWInputBox('Insira um número para o primeiro array: ') 
    cPrint += STR(nCont) +'º = ' + aArray1[nCont] + CRLF  //* Os números inseridos são salvos na variável de impressão
  next

  cPrint += CRLF +'Segundo Array' + CRLF
  for nCont := 1 to 15
    aArray2[nCont] := FWInputBox('Insira um número para o segundo array: ')
    cPrint += STR(nCont) +'º = ' + aArray2[nCont] + CRLF  //* Os números inseridos são salvos na variável de impressão
  next

  for nCont := 1 to 15
    if aArray1[nCont] == aArray2[nCont] //* Se os valores dos dois arrays forem iguais, é adicionado o valor 1 a variável nSoma (um contador)
      nSoma += 1
    endif
  next

  MSGINFO(cPrint + CRLF + 'Os arrays possuem ' + ALLTRIM(STR(nSoma)) + ' números iguais nas mesmas posições.')

Return 
