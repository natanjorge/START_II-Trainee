#INCLUDE 'PROTHEUS.CH'

USER FUNCTION LISTA3_14()
    Local aNum  := {}
    Local nCont := 0
    Local nNum  := 0
    Local cMsg  := ''

    for nCont := 1 to 5
        nNum := Val(FwInputBox("Digite um n�mero: "))
        aadd(aNum, nNum)
    NEXT

    for nCont := 5 to 1 step -1
        cMsg += ALLTRIM(STR(aNum[nCont]))

    NEXT

    FwAlertSucess(cMsg + ", ")
RETURN
