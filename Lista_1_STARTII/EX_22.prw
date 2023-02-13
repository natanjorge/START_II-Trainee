#INCLUDE 'TOTVS.CH'
/*22 - Ler um valor inteiro (aceitar somente valores
entre 1 e 10) e escrever a tabuada de 1 a 10 do
valor lido.*/

User Function Tabuada() 

  Local nCont     := 0, nMultiplica := 0, nNum := 0
  Local cArmazena := ''

  nNum := VAL(FwInputBox('Insira um número entre 1 a 10: ')) // Lê o valor

  while nNum < 1 .or. nNum > 10 //* Validação
    FwAlertInfo('O número deve estar entre 1 a 10:')
    nNum := VAL(FwInputBox('Insira um número: '))
  end

  for nCont := 0 to 10 //* A tabuada irá de 0 a 10 e multiplicará o número inserido
    nMultiplica := nCont*nNum
    cArmazena += cValtoChar(nCont) + '*'+ cValtoChar(nNum) + ' = ' + cValtoChar(nMultiplica) + CRLF
  next
  
  FwAlertInfo(cArmazena, 'Resultado') // Exibindo o resultado

Return
