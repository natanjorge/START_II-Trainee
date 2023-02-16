#INCLUDE 'TOTVS.CH'

/*
• 5 – Elaborar um programa que efetue a
apresentação do valor da conversão em real (R$)
de um valor lido em dólar (US$). O programa
deverá solicitar o valor da cotação do dólar e,
também, a quantidade de dólares disponível com o
usuário.
*/

User Function ValorEmReal()

    Local nCotacaoDolar := 0, nQuantDolar  := 0

    nCotacaoDolar := VAL(FwInputBox('Digite a cotação do dólar: '))
    nQuantDolar   := VAL(FwInputBox('Digite a quantidade de dólares: '))

    FwAlertInfo('O valor em real é: R$ ' + ALLTRIM(STR(nCotacaoDolar*nQuantDolar,5,2)), 'Valor em real')

Return
