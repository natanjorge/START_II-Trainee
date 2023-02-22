#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function LISTA3_04()
    Local cDes   := '', cGrup  := '', cMsg   := ''
    Local nCont  := 1

    rpcsetenv("99", "01")

    BEGINSQL Alias "SB1"
        SELECT 
            B1_DESC,
            B1_GRUPO
        FROM %table:sb1% SB1
        where D_E_L_E_T_ <>'*'
    ENDSQL



    while SB1->(!EOF())
        cDes  := SB1->B1_DESC
        cGrup := SB1->B1_GRUPO

        IF cGrup == '02  '
            cMsg += 'produto ' +Alltrim(str(nCont))+' : ' + cDes + CRLF
            cMsg += '------------------------------' + CRLF + CRLF
            nCont++
        ENDIF

        if nCont == 10
        FwAlertInfo(cMsg, 'Dados dos Clientes')
        nCont := 0
        cMsg  := ''
        endif

        SB1->(DBSKIP())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Dados dos Clientes')
    endif

    SB1->(DBCLOSEAREA())
Return
