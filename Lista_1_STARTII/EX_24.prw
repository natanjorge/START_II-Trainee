#INCLUDE 'TOTVS.CH'
/*24 - Ler 10 valores e escrever quantos desses
valores lidos estão no intervalo [10, 20] (inlcuindo
os valores 10 e 20 no intervalo) e quantos deles
estão fora deste intervalo.*/

User Function IntervaloEFora() 

  Local nCont := 0, nNum := 0, nEntre := 0, nFora := 0

  for nCont := 1 to 10 
    nNum := VAL(FwInputBox('Insira um número: ')) // Lê os 10 valores inseridos
    if nNum >= 10 .and. nNum <= 20
      nEntre++ //* números inseridos DENTRO do intervalo somam 1 ao contador nEntre
    else
      nFora++ //* números inseridos FORA do intervalo somam 1 ao contador nFora
    endif
  next

  FwAlertInfo(ALLTRIM(STR(nEntre)) + ' dos valores inseridos estão entre 10 e 20.' + CRLF +;
              ALLTRIM(STR(nFora)) + ' dos valores inseridos estão fora do intervalo.', 'Resultado') // Exibindo o resultado

Return
