#INCLUDE 'TOTVS.CH'
/*22 - Ler um valor inteiro (aceitar somente valores
entre 1 e 10) e escrever a tabuada de 1 a 10 do
valor lido.*/

User Function Tabuada() 

  Local nCont     := 0, nMultiplica := 0, nNum := 0
  Local cArmazena := ''

  nNum := VAL(FwInputBox('Insira um n�mero entre 1 a 10: ')) // L� o valor

  while nNum < 1 .or. nNum > 10 //* Valida��o
    FwAlertInfo('O n�mero deve estar entre 1 a 10:')
    nNum := VAL(FwInputBox('Insira um n�mero: '))
  end

  for nCont := 0 to 10 //* A tabuada ir� de 0 a 10 e multiplicar� o n�mero inserido
    nMultiplica := nCont*nNum
    cArmazena += cValtoChar(nCont) + '*'+ cValtoChar(nNum) + ' = ' + cValtoChar(nMultiplica) + CRLF
  next
  
  FwAlertInfo(cArmazena, 'Resultado') // Exibindo o resultado

Return
