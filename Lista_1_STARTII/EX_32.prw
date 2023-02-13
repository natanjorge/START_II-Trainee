#INCLUDE 'TOTVS.CH'
/*� 32 - Fa�a um algoritmo para ler dois arrays
aArray1 e aArray2 de 5 n�meros cada. Calcular e
escrever a quantidade de vezes que aArray1 e
aArray2 possuem os mesmos n�meros e nas mesmas
posi��es.        */

User Function ArraysIguais() 

  Local aArray1 [15]
  Local aArray2 [15]
  Local nCont := 0, nSoma := 0
  Local cPrint := ''

  cPrint := 'Primeiro Array' + CRLF
  for nCont := 1 to 15
    aArray1[nCont] := FWInputBox('Insira um n�mero para o primeiro array: ') 
    cPrint += STR(nCont) +'� = ' + aArray1[nCont] + CRLF  //* Os n�meros inseridos s�o salvos na vari�vel de impress�o
  next

  cPrint += CRLF +'Segundo Array' + CRLF
  for nCont := 1 to 15
    aArray2[nCont] := FWInputBox('Insira um n�mero para o segundo array: ')
    cPrint += STR(nCont) +'� = ' + aArray2[nCont] + CRLF  //* Os n�meros inseridos s�o salvos na vari�vel de impress�o
  next

  for nCont := 1 to 15
    if aArray1[nCont] == aArray2[nCont] //* Se os valores dos dois arrays forem iguais, � adicionado o valor 1 a vari�vel nSoma (um contador)
      nSoma += 1
    endif
  next

  MSGINFO(cPrint + CRLF + 'Os arrays possuem ' + ALLTRIM(STR(nSoma)) + ' n�meros iguais nas mesmas posi��es.')

Return 
