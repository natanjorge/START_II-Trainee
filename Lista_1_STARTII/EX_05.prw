#INCLUDE 'TOTVS.CH'

/*5 - O custo de um carro novo ao consumidor é a
soma do custo de fábrica com a porcentagem do
distribuidor e dos impostos (aplicados ao custo de
fábrica). Supondo que o percentual do distribuidor
seja de 28% e os impostos de 45%, escrever um
algoritmo para ler o custo de fábrica de um carro,
calcular e escrever o custo final ao consumidor.
*/

User Function CarroNovo()

  Local nCusFab:= 0, nCusFin := 0

  nCusFab := FwInputBox('Digite o custo de fábrica do carro: ') // Recebendo o custo de fábrica do carro

  nCusFin := VAL(nCusFab) + VAL(nCusFab) * 0.28 + VAL(nCusFab) * 0.45 // Cálculo do custo final = Custo de fábrica + Custo do distribuidor + Impostos

  FwAlertInfo('O custo final para o consumidor é: R$' + ALLTRIM(STR(nCusFin)), 'Custo final') // Exibindo o custo final

Return
