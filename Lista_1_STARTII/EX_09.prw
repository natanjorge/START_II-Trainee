#INCLUDE 'TOTVS.CH'

// 9 - Ler um valor e escrever se � positivo, negativo ou zero

User Function LerValores()

  Local nValor:= 0

  nValor := VAL(FwInputBox('Digite um n�mero: ')) // Recebendo o n�mero

  if nValor > 0 // Verificando se � positivo
    FwAlertInfo('O n�mero ' + ALLTRIM(STR(nValor)) + ' � positivo!', 'Resultado') // Exibindo o resultado

  elseif nvalor < 0 // Verificando se � negativo
    FwAlertInfo('O n�mero ' + ALLTRIM(STR(nValor)) + ' � negativo!', 'Resultado') // Exibindo o resultado  

  else // Verificando se � zero
    FwAlertInfo('O n�mero ' + ALLTRIM(STR(nValor)) + ', � zero!', 'Resultado') // Exibindo o resultado
  endif

Return
