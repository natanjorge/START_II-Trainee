#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

USER FUNCTION LISTA3_10()

    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cMsg   := ''
    Local cPed   := ''
    rpcsetenv('99', '01')

     cPed := alltrim((FwInputBox("Digite o c�digo do produto a ser pesquisado: ")))

    cQuery := "SELECT SB1.B1_COD, CONCAT(SC6.C6_NUM, ', ') AS NUMPED, AVG(SC6.C6_QTDVEN) AS MEDIA_QUANT" + CRLF
    cQuery += "FROM " + RetSqlName('SB1') + " AS SB1" + CRLF
    cQuery += "INNER JOIN SC6990 AS SC6 ON SB1.B1_COD = SC6.C6_PRODUTO" + CRLF
    cQuery += "WHERE SC6.C6_PRODUTO = '" + alltrim(cPed) + "'" + CRLF
    cQuery += "GROUP BY SB1.B1_COD, SC6.C6_QTDVEN, SC6.C6_NUM "+ CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    if ALLTRIM(&(cAlias)->(NUMPED)) == ''
       FwAlertInfo("n�o possui itens com este c�digo no sistema") 
       RETURN
    ENDIF

    while &(cAlias)->(!EOF())

        cMsg := "O produto: " + alltrim(&(cAlias)->(B1_COD))
        cMsg += " foi utilizado no (s) pedido (s): " + alltrim(&(cAlias)->(NUMPED))
        cMsg += " em uma m�dia de " + alltrim(str(&(cAlias)->(MEDIA_QUANT))) + " itens solicitados em pedidos de venda"

        &(cAlias)->(DbSkip())
    END
        FwAlertInfo(cMsg, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
