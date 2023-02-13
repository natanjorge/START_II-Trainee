#INCLUDE 'TOTVS.CH'
/*� 40 - Fa�a um programa para o c�lculo de uma folha
de pagamento, sabendo que os descontos s�o do
imposto de Renda, que depende do sal�rio bruto
(conforme tabela abaixo) e 10% para o INSS. Al�m
disso, existe o FGTS que corresponde a 11% do
sal�rio bruto, mas n�o � descontado (� a empresa
que deposita).
        */

User Function FolhaDePagamento() 
    
    Local nSalarioBruto:= 0, nIR:= 0, nINSS:= 0, nFGTS:= 0, nTotalDescontos:= 0, nSalarioLiquido:= 0, nHora := 0, nQtdHoras := 0
    Local cIR := ''

    nHora      := VAL(FWInputBox('Informe o valor da hora: '))
    nQtdHoras  := VAL(FWInputBox('Informe a quantidade de horas: '))

    nSalarioBruto := nHora*nQtdHoras //*                      C�lculo do sal�rio bruto

    if nSalarioBruto > 1200 .and. nSalarioBruto <= 1800   //* Defini��o dos valores do IR
        nIR := 0.05 * nSalarioBruto //*         5%
        cIR := '5%'
    elseif nSalarioBruto > 1800 .and. nSalarioBruto <= 2500 
        nIR := 0.10 * nSalarioBruto //*         10%
        cIR := '10%'
    elseif nSalarioBruto > 2500 
        nIR := 0.20 * nSalarioBruto //*         20%
        cIR := '20%'
    else
        FwAlertInfo('O valor informado n�o tem desconto IR!')
        nIR := 1 * nSalarioBruto
    endif

    nINSS := 0.10 * nSalarioBruto //*         10%                Defini��o do valor do INSS      
             
    nFGTS := 0.11 * nSalarioBruto //*         11%                Defini��o do valor do INSS    

    nTotalDescontos := nIR + nINSS //*                           C�lculo do desconto total 

    nSalarioLiquido := nSalarioBruto-nTotalDescontos //*         C�lculo do sal�rio l�quido

    FwAlertInfo('Sal�rio bruto (' + ALLTRIM(STR(nHora)) + '*' + ALLTRIM(STR(nQtdHoras)) + ')_______: R$ ' + ALLTRIM(StrZero(nSalarioBruto,7,2))+CRLF+;
                '( � ) IR ('+ALLTRIM(cIR)+')_______________: R$ '+ALLTRIM(StrZero(nIR,5,2))+CRLF+;
                '( � ) INSS (10%)____________: R$ '+ALLTRIM(StrZero(nINSS,6,2))+CRLF+;
                'FGTS (11%)_______________: R$ '+ALLTRIM(StrZero(nFGTS,6,2))+CRLF+;
                'Total de descontos__________: R$ '+ALLTRIM(StrZero(nTotalDescontos,6,2))+CRLF+;
                'Sal�rio L�quido_____________: R$ '+ALLTRIM(StrZero(nSalarioLiquido,7,2)))


Return
