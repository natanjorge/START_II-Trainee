#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function FornecedoresSP()

	Local aArea := GetArea(), cAlias := GetNextAlias()
	Local cArmazena := '', cQuery := ''

    rpcsetenv('99', '01')

    cQuery := "SELECT A2_NOME " + "FROM " + RetSqlName('SA2') + " SA2" + CRLF + " WHERE A2_EST = 'SP' AND D_E_L_E_T_ = ' '"

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cArmazena 	+= (&(cAlias)->(A2_NOME)) + CRLF + '______________' + CRLF + CRLF
		&(cAlias)->(DbSkip())
	end

	FwAlertInfo(cArmazena, 'FORNECEDORES DE SÃO PAULO')

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
