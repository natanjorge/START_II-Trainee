#INCLUDE 'TOTVS.CH'
/*� 21 - Ler um valor N e imprimir todos os valores
inteiros entre 1 (inclusive) e N (inclusive).
Considere que o N ser� sempre maior que ZERO.*/

User Function DeUmAteN() 

  Local nCont     := 0, nNum := 0
  Local cArmazena := ''

  nNum := VAL(FwInputBox('Insira um n�mero: ')) // L� a primeira nota

  while nNum < 1 // Valida��o para que o n�mero seja maior que 1
    FwAlertInfo('O n�mero deve ser maior que 1')
    nNum := VAL(FwInputBox('Insira um n�mero: '))
  end

  for nCont := 1 to nNum // Armazenando os valores de 1 at� nNum (Valor inserido)
    cArmazena += cValtoChar(nCont) + CRLF
  next
  
  FwAlertInfo(cArmazena, 'Resultado') // Exibindo o resultado

Return
