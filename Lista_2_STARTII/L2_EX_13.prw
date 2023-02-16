#INCLUDE 'TOTVS.CH'

/*
� 13 - Elaborar um programa que exiba na tela
automaticamente todos os m�ltiplos de um
determinado n�mero informado pelo usu�rio,
existentes entre 1 e um limite, que tamb�m dever�
ser informado pelo usu�rio. Fa�a com apenas uma
estrutura de repeti��o (For / While), antes de
desenvolver, analise qual ser� a melhor op��o.
*/


User Function MultiplosInsira()

    Local nCont:=0, nLimite := 0
    Local cArmazena := ''

    nNumInt := VAL(FwInputBox('Digite um n�mero para saber quais s�o os multiplos dele: '))
    nLimite := VAL(FwInputBox('Digite um n�mero para definir o limite: '))

    cArmazena := 'For: M�ltiplos de '+ ALLTRIM(STR(nNumInt)) +', de 1 a '+ ALLTRIM(STR(nLimite)) +':' + CRLF

    for nCont := 1 to nLimite
        if nCont % nNumInt == 0
            cArmazena += ALLTRIM(STR(nCont)) + ' | '
        endif
    NEXT

    cArmazena += CRLF+CRLF+'While: M�ltiplos de '+ALLTRIM(STR(nNumInt))+', de 1 a '+ALLTRIM(STR(nLimite)) +':' + CRLF
    nCont := 1
    while nCont != nLimite+1
        if nCont % nNumInt == 0
            cArmazena += ALLTRIM(STR(nCont)) + ' | '
        endif
        nCont++
    end

    FwAlertInfo(cArmazena)
Return
