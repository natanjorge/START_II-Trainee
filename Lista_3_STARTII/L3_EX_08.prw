#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function ProdMaiorValor()
	Local aArea  := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := '', cMsg := ''

	rpcsetenv("99", "01")

	cQuery := 'SELECT C6_PRODUTO, C6_DESCRI,  C6_QTDVEN, C6_PRCVEN, C6_VALOR, C5_NUM' + CRLF + "FROM " + RetSqlName('SC5') + " SC5" + CRLF + "INNER JOIN " + RetSqlName('SC6') + " SC6" + " ON " + "C5_NUM = " + 'C6_NUM' + CRLF + "ORDER BY C6_VALOR DESC "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())

		if cMsg == ''
			cMsg := 'Código: '         + &(cAlias)->(C6_PRODUTO)               + CRLF +;
                    'Descrição: '      + &(cAlias)->(C6_DESCRI)                + CRLF +;
                    'Valor Unitário: ' + ALLTRIM(STR(&(cAlias)->(C6_PRCVEN)))  + CRLF +;
                    'Valor Total: '    + ALLTRIM(STR(&(cAlias)->(C6_VALOR)))   + CRLF + CRLF 
            &(cAlias)->(DbSkip())
		endif

		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, 'PRODUTO DE MAIOR VALOR: ')

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
