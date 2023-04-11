#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*• 5 – Também na rotina de Pedidos de Compra,
adicione um novo botão que possibilite gerar um
relatório de todos os pedidos existentes
juntamente com seus respectivos produtos
(mesma ideia do exercício 3) */

/*/{Protheus.doc} User Function TReport
	Exemplo de impressão com TReport.
	@type  Function
	@author Natan Jorge
	@since 29/03/2023
/*/
User Function MT120BRW()   

	AAdd( aRotina, { 'Documento', "U_Relatorio)", 0, 2 } )

Return

User Function Relatorio()

	Local oReport := GeraReport() 
	
 	oReport:PrintDialog()

Return

Static Function GeraReport()

	Local cAlias := GetNextAlias()
	Local oReport   := TReport():New('Relatorio', 'Relatório de Pedidos de compra',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relatório imprimirá todos os cadastros de Pedidos de compra',.F.,,,, .T., .T.)
	Local oSection1 := TRSection():New(oReport, "Pedido",,,.F.,.T.)		
	Local oSection2 := TRSection():New(oSection1, "Itens",,,.F.,.T.)		

	TRCell():New(oSection1, 'C7_NUM', 'SC7', 'Numero do pedido de compra', /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_EMISSAO', 'SC7', 'Data da emissao', '99/99/9999', 2, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_FORNECE', 'SC7', 'Codigo do fornecedor', /*Picture*/, 50, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_LOJA', 'SC7', 'Loja do fornecedor', /*Picture*/, 25, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_COND', 'SC7', 'Condicao de Pgt', /*Picture*/, 25, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

	TRCell():New(oSection2, 'C7_PRODUTO', 'SC7', 'Codigo do Produto', /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_DESCRI', 'SC7', 'Descricao do Produto', /*Picture*/, 50, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_QUANT', 'SC7', 'Qtd do Produto', '@E 999999', 10, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_PRECO', 'SC7', 'Preco Unitario', /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_TOTAL', 'SC7', 'Valor Total', /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

Return oReport

Static Function Imprime(oReport, cAlias)
	
	Local oSection1 := oReport:Section(1)
	Local oSection2 := oSection1:Section(1)
	Local nTotReg 	:= 0
	Local cQuery 	:= GeraQuery()	
	Local cPedidoAnt

	DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)	

	Count TO nTotReg 

	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relatório de Pedidos de compra')

	(cAlias)->(DBGoTop())
	
	while (cAlias)->(!EOF())

		if((cAlias)->(C7_NUM)<>cPedidoAnt)

			oSection1:Init()

			oReport:StartPage()

			oSection1:Cell('C7_NUM'):SetValue((cAlias)->C7_NUM)
			oSection1:Cell('C7_EMISSAO'):SetValue((cAlias)->C7_EMISSAO)
			oSection1:Cell('C7_FORNECE'):SetValue((cAlias)->C7_FORNECE)
			oSection1:Cell('C7_LOJA'):SetValue((cAlias)->C7_LOJA)
			oSection1:Cell('C7_COND'):SetValue((cAlias)->C7_COND)

			oSection1:PrintLine()  	  //! Imprimindo (gerando) a linha
			oReport:IncMeter()
				
			oSection1:Finish() //! Finalizando dentro do while para que o cabeçalho seja impresso todas as vezes

		endif

		cPedidoAnt := ((cAlias)->(C7_NUM))

		oSection2:Init()

		oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->C7_PRODUTO)
		oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->C7_DESCRI)
		oSection2:Cell('C7_QUANT'):SetValue((cAlias)->C7_QUANT)
		oSection2:Cell('C7_PRECO'):SetValue((cAlias)->C7_PRECO)
		oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->C7_TOTAL)

		oSection2:PrintLine()  //! Imprimindo (gerando) a linha

		oReport:IncMeter()     //! Imcrementando a barra de progressão
		
		(cAlias)->(DbSkip())
		
	enddo

	oSection2:Finish()

	(cAlias)->(DBCloseArea())


	oReport:EndPage()

Return

Static Function GeraQuery()

	Local cQuery := ''

	cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '"  

Return cQuery
