#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*• 1 – Adicione um botão à rotina de Pedidos de Venda.
Ao clicar nesse botão, deve ser gerado um
relatório com os dados do pedido selecionado.
Esse relatório deve possuir 2 seções:

o 1ª Seção – Cabeçalho do Pedido
	? Número do Pedido
	? Nome do Cliente
	? Data de Emissão
	? Descrição da Condição de Pagamento

o 2ª Seção – Itens

	? Nº do Item
	? Código do Produto
	? Descrição do Produto
	? Quantidade Vendida
	? Valor Unitário
	? Valor Total
	• Esse relatório deve conter um totalizador com o valor total do pedido.*/


/*/{Protheus.doc} User Function MA410MNU
	Impressão com MA410MNU.
	@type  Function
	@author Natan Jorge
	@since 11/04/2023
/*/
User Function MA410MNU()
    Local aArea := GetArea()
     
    aadd(aRotina, {"Relatorio", "U_Relatorio", 0 , 4, 0 , Nil})
     
    RestArea(aArea)
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
	Local oBreak
	
	//! o 1ª Seção
	TRCell():New(oSection1, 'C5_NUM',     'SC5', 'Número do Pedido', 	     /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT',   .T., 'LEFT',   /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'A1_NOME',    'SA1', 'Nome do Cliente', 	     /*Picture*/, 50, /*Pixel*/, /*Code-Block*/, 'LEFT',   .T., 'LEFT',   /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C5_EMISSAO', 'SC5', 'Data de Emissão', 	     /*Picture*/, 50, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'E4_DESCRI',  'SE4', 'Desc. Cond. de Pagamento', /*Picture*/, 25, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
	//! o 2ª Seção
	TRCell():New(oSection2, 'C6_ITEM',    'SC6', 'Nº do Item',           /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'LEFT',   .T., 'LEFT',   /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_PRODUTO', 'SC6', 'Código do Produto',    /*Picture*/, 50, /*Pixel*/, /*Code-Block*/, 'LEFT',   .T., 'LEFT',   /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_DESCRI',  'SC6', 'Descrição do Produto', /*Picture*/, 50, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_QTDVEN',  'SC6', 'Quantidade Vendida',   /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_PRCVEN',  'SC6', 'Valor Unitário',       /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_VALOR',   'SC6', 'Valor Total',          /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

	oBreak := TRBreak():New(oSection1, oSection1:Cell('C5_NUM'),'',.T.)

	TRFunction():New(oSection2:Cell('C6_VALOR'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL',,, .F., .F., .F.) 

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
	oSection1:Init()
	(cAlias)->(DBGoTop())
	
	//! o 1ª Seção
	oSection1:Cell('C5_NUM'):SetValue((cAlias)->C5_NUM)
	oSection1:Cell('A1_NOME'):SetValue((cAlias)->A1_NOME)
	oSection1:Cell('C5_EMISSAO'):SetValue(STOD((cAlias)->C5_EMISSAO))
	oSection1:Cell('E4_DESCRI'):SetValue((cAlias)->E4_DESCRI)

	oSection1:PrintLine()  //! Imprimindo (gerando) a linha

	while (cAlias)->(!EOF())
		//! o 2ª Seção
		oSection2:Init()

		oSection2:Cell('C6_ITEM'):SetValue((cAlias)->C6_ITEM)
		oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->C6_PRODUTO)
		oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->C6_DESCRI)
		oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->C6_QTDVEN)
		oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->C6_PRCVEN)
		oSection2:Cell('C6_VALOR'):SetValue((cAlias)->C6_VALOR)

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

	cQuery += 'SELECT C5_NUM, C5_EMISSAO, C5_CLIENTE, C5_CONDPAG, C6_ITEM, C6_PRODUTO, C6_DESCRI, C6_QTDVEN, C6_PRCVEN, C6_NUM, C6_VALOR, E4_DESCRI, E4_CODIGO, A1_NOME, A1_COD' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC5') + ' SC5' + CRLF
	cQuery += "INNER JOIN " + RetSqlName('SC6') + " SC6 ON C6_NUM = C5_NUM " + CRLF
	cQuery += "INNER JOIN " + RetSqlName('SA1') + " SA1 ON C5_CLIENTE = A1_COD " + CRLF
	cQuery += "INNER JOIN " + RetSqlName('SE4') + " SE4 ON C5_CONDPAG = E4_CODIGO " + CRLF
	cQuery += " AND C5_NUM = '" + SC5->C5_NUM + "'" + CRLF

Return cQuery
