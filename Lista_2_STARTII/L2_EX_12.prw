#INCLUDE 'TOTVS.CH'

/*
• 12 - Elaborar um programa que exiba na tela
automaticamente todos os múltiplos de 3
existentes entre 1 e 100. 
*/


User Function Multiplos3()

    Local nCont:=0
    Local cArmazena := ''

    cArmazena := 'Múltiplos de 3, de 1 a 100:' + CRLF
    for nCont := 1 to 100
        if nCont % 3 == 0
            cArmazena += ALLTRIM(STR(nCont)) + ' | '
        endif
    NEXT

    FwAlertInfo(cArmazena)
Return
