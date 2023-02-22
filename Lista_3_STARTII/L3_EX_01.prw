#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function LISTA3_01()
    Local aArea         := GetArea()
    Local cPedidoCompra := '', cFornecedor := '', cMsg := '', cArmazena := ''
    Local nCont         := 1

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'
    DbSelectArea('SC7')
    DbSetOrder(1)
    DbGoTop()


    while SC7->(!EOF())
        cPedidoCompra  := SC7->C7_NUM
        cFornecedor    := SC7->C7_FORNECE

        if cArmazena != C7_NUM .and. cFornecedor == 'F00004'
            cMsg += 'Pedido : ' + cPedidoCompra + CRLF
            cMsg += '------------------------------' + CRLF + CRLF
            nCont++
            cArmazena := SC7->C7_NUM
        ENDIF

        if nCont == 10
            FwAlertInfo(cMsg, 'Dados dos Clientes')
            nCont := 0
            cMsg  := ''
        endif
        DbSkip()
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Dados dos Clientes')
    endif

    DbCloseArea()
    RestArea(aArea)
Return
