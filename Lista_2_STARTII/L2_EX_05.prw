#INCLUDE 'TOTVS.CH'

/*
� 5 � Elaborar um programa que efetue a
apresenta��o do valor da convers�o em real (R$)
de um valor lido em d�lar (US$). O programa
dever� solicitar o valor da cota��o do d�lar e,
tamb�m, a quantidade de d�lares dispon�vel com o
usu�rio.
*/

User Function ValorEmReal()

    Local nCotacaoDolar := 0, nQuantDolar  := 0

    nCotacaoDolar := VAL(FwInputBox('Digite a cota��o do d�lar: '))
    nQuantDolar   := VAL(FwInputBox('Digite a quantidade de d�lares: '))

    FwAlertInfo('O valor em real �: R$ ' + ALLTRIM(STR(nCotacaoDolar*nQuantDolar,5,2)), 'Valor em real')

Return
