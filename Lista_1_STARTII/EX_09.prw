#INCLUDE 'TOTVS.CH'

// 9 - Ler um valor e escrever se é positivo, negativo ou zero

User Function LerValores()

  Local nValor:= 0

  nValor := VAL(FwInputBox('Digite um número: ')) // Recebendo o número

  if nValor > 0 // Verificando se é positivo
    FwAlertInfo('O número ' + ALLTRIM(STR(nValor)) + ' é positivo!', 'Resultado') // Exibindo o resultado

  elseif nvalor < 0 // Verificando se é negativo
    FwAlertInfo('O número ' + ALLTRIM(STR(nValor)) + ' é negativo!', 'Resultado') // Exibindo o resultado  

  else // Verificando se é zero
    FwAlertInfo('O número ' + ALLTRIM(STR(nValor)) + ', é zero!', 'Resultado') // Exibindo o resultado
  endif

Return
