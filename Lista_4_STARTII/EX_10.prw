#INCLUDE 'TOTVS.CH'

/*
• 9 – Desenvolva um programa para calcular a TMB
(Taxa Metabólica Basal) de um indivíduo. A fórmula
para calcular a TMB de homens, é diferente da
fórmula para mulheres. As fórmulas são:
o Para Homens:
? TMB = 66.5 + (13.75 * peso) + (5.003 *
altura em cm) – (6.75 * idade)
o Para Mulheres:
? TMB = 655.1 + (9.563 * peso) + (1.850 *
altura em cm) – (4.676 * idade)

*/

User Function CalculoFolha()

    Local cTitle := 'CALCULO TMB', cTexto := 'Informe o valor da hora: ', cTexto2 := 'Informe a quantidade de horas: '
    Local nOpcao := 0
    Local nHora := Space(10), nQtdHoras := Space(3)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 450 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2    SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nHora      SIZE 55, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nQtdHoras  SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Calcular'    SIZE 55, 11 OF oDlg PIXEL ACTION FolhaPagamento(nHora, nQtdHoras)
    @ 075, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function FolhaPagamento(nHora, nQtdHoras) 
    
    Local nSalarioBruto:= 0, nIR:= 0, nINSS:= 0, nFGTS:= 0, nTotalDescontos:= 0, nSalarioLiquido:= 0
    Local cIR := ''

    nHora := VAL(nHora); nQtdHoras := VAL(nQtdHoras)

    nSalarioBruto := nHora*nQtdHoras //*                      Cálculo do salário bruto

    if nSalarioBruto > 1200 .and. nSalarioBruto <= 1800   //* Definição dos valores do IR
        nIR := 0.05 * nSalarioBruto //*         5%
        cIR := '5%'
    elseif nSalarioBruto > 1800 .and. nSalarioBruto <= 2500 
        nIR := 0.10 * nSalarioBruto //*         10%
        cIR := '10%'
    elseif nSalarioBruto > 2500 
        nIR := 0.20 * nSalarioBruto //*         20%
        cIR := '20%'
    else
        FwAlertInfo('O valor informado não tem desconto IR!')
        nIR := 1 * nSalarioBruto
    endif

    nINSS := 0.10 * nSalarioBruto //*         10%                Definição do valor do INSS      
             
    nFGTS := 0.11 * nSalarioBruto //*         11%                Definição do valor do INSS    

    nTotalDescontos := nIR + nINSS //*                           Cálculo do desconto total 

    nSalarioLiquido := nSalarioBruto-nTotalDescontos //*         Cálculo do salário líquido

    FwAlertInfo('Salário bruto (' + ALLTRIM(STR(nHora)) + '*' + ALLTRIM(STR(nQtdHoras)) + ')_______: R$ ' + ALLTRIM(StrZero(nSalarioBruto,7,2))+CRLF+;
                '( – ) IR ('+ALLTRIM(cIR)+')_______________: R$ '+ALLTRIM(StrZero(nIR,5,2))+CRLF+;
                '( – ) INSS (10%)____________: R$ '+ALLTRIM(StrZero(nINSS,6,2))+CRLF+;
                'FGTS (11%)_______________: R$ '+ALLTRIM(StrZero(nFGTS,6,2))+CRLF+;
                'Total de descontos__________: R$ '+ALLTRIM(StrZero(nTotalDescontos,6,2))+CRLF+;
                'Salário Líquido_____________: R$ '+ALLTRIM(StrZero(nSalarioLiquido,7,2)))


Return
