#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
 

/*
• 11 – Faça um programa em que o usuário possa
digitar um código de produto e saber se esse
código existe no sistema ou não. Caso exista,
apresente o Código, Descrição e o Preço de Venda,
caso contrário, apresente uma mensagem
informando que não existe.

*/

User Function SearchProduto()

    Local cTitle := 'BUSCA PRODUTO', cTexto := 'Insira o código do produto: ', cCod := Space(15)
    Local nOpcao := 0
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cCod       SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Buscar'   SIZE 55, 11 OF oDlg PIXEL ACTION BuscaProduto(cCod)
    @ 035, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function BuscaProduto(cCod)

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := '', cMsg := '', nI := 0

    rpcsetenv('99', '01')

    cQuery := "SELECT "   + CRLF
    cQuery += "B1_COD "   + CRLF
    cQuery += ",B1_DESC " + CRLF
    cQuery += ",B1_PRV1 " + CRLF
    cQuery += "FROM "     + RetSqlName('SB1') + CRLF
    cQuery += " ORDER BY B1_DESC ASC "


    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cCod := ALLTRIM(cCod)

    While &(cAlias)->(!EOF())

      If cCod == ALLTRIM(&(cAlias)->(B1_COD))
        cMsg += 'Código: '    + &(cAlias)->(B1_COD) + CRLF +; 
                'Descrição: ' + &(cAlias)->(B1_DESC) + CRLF +;
                'Preço de venda: R$' + Alltrim(STR(&(cAlias)->(B1_PRV1))) + CRLF+;
                '_______________________' + CRLF + CRLF
        nI++
      Endif

      &(cAlias)->(DbSkip())
    Enddo

    If nI > 0
        FwAlertSuccess(cMsg, 'Dados do Produto')
    Else
        FwAlertError('Código de produto inexistente no sistema')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
