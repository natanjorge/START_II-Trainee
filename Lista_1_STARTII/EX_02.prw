#INCLUDE 'TOTVS.CH'

//2 - Escreva um algoritmo para ler as dimens�es de um ret�ngulo (base e altura), calcular e escrever a �rea desse ret�ngulo.


User Function AreaRetangulo()

  Local nBase:= 0, nAltu := 0, nArea:= 0 // Declara��o das vari�veis

  nBase := FwInputBox('Informe o valor da base em metros: ') // Valor da base
  nAltu := FwInputBox('Informe o valor da altura em metros: ') // Valor da altura

  nArea := VAL(nBase) * VAL(nAltu) // C�lculo da �rea, a = b*h

  FwAlertInfo('A �rea do ret�ngulo �: ' + ALLTRIM(STR(nArea)) + 'm�', '�rea do ret�ngulo')

Return
