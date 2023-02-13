#INCLUDE 'TOTVS.CH'

//2 - Escreva um algoritmo para ler as dimensões de um retângulo (base e altura), calcular e escrever a área desse retângulo.


User Function AreaRetangulo()

  Local nBase:= 0, nAltu := 0, nArea:= 0 // Declaração das variáveis

  nBase := FwInputBox('Informe o valor da base em metros: ') // Valor da base
  nAltu := FwInputBox('Informe o valor da altura em metros: ') // Valor da altura

  nArea := VAL(nBase) * VAL(nAltu) // Cálculo da área, a = b*h

  FwAlertInfo('A área do retângulo é: ' + ALLTRIM(STR(nArea)) + 'm²', 'Área do retângulo')

Return
