#INCLUDE 'TOTVS.CH'

/*7 - As maçãs custam R$ 1,30 cada se forem
compradas menos de uma dúzia, e R$ 1,00 se forem
compradas pelo menos 12. Escreva um programa
que leia o número de maçãs compradas, calcule e
escreva o custo total da compra.
*/

User Function ValorMacas()

  Local nNumMaca:= 0, nPreco := 0, nTotal := 0

  nNumMaca := VAL(FwInputBox('Digite o número de maças: ')) // Recebendo a quantidade de maças

  if nNumMaca >= 12 // Verificando o preço das maçãs
    nPreco := 1
  else
    nPreco := 1.3
  endif

  nTotal := nNumMaca*nPreco // Calculando o custo total

  FwAlertInfo('O valor total das maças é de: R$' + ALLTRIM(STR(nTotal)), 'Valor das maças') // Exibindo o valor total das maças

Return
