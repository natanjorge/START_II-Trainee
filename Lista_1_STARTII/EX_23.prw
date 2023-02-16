#INCLUDE 'TOTVS.CH'
/*23 - Ler 10 valores e escrever quantos desses
valores lidos são NEGATIVOS.*/

User Function SomaNegativos() 

  Local nCont := 0, nNum := 0, nNega := 0

  for nCont := 1 to 10 
    nNum := VAL(FwInputBox('Insira um número: ')) // Lê os 10 valores
    if nNum < 0
      nNega++    //* Somatória dos valores inseridos menores que 0 (ou seja, negativos)
    endif
  next

  FwAlertInfo(ALLTRIM(STR(nNega)) + ' dos valores inseridos são negativos.', 'Resultado') // Exibindo o resultado

Return
