#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function EX_02_Convesao_Moedas
    O programa solicita ao usuário o valor do Dólar e a quantidade de dólares que deseja converter.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Cotacao, cMsg_Qtd_Dolar, nOpcao, nCotacaoDolar, nQuantDolar 
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_02_Convesao_Moedas()

    Local cTitle := 'Digite a cotação do dólar ', cMsg_Cotacao := 'Digite a cotação do dólar: ', cMsg_Qtd_Dolar := 'Digite a quantidade de dólares: '
    Local nOpcao := 0
    Local nCotacaoDolar := Space(10), nQuantDolar := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cMsg_Cotacao   SIZE 80, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cMsg_Qtd_Dolar SIZE 80, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nCotacaoDolar  SIZE 45, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nQuantDolar    SIZE 45, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Cotação'      SIZE 55, 11 OF oDlg PIXEL ACTION PrintaCot(nCotacaoDolar, nQuantDolar)
    @ 030, 140 BUTTON 'Sair'         SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function PrintaCot
    Receber os dois valores inseridos e apresentar o valor total convertido para reais.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nCotacaoDolar, nQuantDolar
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function PrintaCot(nCotacaoDolar, nQuantDolar)

    FwAlertInfo('O valor em real é: R$ ' + ALLTRIM(STR((VAL(nCotacaoDolar)*VAL(nQuantDolar)),5,2)), 'Valor em real')

Return
