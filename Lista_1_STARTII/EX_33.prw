#INCLUDE 'TOTVS.CH'
/*• 33 - Faça um algoritmo para ler 20 números e
armazenar em um array aNumeros, verificar e
escrever se existem números repetidos no array
aNumeros e em que posições se enIram.      */

User Function NumIguaisArray() 

  Local aNumeros [20]
  Local nI := 0, nJ := 0
  Local cPrint := ''

  cPrint := 'ARRAY 20 NÚMEROS' + CRLF
  for nI := 1 to 20
    aNumeros[nI] := FWInputBox('Insira um número para o array: ') //* Insere 20 números no array e os armazena na variável de impressão
    cPrint += ALLTRIM(STR(nI)) +'º = ' + ALLTRIM(aNumeros[nI]) + ' | '  
  next

  for nI := 1 to 20
    for nJ := 1 to 20
      if aNumeros[nI] == aNumeros[nJ]          //* Verifica se tem valores iguais nas variáveis e em quais posições estão
        cPrint += CRLF + 'O número ' + aNumeros[nI] + ' se encontra nas posições ' + ALLTRIM(STR(nI)) + ' e '+ ALLTRIM(STR(nJ))
      endif
    next
  next

  MSGINFO(cPrint)

Return 
