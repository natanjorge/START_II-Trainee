#INCLUDE 'TOTVS.CH'

/*4 - Escreva um algoritmo para ler o sal�rio mensal
atual de um funcion�rio e o percentual de
reajuste. Calcular e escrever o valor do novo
sal�rio.
*/

User Function ReajusteSalarial()

  Local nSalario:= 0, nReajuste := 0, nSalReaj := 0

  nSalario  := FwInputBox('Informe o sal�rio: ') // Recebendo o sal�rio mensal atual
  nReajuste := FwInputBox('Informe o percentual de reajuste: ') // Recebendo o reajuste

  nSalReaj  :=  VAL(nSalario) + (VAL(nSalario) * (VAL(nReajuste)/100)) // Calculando o novo sal�rio

  FwAlertInfo('O sal�rio com reajuste �: R$' + ALLTRIM(STR(nSalReaj)), 'Sal�rio com reajuste') // Exibindo o novo sal�rio

Return
