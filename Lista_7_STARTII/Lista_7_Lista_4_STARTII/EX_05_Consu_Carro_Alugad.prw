#INCLUDE 'TOTVS.CH'

#DEFINE nCUSTO_DIA 60 //R$60,00/dia
#DEFINE nCUSTO_KM 0.15 //R$0,15/Km rodado

/*/ {Protheus.doc} User Function EX_05_Consu_Carro_Alugad
    O programa calcula o preço a pagar de um carro de aluguel, sabendo que o carro custa R$60,00/dia e R$0,15/Km rodado.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Qtd_KM, cMsg_Qtd_Dias, nOpcao, nKm, nDias 
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_05_Consu_Carro_Alugad()

    Local cTitle := 'Valor do aluguel', cMsg_Qtd_KM := 'Quantidade de Km percorridos:  ', cMsg_Qtd_Dias := 'Quantidade de dias de aluguel: '
    Local nOpcao := 0
    Local nKm := Space(10), nDias := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cMsg_Qtd_KM   SIZE 90, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cMsg_Qtd_Dias SIZE 90, 12 OF oDlg PIXEL
    @ 010, 100 MSGET  nKm           SIZE 35, 11 OF oDlg PIXEL
    @ 030, 100 MSGET  nDias         SIZE 35, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Calcular'    SIZE 55, 11 OF oDlg PIXEL ACTION Calc_Consumo(nKm, nDias)
    @ 030, 140 BUTTON 'Sair'        SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function Calc_Consumo
    Receber os dois valores inseridos e apresentar o preço a pagar.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nKm, nDias, nCUSTO_KM, nCUSTO_DIA
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function Calc_Consumo(nKm, nDias)

    FwAlertInfo('Preço a pagar: R$ ' + ALLTRIM(STR(((VAL(nKm))*nCUSTO_KM)+((VAL(nDias))*nCUSTO_DIA),8,2)), 'Valor do aluguel')

Return
