#INCLUDE 'TOTVS.CH'
/*� 36 - Fa�a um programa para calcular n! (Fatorial
de n), sendo que o valor inteiro de n � fornecido
pelo usu�rio. Sabe-se que: 4! = 4 * 3 * 2 * 1  */

User Function ForneceFatorial() 
  
  Local nNum := 0, nCont := 0, nFat := 0

  nNum := VAL(FWInputBox('Insira um n�mero para realizar o fatorial: '))

  nFat := nNum

  for nCont := (nNum-1) to 1 STEP -1 //*Como a vari�vel nFat j� armazenou um valor de nNum subtra� 1 e deixei o for na ordem decrescente e nFat receber� as multiplica��es do contador.
    nFat *= nCont
  next

  FwAlertInfo('O fatorial de ' + ALLTRIM(STR(nNum)) + ' �: ' + ALLTRIM(STR(nFat)))

Return
