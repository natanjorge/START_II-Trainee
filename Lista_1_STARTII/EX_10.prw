#INCLUDE 'TOTVS.CH'

/* 10 - Ler 3 valores (considere que n�o ser�o informados valores iguais) 
e escrev�-los em ordem crescente.*/

User Function OrdemCrescente()

  Local nPrimeiro:= 0, nSegundo := 0, nTerceiro:= 0

  nPrimeiro := VAL(FwInputBox('Digite o primeiro valor: ')) // Recebendo os valores
  nSegundo  := VAL(FwInputBox('Digite o segundo valor: ')) 
  nTerceiro := VAL(FwInputBox('Digite o terceiro valor: '))

  if nPrimeiro < nSegundo  .and. nPrimeiro < nTerceiro // *O Primeiro n�mero � o menor
    if nSegundo  < nTerceiro
      FwAlertInfo('A ordem crescente �: ' + ALLTRIM(STR(nPrimeiro)) + ', ' + ALLTRIM(STR(nSegundo)) + ' e ' + ALLTRIM(STR(nTerceiro)), 'Resultado') // Exibindo o resultado
    else
      FwAlertInfo('A ordem crescente �: ' + ALLTRIM(STR(nPrimeiro)) + ', ' + ALLTRIM(STR(nTerceiro)) + ' e ' + ALLTRIM(STR(nSegundo)), 'Resultado') // Exibindo o resultado
    endif

  elseif nSegundo < nPrimeiro .and. nSegundo < nTerceiro // *O Segundo n�mero � o menor
    if nPrimeiro < nTerceiro
      FwAlertInfo('A ordem crescente �: ' + ALLTRIM(STR(nSegundo)) + ', ' + ALLTRIM(STR(nPrimeiro)) + ' e ' + ALLTRIM(STR(nTerceiro)), 'Resultado') // Exibindo o resultado
    else
      FwAlertInfo('A ordem crescente �: ' + ALLTRIM(STR(nSegundo)) + ', ' + ALLTRIM(STR(nTerceiro)) + ' e ' + ALLTRIM(STR(nPrimeiro)), 'Resultado') // Exibindo o resultado
    endif
  
  else
    if nPrimeiro < nSegundo                           //* O Terceiro n�mero � o menor
      FwAlertInfo('A ordem crescente �: ' + ALLTRIM(STR(nTerceiro)) + ', ' + ALLTRIM(STR(nPrimeiro)) + ' e ' + ALLTRIM(STR(nSegundo)), 'Resultado') // Exibindo o resultado
    else
      FwAlertInfo('A ordem crescente �: ' + ALLTRIM(STR(nTerceiro)) + ', ' + ALLTRIM(STR(nSegundo)) + ' e ' + ALLTRIM(STR(nPrimeiro)), 'Resultado') // Exibindo o resultado
    endif 
  endif

Return

