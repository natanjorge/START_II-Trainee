#INCLUDE 'TOTVS.CH'

/*5 - O custo de um carro novo ao consumidor � a
soma do custo de f�brica com a porcentagem do
distribuidor e dos impostos (aplicados ao custo de
f�brica). Supondo que o percentual do distribuidor
seja de 28% e os impostos de 45%, escrever um
algoritmo para ler o custo de f�brica de um carro,
calcular e escrever o custo final ao consumidor.
*/

User Function CarroNovo()

  Local nCusFab:= 0, nCusFin := 0

  nCusFab := FwInputBox('Digite o custo de f�brica do carro: ') // Recebendo o custo de f�brica do carro

  nCusFin := VAL(nCusFab) + VAL(nCusFab) * 0.28 + VAL(nCusFab) * 0.45 // C�lculo do custo final = Custo de f�brica + Custo do distribuidor + Impostos

  FwAlertInfo('O custo final para o consumidor �: R$' + ALLTRIM(STR(nCusFin)), 'Custo final') // Exibindo o custo final

Return
