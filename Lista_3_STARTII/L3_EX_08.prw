#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function LISTA3_08()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := '', cMsg    := ''
    
    rpcsetenv("99", "01")

    cQuery := "SELECT top 1 MAX(SC6.C6_VALOR) AS VALOR, SB1.B1_COD, SB1.B1_DESC, SC6.C6_PRCVEN"+ CRLF
    cQuery += "FROM " + RetSqlName('SC6') + " SC6"  + CRLF
    cQuery += 'INNER JOIN SB1990 AS SB1 ON SB1.B1_COD = SC6.C6_PRODUTO'+ CRLF
    cQuery += "WHERE SC6.C6_NUM = '000001' AND SC6.D_E_L_E_T_ <> '*' AND SB1.D_E_L_E_T_ <> '*'"+ CRLF
    cQuery += 'GROUP BY SC6.C6_VALOR, SB1.B1_COD, SB1.B1_DESC, SC6.C6_PRCVEN' + CRLF
    cQuery += 'ORDER BY SC6.C6_VALOR DESC'

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
 
        cMsg +='C�digo: ' + &(cAlias)->(B1_COD) + CRLF
        cMsg +='Descri��o: ' +  &(cAlias)->(B1_DESC) + CRLF
        cMsg +='Valor Unit�rio: ' + ALLTRIM(STR( &(cAlias)->(C6_PRCVEN))) + CRLF
        cMsg +='Valor Total: ' + alltrim(str((Valor))) + CRLF  
        &(cAlias)->(DbSkip())
    END
        FwAlertInfo(cMsg, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
