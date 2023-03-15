#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function EX_10_Calculo_Folha
    O programa solicita ao usuário o valor da hora e a quantidade de horas para o calculo e apresentação da folha de pagamento.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Val_Hora, cMsg_Qtd_Horas, nOpcao, nHora, nQtdHoras, oDlg
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_10_Calculo_Folha()

    Local cTitle := 'CALCULO TMB', cMsg_Val_Hora := 'Informe o valor da hora: ', cMsg_Qtd_Horas := 'Informe a quantidade de horas: '
    Local nOpcao := 0
    Local nHora := Space(10), nQtdHoras := Space(3)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 450 PIXEL
    
    @ 014, 010 SAY    cMsg_Val_Hora  SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cMsg_Qtd_Horas SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nHora          SIZE 55, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nQtdHoras      SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Calcular'     SIZE 55, 11 OF oDlg PIXEL ACTION FolhaPagamento(nHora, nQtdHoras)
    @ 075, 160 BUTTON 'Cancelar'     SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


/*/{Protheus.doc} Static Function FolhaPagamento
    Receber os dois valores inseridos, calcula e apresenta a f
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nHora, nQtdHoras, nSalarioBruto, nIR, nINSS, nFGTS, nTotalDescontos, nSalarioLiquido, cIR
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
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

    FwAlertInfo('Salário bruto (' + ALLTRIM(STR(nHora)) + '*' + ALLTRIM(STR(nQtdHoras)) + ')_______: R$ ' + ALLTRIM(STR(nSalarioBruto,7,2))+CRLF+;
                '( – ) IR ('+ALLTRIM(cIR)+')_______________: R$ '+ALLTRIM(STR(nIR,8,2))+CRLF+;
                '( – ) INSS (10%)____________: R$ '+ALLTRIM(STR(nINSS,6,2))+CRLF+;
                'FGTS (11%)_______________: R$ '+ALLTRIM(STR(nFGTS,6,2))+CRLF+;
                'Total de descontos__________: R$ '+ALLTRIM(STR(nTotalDescontos,6,2))+CRLF+;
                'Salário Líquido_____________: R$ '+ALLTRIM(STR(nSalarioLiquido,7,2)))

Return
