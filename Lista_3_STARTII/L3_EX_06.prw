#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function BusProdSQL()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := '', cMsg := '', cCod := '', nI := 0

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := "SELECT "   + CRLF
    cQuery += "B1_COD "   + CRLF
    cQuery += ",B1_DESC " + CRLF
    cQuery += ",B1_PRV1 " + CRLF
    cQuery += "FROM "     + RetSqlName('SB1') + CRLF
    cQuery += " ORDER BY B1_DESC ASC "


    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cCod := FwInputBox('Insira aqui o c�digo do produto.', cCod)

    While &(cAlias)->(!EOF())

      If cCod == ALLTRIM(&(cAlias)->(B1_COD))
        cMsg += 'C�digo: '    + &(cAlias)->(B1_COD) + CRLF +; 
                'Descri��o: ' + &(cAlias)->(B1_DESC) + CRLF +;
                'Pre�o de venda: R$' + Alltrim(STR(&(cAlias)->(B1_PRV1))) + CRLF+;
                '_______________________' + CRLF + CRLF
        nI++
      Endif

      &(cAlias)->(DbSkip())
    Enddo

    If nI > 0
        FwAlertSuccess(cMsg, 'Dados do Produto')
    Else
        FwAlertError('C�digo de produto inexistente no sistema')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
