#INCLUDE 'TOTVS.ch'

/*� 1 � Desenvolva um relat�rio de produtos utilizando
PSAY. N�o � necess�rio utilizar cabe�alho.
O relat�rio deve ser acessado trav�s de uma
op��o no menu do Protheus e deve conter os
seguintes dados:
o C�digo
o Descri��o
o Unidade de Medida
o Pre�o de Venda
? Osb: Se n�o houver pre�o cadastrado,
deve ser apresentado �R$0,00�
o Armaz�m                                                    */

/*/{Protheus.doc} User Function PSAY
	Exemplo de relat�rio utilizando PSAY
	@type  Function
	@author Muriel Zounar
	@since 29/03/2023
	/*/
User Function PSAY()        
	Local cTitulo       := 'Cadastros de Produtos'
	Private nQtdLin 	:= 58
	Private cTamanho    := 'M'
	Private cNomeProg   := 'PSAY' //? Nome do programa para impressao no cabecalho
	Private aReturn     := {'Zebrado', 1, 'Administracao', 1, 2, '', '', 1}
	Private nLastKey    := 0
	Private cNomRel     := 'PSAY' //? Nome do arquivo usado para impressao em disco
	Private cAlias 	    := 'SB1'

	//? Monta a interface padrao com o usuario...
	cNomRel := SetPrint(cAlias, cNomeProg, '', @cTitulo, '', '', '', .F.,, .T., cTamanho,, .F.)
	
	//? Se pressionar "ESC" encerra o programa
	if nLastKey == 27
		FwAlertError('Opera��o cancelada pelo usu�rio!', 'CANCELADO!')
		Return
	endif
	
	//? Prepara o ambiente para impress�o
	SetDefault(aReturn, cAlias,, .T., 1)
	
	//? Processamento. RPTSTATUS monta janela com a regua de processamento.
	RptStatus({|| Imprime(cTitulo)}, cTitulo)
Return

Static Function Imprime(cTitulo)
  	Local cTraco := '----------------------------------------'
	Local nCont  := 0
	Private nLinha := 2 //? Linha em que a impress�o iniciar�
	
	DbSelectArea('SB1')
	SB1->(DbSetOrder(1))
	
	//? Impress�o dos dados de cada registro
	while !Eof() 

		cPreco := 'R$'+Alltrim(STR(SB1->B1_PRV1,,2))

		@ ++nLinha, 00 PSAY PADR('C�digo: ', 15) 	      + PADR(Alltrim(SB1->B1_COD), 10)
		@ ++nLinha, 00 PSAY PADR('Descri��o: ', 15)     + PADR(Alltrim(SB1->B1_DESC), 30)
		@ ++nLinha, 00 PSAY PADR('UN. de Medida: ', 15) + PADR(Alltrim(SB1->B1_UM), 30)
		@ ++nLinha, 00 PSAY PADR('Pre�o: ', 15) 	      + Alltrim(cPreco)
		@ ++nLinha, 00 PSAY PADR('Armaz�m: ', 15) 	  + PADR(Alltrim(SB1->B1_LOCPAD), 20)
		
		@ ++nLinha,00 PSAY cTraco

		nCont++
		if nCont == 10
			nCont  := 0
			nLinha := 0
		endif

		SB1->(dbSkip())

	enddo
	
	//? Finaliza a execucao do relatorio...
	SET DEVICE TO SCREEN
	
	//? Se impressao em disco, chama o gerenciador de impressao...
	if aReturn[5] == 1
		SET PRINTER TO dbCommitAll()
		OurSpool(cNomRel) //? Gerenciador de impress�o do Protheus
	endif
	
	//? Descarrega o spool de impress�o
	MS_FLUSH()
	
Return
