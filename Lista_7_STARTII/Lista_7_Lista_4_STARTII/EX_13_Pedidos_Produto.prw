#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
 

/*/ {Protheus.doc} User Function EX_13_Pedidos_Produto
    Rotina faz com base em um código de produto informado pelo usuário, retorne /todos os pedidos de venda em que esse produto está sendo usado.
    @type User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Dig_Cod, cRecebe_Cod, nOpcao, oDlg
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_13_Pedidos_Produto()

    Local cTitle := 'BUSCA PRODUTO', cMsg_Dig_Cod := 'Digite o código do produto: '
    Local cRecebe_Cod := Space(15)
    Local nOpcao := 0
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL
    
    @ 014, 010 SAY    cMsg_Dig_Cod SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cRecebe_Cod  SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Buscar'     SIZE 55, 11 OF oDlg PIXEL ACTION Busca_Pedidos(cRecebe_Cod)
    @ 035, 160 BUTTON 'Cancelar'   SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function Busca_Pedidos
    Recebe o codigo, realiza a busca no banco de dados e printa os pedidos.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param cRecebe_Cod, aArea, cAlias, cPed, cMsg, cQuery
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function Busca_Pedidos(cRecebe_Cod)

	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cPed := '', cMsg := 'Pedidos de venda para o produto ' + ALLTRIM(cRecebe_Cod) +  ' são: ¦ '

  rpcsetenv("99", "01")

	cQuery := 'SELECT C6_PRODUTO, C6_NUM' + CRLF + "FROM " + RetSqlName('SC6') + " SC6" + CRLF + "WHERE C6_PRODUTO = '" + cRecebe_Cod + "' "

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
