#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
 
/*
� 12 � Fa�a um programa em que o usu�rio possa
digitar um per�odo (data in�cio / data fim) e saber
quais s�o os pedidos de compra existentes no
per�odo informado.
*/


/*/ {Protheus.doc} User Function EX_12_Data_Pedido_Compra
    O programa solicita ao usu�rio uma data de in�cio e fim para saber quais s�o os pedidos existentes nos per�odo.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Data_inicio, cMsg_Data_fim, nOpcao, cDataIni, cDataFim, oDlg 
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_12_Data_Pedido_Compra()

    Local cTitle := 'BUSCA PRODUTO', cMsg_Data_inicio := 'Digite a data de in�cio: ', cMsg_Data_fim := 'Digite a data de fim: '
    Local cDataIni := Space(15), cDataFim :=  Space(15)
    Local nOpcao := 0
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL
    
    @ 014, 010 SAY    cMsg_Data_inicio SIZE 120, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cMsg_Data_fim    SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cDataIni         SIZE 55, 11 OF oDlg PIXEL PICTURE '@R 99/99/9999'
    @ 030, 090 MSGET  cDataFim         SIZE 55, 11 OF oDlg PIXEL PICTURE '@R 99/99/9999'
    @ 010, 160 BUTTON 'Buscar'         SIZE 55, 11 OF oDlg PIXEL ACTION PeriodoPedidoCompra(cDataIni, cDataFim)
    @ 035, 160 BUTTON 'Cancelar'       SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function PeriodoPedidoCompra
    Receber os dois valores inseridos, realiza a busca no banco de dados e os apresenta.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param cDataIni, cDataFim, aArea, cAlias, cQuery, cPed, cData, cMsg, nCont
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function PeriodoPedidoCompra(cDataIni, cDataFim)

	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := '', cPed := '', cData := '', cMsg := ''
  Local nCont := 0

  cDataIni := DTOS(CTOD(TRANSFORM(cDataIni,'@R 99/99/9999')))
  cDataFim := DTOS(CTOD(TRANSFORM(cDataFim,'@R 99/99/9999')))

  rpcsetenv("99", "01")

  cQuery := 'SELECT C7_NUM, C7_EMISSAO' + CRLF + "FROM " + RetSqlName('SC7') + " SC7" + CRLF + "WHERE C7_EMISSAO BETWEEN '" + cDataIni + "' AND '" + cDataFim + "' "

  TCQUERY cQuery ALIAS &(cAlias) NEW

  while &(cAlias)->(!EOF())
    cPed  := &(cAlias)->(C7_NUM)
    cData := &(cAlias)->(C7_EMISSAO)

    cMsg += 'Pedido N�: ' + cPed + CRLF + 'Data de emiss�o: ' + cData + CRLF + '_______________________' + CRLF + CRLF
    nCont++

    if nCont == 10
      FwAlertInfo(cMsg, 'Pedidos de compra')
      cMsg := ''; nCont := 0
    endif

    &(cAlias)->(DbSkip())
  enddo

	FwAlertInfo(cMsg, 'Pedidos de compra')

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
  
Return
