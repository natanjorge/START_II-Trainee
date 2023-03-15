#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
 
/*
• 14 – Altere a rotina do exercício anterior,
permitindo que o usuário selecione um dos
produtos que já estão cadastrados do Protheus.
*/

/*/ {Protheus.doc} User Function EX_14_Prod_Cadastrados
    O programa permiti que o usuário selecione um dos produtos que já estão cadastrados do Protheus.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Cod_Prod, cCodigo, nOpcao, oDlg
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_14_Prod_Cadastrados()

    Local cTitle := 'BUSCA PRODUTO', cMsg_Cod_Prod := 'Digite o código do produto: '
    Local cCodigo := Space(15)
    Local nOpcao := 0
    Local oDlg := nContL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 175, 370 PIXEL
    
    @ 014, 010 SAY    cMsg_Cod_Prod          SIZE 120, 12 OF oDlg PIXEL
    @ 010, 080 MSGET  cCodigo                SIZE 90, 11 OF oDlg PIXEL
    @ 040, 010 BUTTON 'Buscar'               SIZE 70, 11 OF oDlg PIXEL ACTION RetornaPed(cCodigo)
	@ 060, 010 BUTTON 'Produtos cadastrados' SIZE 70, 11 OF oDlg PIXEL ACTION ProdCad()
	@ 040, 100 BUTTON 'Selecionar produto'   SIZE 70, 11 OF oDlg PIXEL ACTION SelecProd(cCodigo)
    @ 060, 100 BUTTON 'Cancelar'             SIZE 70, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function RetornaPed
    Recebe o código, busca nos pedidos de vendas e os imprime.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param cCodigo, aArea, cAlias, cPed, cMsg
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function RetornaPed(cCodigo)

	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cPed := '', cMsg := 'Pedidos de venda para o produto ' + ALLTRIM(cCodigo) +  ' são: ¦ '

  	rpcsetenv("99", "01")

	cQuery := 'SELECT C6_PRODUTO, C6_NUM' + CRLF + "FROM " + RetSqlName('SC6') + " SC6" + CRLF + "WHERE C6_PRODUTO = '" + cCodigo + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cPed := &(cAlias)->(C6_NUM)
		cMsg += cPed + " ¦ "
		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, 'Pedidos de venda')
	&(cAlias)->(DbCloseArea())
	RestArea(aArea)

Return

/*/{Protheus.doc} Static Function ProdCad
    Mostra todos os produtos cadastrados
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param aArea, cAlias, cMsg, nCont
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function ProdCad()

	Local aArea  := GetArea()
	Local cAlias := GetNextAlias()
	Local cMsg 	 := 'PRODUTO(S) CADASTRADO(S) ' + CRLF + CRLF
	Local nCont  := 0 

    rpcsetenv("99", "01")

	cQuery := 'SELECT C6_PRODUTO, C6_DESCRI' + CRLF + "FROM " + RetSqlName('SC6')

	TCQUERY cQuery ALIAS &(cAlias)

    &(cAlias)->(DbGoTop())

	while &(cAlias)->(!EOF())
		cMsg += 'Código: '     + &(cAlias)->(C6_PRODUTO) + CRLF +; 
                'Descrição: '  + &(cAlias)->(C6_DESCRI) + CRLF +;
                '_______________________' + CRLF + CRLF
		&(cAlias)->(DbSkip())

		nCont++
		
		if nCont == 10
			FwAlertInfo(cMsg, 'Produtos Cadastrados')
			cMsg := ''; nCont := 0
		endif
	end

	FwAlertInfo(cMsg, 'Produtos Cadastrados')
	&(cAlias)->(DbCloseArea())
	RestArea(aArea)

Return

/*/{Protheus.doc} Static Function SelecProd
    Recebe o código e permite a seleção do produto
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param aArea, cAlias, cMsg, nCont
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function SelecProd(cCodigo)

	Local aArea  := GetArea()
	Local cAlias := GetNextAlias()
	Local cMsg 	 := ''
	Local nCont := 0

    rpcsetenv("99", "01")

	cQuery := "SELECT C6_PRODUTO, C6_DESCRI, C6_QTDVEN, C6_PRCVEN, C6_VALOR " + "FROM " + RetSqlName('SC6') + " ORDER BY C6_DESCRI ASC "
	
    TCQUERY cQuery ALIAS &(cAlias) NEW

	cCodigo := ALLTRIM(cCodigo)

    &(cAlias)->(DbGoTop())

	while &(cAlias)->(!EOF())

		if cCodigo == ALLTRIM(&(cAlias)->(C6_PRODUTO))
			cMsg += 'Código: '     + &(cAlias)->(C6_PRODUTO) + CRLF +; 
					'Descrição: '  + &(cAlias)->(C6_DESCRI) + CRLF +;
					'Quantidade: '       + Alltrim(STR(&(cAlias)->(C6_QTDVEN))) + CRLF+;
					'Preço de venda: R$' + Alltrim(STR(&(cAlias)->(C6_PRCVEN))) + CRLF+;
					'Valor total: R$'    + Alltrim(STR(&(cAlias)->(C6_VALOR))) + CRLF+;
					'_______________________' + CRLF + CRLF
			nCont++
		endif
		&(cAlias)->(DbSkip())
	end

    If nCont > 0
        FwAlertSuccess(cMsg, 'Dados do Produto Cadastrado')
    Else
        FwAlertError('Código de produto inexistente no sistema')
    Endif

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)

Return
