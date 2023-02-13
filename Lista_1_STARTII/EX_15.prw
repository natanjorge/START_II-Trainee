
#INCLUDE 'TOTVS.CH'
/*• 15 - Acrescentar uma mensagem de 'VALOR
INVÁLIDO' no exercício anterior caso o segundo
valor informado seja ZERO.*/

User Function ValorInvalZero()

  Local nPrimeiroVal := 0, nSegundoVal := 0

  nPrimeiroVal := VAL(FwInputBox('Insira o primeiro valor: ')) 
  nSegundoVal  := VAL(FwInputBox('Insira o segundo valor: '))

  while nSegundoVal == 0           //* Mantém o segundo valor em looping com uma mensagem de erro para que o valor seja diferente de 0
    FWAlertError('VALOR INVÁLIDO!')
    nSegundoVal := VAL(FwInputBox('Insira o segundo valor: '))
  end

  FwAlertInfo('O valor da divisão é: ' + ALLTRIM(STR(nPrimeiroVal/nSegundoVal)), 'Valor da divisão') //* Realizando a divisão dos valores e Exibindo o resultado 

Return
