#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*• 3 – Adicione um botão à rotina de Pedidos de
Compra. Ao clicar nesse botão, deve ser gerado um
relatório com os dados do pedido selecionado.
Esse relatório deve possuir 2 seções:

o 1ª Seção – Cabeçalho do Pedido
	? Número do Pedido
	? Data de Emissão
	? Código do Fornecedor
	? Loja do Fornecedor
	? Condição de Pagamento
o 2ª Seção – Itens
	? Código do Produto
	? Descrição do Produto
	? Quantidade Vendida
	? Valor Unitário
	? Valor Total                              */


/*/{Protheus.doc} User Function TReport
	Exemplo de impressão com TReport.
	@type  Function
	@author Natan Jorge
	@since 29/03/2023
/*/
User Function MT120BRW()   

	AAdd( aRotina, { 'Relatorio', "U_Relatorio)", 0, 4 } )

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
	Local nTotReg := 0
	Local cQuery := GeraQuery()	
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)	

	Count TO nTotReg 

	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relatório de Pedidos de compra')
	oReport:StartPage()

	oSection1:ForcedLineStyle()

	oSection1:Init()
	(cAlias)->(DBGoTop())
	
	oSection1:Cell('C7_NUM'):SetValue((cAlias)->C7_NUM)
	oSection1:Cell('C7_EMISSAO'):SetValue((cAlias)->C7_EMISSAO)
	oSection1:Cell('C7_FORNECE'):SetValue((cAlias)->C7_FORNECE)
	oSection1:Cell('C7_LOJA'):SetValue((cAlias)->C7_LOJA)
	oSection1:Cell('C7_COND'):SetValue((cAlias)->C7_COND)

	oSection1:PrintLine()  //! Imprimindo (gerando) a linha

	while (cAlias)->(!EOF())

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

	(cAlias)->(DBCloseArea())

	oSection2:Finish()
	oSection1:Finish()

	oReport:EndPage()

Return

Static Function GeraQuery()

	Local cQuery := ''

	cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '"  
	cQuery += " AND C7_NUM = '" + SC7->C7_NUM + " '"

Return cQuery
