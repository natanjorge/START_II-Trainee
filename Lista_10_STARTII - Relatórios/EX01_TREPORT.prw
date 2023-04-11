#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'
/*• 1 – Desenvolva um relatório de produtos utilizando
TReport.
O relatório deve ser acessado través de uma
opção no menu do Protheus e deve conter os
seguintes dados:
o Código
o Descrição
o Unidade de Medida
o Preço de Venda
? Obs: Se não houver preço cadastrado,
deve ser apresentado “R$0,00”
o Armazém
*/
/*/{Protheus.doc} User Function TReport
	Exemplo de impressão com TReport.
	@type  Function
	@author Natan Jorge
	@since 29/03/2023
/*/
User Function TReport()

	Local oReport := GeraReport() 
	
 	oReport:PrintDialog()

Return

Static Function GeraReport()

	Local cAlias	:= GetNextAlias()
	Local oReport	:= TReport():New('TREPORT', 'Relatório de produtos',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relatório imprimirá todos os cadastros de produtos',.F.,,,, .T., .T.)
	Local oSection1	:= TRSection():New(oReport, "Produtos",,,.F.,.T.)		

	TRCell():New(oSection1, 'B1_COD', 'SB1', 'Codigo', /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'B1_DESC', 'SB1', 'Descrição', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'B1_UM', 'SB1', 'UN. de Medida', /*Picture*/, 2, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'B1_PRV1', 'SB1', 'Preco', '@E R$ 999999.99', 10, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'B1_LOCPAD', 'SB1', 'Armazem', /*Picture*/, 5, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

Return oReport

Static Function Imprime(oReport, cAlias)
	
	Local oSection1 := oReport:Section(1)
	Local nTotReg := 0
	Local cQuery := GeraQuery()	
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)	

	Count TO nTotReg 

	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relatório de Produtos')
	oReport:StartPage()
	oSection1:Init()  
	(cAlias)->(DBGoTop())
	
	//! Percorre todos os registros
	while !(cAlias)->(EoF())

		if oReport:Cancel() 
			Exit
		endif

		oSection1:Cell('Codigo'):SetValue((cAlias)->B1_COD)
		oSection1:Cell('Descricao'):SetValue((cAlias)->B1_DESC)
		oSection1:Cell('UN. de Medida'):SetValue((cAlias)->B1_UM)
		oSection1:Cell('Preco'):SetValue((cAlias)->B1_PRV1)
		oSection1:Cell('Armazem'):SetValue((cAlias)->B1_LOCPAD)
		oSection1:PrintLine()  //! Imprimindo (gerando) a linha

		oReport:ThinLine()     //! Imprimindo uma linha fina
		oReport:IncMeter()     //! Imcrementando a barra de progressão

		(cAlias)->(DBSkip())

	enddo   
	
	(cAlias)->(DBCloseArea())
	oSection1:Finish()			
	oReport:EndPage()

Return

Static Function GeraQuery()

	Local cQuery := ''

	cQuery += 'SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD' + CRLF
	cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF

Return cQuery
