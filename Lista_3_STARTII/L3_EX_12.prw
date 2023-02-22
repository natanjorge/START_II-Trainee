#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function Preco()

    Local aArea      := GetArea() 
    Local cAlias     := GetNextAlias()
    Local cQuery     := '', cMsg := ''

    rpcsetenv("99", "01")

    cQuery := "SELECT TOP 1 MAX(C6_PRCVEN) AS MAIOR_VALOR, MIN(C6_PRCVEN) AS MENOR_VALOR " +CRLF
    cQuery += "FROM " + RetSqlName('SC6') + " SC6" 

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cMsg := "Item com maior pre�o: R$" + alltrim(str(&(cAlias)->(MAIOR_VALOR))) + CRLF
        cMsg += "Item com menor pre�o: R$" + alltrim(str(&(cAlias)->(MENOR_VALOR))) 
 
        &(cAlias)->(DbSkip())
    end

    FwAlertInfo(cMsg, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
