#INCLUDE 'TOTVS.CH'
/*23 - Ler 10 valores e escrever quantos desses
valores lidos s�o NEGATIVOS.*/

User Function SomaNegativos() 

  Local nCont := 0, nNum := 0, nNega := 0

  for nCont := 1 to 10 
    nNum := VAL(FwInputBox('Insira um n�mero: ')) // L� os 10 valores
    if nNum < 0
      nNega++    //* Somat�ria dos valores inseridos menores que 0 (ou seja, negativos)
    endif
  next

  FwAlertInfo(ALLTRIM(STR(nNega)) + ' dos valores inseridos s�o negativos.', 'Resultado') // Exibindo o resultado

Return
