#INCLUDE 'TOTVS.CH'
/*�30 - Fa�a um algoritmo para ler 10 n�meros e
armazenar em um array. Ap�s a leitura total dos 10
n�meros, o algoritmo deve escrever esses 10
n�meros lidos na ordem inversa.
*/

User Function ArrayInverso() 

  Local aNumeros [10]
  Local nCont := 0
  Local cPrint := ''

  for nCont := 1 to 10
    aNumeros[nCont] := FWInputBox('Insira um n�mero: ') //* N�meros inseridos no array
  next

  for nCont := 10 to 1 STEP -1
    cPrint += aNumeros[nCont] + CRLF //* N�meros do array para a vari�vel que destinei para impress�o na ordem inversa (10 to 1 STEP -1)
  next

  MSGINFO(cPrint)

Return
