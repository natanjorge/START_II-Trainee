#INCLUDE 'TOTVS.CH'
/*� 33 - Fa�a um algoritmo para ler 20 n�meros e
armazenar em um array aNumeros, verificar e
escrever se existem n�meros repetidos no array
aNumeros e em que posi��es se enIram.      */

User Function NumIguaisArray() 

  Local aNumeros [20]
  Local nI := 0, nJ := 0
  Local cPrint := ''

  cPrint := 'ARRAY 20 N�MEROS' + CRLF
  for nI := 1 to 20
    aNumeros[nI] := FWInputBox('Insira um n�mero para o array: ') //* Insere 20 n�meros no array e os armazena na vari�vel de impress�o
    cPrint += ALLTRIM(STR(nI)) +'� = ' + ALLTRIM(aNumeros[nI]) + ' | '  
  next

  for nI := 1 to 20
    for nJ := 1 to 20
      if aNumeros[nI] == aNumeros[nJ]          //* Verifica se tem valores iguais nas vari�veis e em quais posi��es est�o
        cPrint += CRLF + 'O n�mero ' + aNumeros[nI] + ' se encontra nas posi��es ' + ALLTRIM(STR(nI)) + ' e '+ ALLTRIM(STR(nJ))
      endif
    next
  next

  MSGINFO(cPrint)

Return 
