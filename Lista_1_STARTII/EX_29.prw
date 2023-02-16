#INCLUDE 'TOTVS.CH'
/*� 29 - Ler um vetor aArray1 de 10 n�meros. Ap�s, ler
mais um n�mero e guardar em uma vari�vel nNum.
Armazenar em um array aArray2 o resultado de
cada elemento de aArray1 multiplicado pelo valor
nNum. Logo ap�s, imprimir o vetor aArray2.
*/

User Function MultiplicaArray() 

  Local aNumeros := {5,10,15,20,25,30,35,40,45,50}
  Local aArmazena := {}
  Local nNum := 0, nCont := 0, nMulti :=0
  Local cPrint := ''

  nNum := VAL(FWInputBox('Insira um n�mero: '))

  for nCont := 1 to Len(aNumeros)    //* O contador opera at� a quantidade de n�meros armazenados no array
    nMulti := nNum*(aNumeros[nCont]) //* Realiza a multiplica��o do n�mero inserido pelo n�mero armazenado no array
    AADD(aArmazena, nMulti)          //* armazena os n�meros multiplicados no array aArmazena, que est� vazio
    cPrint += ALLTRIM(STR(aNumeros[nCont])) + '*' + ALLTRIM(STR(nNum)) + ' = ' + ALLTRIM(STR(aArmazena[nCont])) + CRLF //*Armazena os valores na vari�vel cPrint
  next

  MSGINFO(cPrint)

Return
