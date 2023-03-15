#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'


/*/ {Protheus.doc} User Function EX_11_Busc_Prod_Cod
    O programa solicita ao usuário o código de produto e saber se esse código existe no sistema ou não.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Cod, nOpcao, oDlg
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_11_Busc_Prod_Cod()

    Local cTitle := 'BUSCA PRODUTO', cMsg_Cod := 'Insira o código do produto: ', cCod := Space(15)
    Local nOpcao := 0
    Local oDlg := nContadorL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL
    
    @ 014, 010 SAY    cMsg_Cod     SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cCod       SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Buscar'   SIZE 55, 11 OF oDlg PIXEL ACTION BuscaProduto(cCod)
    @ 035, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function BuscaProduto
    Receber os dois valores inseridos e apresentar o valor total convertido para reais.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param cCod, aArea, cAlias, cQuery, cMsg, nContador
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function BuscaProduto(cCod)

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := '', cMsg := '', nContador := 0

    rpcsetenv('99', '01')

    cQuery := "SELECT B1_COD, B1_DESC, B1_PRV1 FROM " + RetSqlName('SB1') + CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cCod := ALLTRIM(cCod)

    While &(cAlias)->(!EOF())

      If cCod == ALLTRIM(&(cAlias)->(B1_COD))
        cMsg += 'Código: '    + &(cAlias)->(B1_COD) + CRLF +; 
                'Descrição: ' + &(cAlias)->(B1_DESC) + CRLF +;
                'Preço de venda: R$' + Alltrim(STR(&(cAlias)->(B1_PRV1))) + CRLF+;
                '_______________________' + CRLF + CRLF
        nContador++
      Endif

      &(cAlias)->(DbSkip())
    Enddo

    If nContador > 0
        FwAlertSuccess(cMsg, 'Dados do Produto')
    Else
        FwAlertError('Código de produto inexistente no sistema!', 'ERRO!')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
    
Return
