#INCLUDE 'TOTVS.CH'

/* 13 - Faça um algoritmo para ler: a descrição do
produto (nome), a quantidade adquirida e o preço
unitário.
Calcular e escrever o total (total = quantidade
adquirida * preço unitário), o desconto e o total
a pagar (total a pagar = total - desconto),
sabendo-se que:
o Se quantidade <= 5 o desconto será de 2%
o Se quantidade > 5 e quantidade <= 10 o
desconto será de 3%
o Se quantidade > 10 o desconto será de 5% */

User Function ValorTotalProduto()

  Local cProduto := ''
  Local nQuant := 0, nPreco := 0, nDesc := 0, nTotal := 0

  cProduto := FwInputBox('Insira o nome do produto: ') // Recebendo os valores
  nQuant   := VAL(FwInputBox('Insira a quantidade do produto: ')) 
  nPreco   := VAL(FwInputBox('Insira o preço do produto: ')) 


  if nQuant <= 5
    nDesc := 0.98 //* desconto de 2%
  elseif nQuant > 5 .and. nQuant <= 10
    nDesc := 0.97 //* desconto de 3%
  else
    nDesc := 0.95 //* desconto de 5%
  endif

  nTotal := nQuant*nPreco*nDesc

  FwAlertInfo('O valor total do produto ' + cProduto + ' é: R$' + ALLTRIM(STR(nTotal)), 'Valor total do produto') // Exibindo o resultado

Return

