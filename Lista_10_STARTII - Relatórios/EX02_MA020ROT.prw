#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*• 2 – Adicione um botão à tela de Cadastro de
Fornecedores. A função desse botão será imprimir
os dados do fornecedor selecionado.
Você mesmo determinará quais são os campos que
devem ser impressos.*/
 

/*/{Protheus.doc} User Function TReport
	Exemplo de impressão com TReport.
	@type  Function
	@author Natan Jorge
	@since 29/03/2023
/*/
User Function MA020ROT()

Local aRotUser := {} 
	//Define Array contendo as Rotinas a executar do programa     
	// ----------- Elementos contidos por dimensao ------------    
	// 1. Nome a aparecer no cabecalho                             
	// 2. Nome da Rotina associada                                 
	// 3. Usado pela rotina                                        
	// 4. Tipo de Transacao a ser efetuada                         
	//    1 - Pesquisa e Posiciona em um Banco de Dados            
	//    2 - Simplesmente Mostra os Campos                       
	//    3 - Inclui registros no Bancos de Dados                 
	//    4 - Altera o registro corrente                           
	//    5 - Remove o registro corrente do Banco de Dados         
	//    6 - Altera determinados campos sem incluir novos Regs     

	AAdd( aRotUser, { 'Relatório', 'U_Relatorio()', 0, 4 } )

Return aRotUser

User Function Relatorio()

	Local oReport := GeraReport() 
	
 	oReport:PrintDialog()

Return

Static Function GeraReport()

	Local cAlias	:= GetNextAlias()
	Local oReport	:= TReport():New('Relatorio', 'Relatório de produtos',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relatório imprimirá todos os cadastros de produtos',.F.,,,, .T., .T.)
	Local oSection1	:= TRSection():New(oReport, "Produtos",,,.F.,.T.)		

	TRCell():New(oSection1, 'A2_COD', 'SA2', 'Codigo', /*Picture*/, 12, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'A2_LOJA', 'SA2', 'Loja', /*Picture*/, 2, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'A2_NOME', 'SA2', 'Nome ou Razao Social', /*Picture*/, 50, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'A2_END', 'SA2', 'Endereco', /*Picture*/, 25, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

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
	
	oSection1:Cell('Codigo'):SetValue((cAlias)->A2_COD)
	oSection1:Cell('Loja'):SetValue((cAlias)->A2_LOJA)
	oSection1:Cell('Nome ou Razao Social'):SetValue((cAlias)->A2_NOME)
	oSection1:Cell('Endereco'):SetValue((cAlias)->A2_END)
	oSection1:PrintLine()  //! Imprimindo (gerando) a linha

	oReport:ThinLine()     //! Imprimindo uma linha fina
	oReport:IncMeter()     //! Imcrementando a barra de progressão
	
	(cAlias)->(DBCloseArea())
	oSection1:Finish()			
	oReport:EndPage()

Return

Static Function GeraQuery()

	Local cQuery := ''

	cQuery += 'SELECT A2_COD, A2_LOJA, A2_NOME, A2_END' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '"  
	cQuery += " AND A2_COD = '" + SA2->A2_COD + " '"

Return cQuery
