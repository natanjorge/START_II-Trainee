#INCLUDE 'TOTVS.CH'
/*• 36 - Faça um programa para calcular n! (Fatorial
de n), sendo que o valor inteiro de n é fornecido
pelo usuário. Sabe-se que: 4! = 4 * 3 * 2 * 1  */

User Function ForneceFatorial() 
  
  Local nNum := 0, nCont := 0, nFat := 0

  nNum := VAL(FWInputBox('Insira um número para realizar o fatorial: '))

  nFat := nNum

  for nCont := (nNum-1) to 1 STEP -1 //*Como a variável nFat já armazenou um valor de nNum subtraí 1 e deixei o for na ordem decrescente e nFat receberá as multiplicações do contador.
    nFat *= nCont
  next

  FwAlertInfo('O fatorial de ' + ALLTRIM(STR(nNum)) + ' é: ' + ALLTRIM(STR(nFat)))

Return
