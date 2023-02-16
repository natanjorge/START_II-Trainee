#INCLUDE 'TOTVS.CH'

/*4 - Escreva um algoritmo para ler o salário mensal
atual de um funcionário e o percentual de
reajuste. Calcular e escrever o valor do novo
salário.
*/

User Function ReajusteSalarial()

  Local nSalario:= 0, nReajuste := 0, nSalReaj := 0

  nSalario  := FwInputBox('Informe o salário: ') // Recebendo o salário mensal atual
  nReajuste := FwInputBox('Informe o percentual de reajuste: ') // Recebendo o reajuste

  nSalReaj  :=  VAL(nSalario) + (VAL(nSalario) * (VAL(nReajuste)/100)) // Calculando o novo salário

  FwAlertInfo('O salário com reajuste é: R$' + ALLTRIM(STR(nSalReaj)), 'Salário com reajuste') // Exibindo o novo salário

Return
