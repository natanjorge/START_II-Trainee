#INCLUDE 'TOTVS.CH'

/*7 - As ma��s custam R$ 1,30 cada se forem
compradas menos de uma d�zia, e R$ 1,00 se forem
compradas pelo menos 12. Escreva um programa
que leia o n�mero de ma��s compradas, calcule e
escreva o custo total da compra.
*/

User Function ValorMacas()

  Local nNumMaca:= 0, nPreco := 0, nTotal := 0

  nNumMaca := VAL(FwInputBox('Digite o n�mero de ma�as: ')) // Recebendo a quantidade de ma�as

  if nNumMaca >= 12 // Verificando o pre�o das ma��s
    nPreco := 1
  else
    nPreco := 1.3
  endif

  nTotal := nNumMaca*nPreco // Calculando o custo total

  FwAlertInfo('O valor total das ma�as � de: R$' + ALLTRIM(STR(nTotal)), 'Valor das ma�as') // Exibindo o valor total das ma�as

Return
