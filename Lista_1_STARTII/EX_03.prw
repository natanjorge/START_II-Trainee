#INCLUDE 'TOTVS.CH'

/*3 - Faça um algoritmo que leia a idade de uma
pessoa expressa em anos, meses e dias e escreva
a idade dessa pessoa expressa apenas em dias.
Considerar ano com 365 dias e mês com 30 dias
*/

User Function IdadeEmDias()

  Local nAnos:= 0, nMeses := 0, nDias:= 0, nDias_Totais:=0 // Declaração das variáveis

  nAnos  := FwInputBox('Informe a sua idade em anos: ') // Inputs
  nMeses := FwInputBox('Informe a quantidade de meses da sua idade: ') 
  nDias  := FwInputBox('Informe a quantidade de dias da sua idade: ') 

  nDias_Totais := VAL(nAnos)*365 + VAL(nMeses)*30 + VAL(nDias) //Calculo da quantidade de dias totais
  
  FwAlertInfo('A sua idade total em dias é: ' + ALLTRIM(STR(nDias_Totais)), 'Idade total em dias')

Return
