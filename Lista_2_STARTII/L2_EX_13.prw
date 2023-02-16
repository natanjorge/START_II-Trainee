#INCLUDE 'TOTVS.CH'

/*
• 13 - Elaborar um programa que exiba na tela
automaticamente todos os múltiplos de um
determinado número informado pelo usuário,
existentes entre 1 e um limite, que também deverá
ser informado pelo usuário. Faça com apenas uma
estrutura de repetição (For / While), antes de
desenvolver, analise qual será a melhor opção.
*/


User Function MultiplosInsira()

    Local nCont:=0, nLimite := 0
    Local cArmazena := ''

    nNumInt := VAL(FwInputBox('Digite um número para saber quais são os multiplos dele: '))
    nLimite := VAL(FwInputBox('Digite um número para definir o limite: '))

    cArmazena := 'For: Múltiplos de '+ ALLTRIM(STR(nNumInt)) +', de 1 a '+ ALLTRIM(STR(nLimite)) +':' + CRLF

    for nCont := 1 to nLimite
        if nCont % nNumInt == 0
            cArmazena += ALLTRIM(STR(nCont)) + ' | '
        endif
    NEXT

    cArmazena += CRLF+CRLF+'While: Múltiplos de '+ALLTRIM(STR(nNumInt))+', de 1 a '+ALLTRIM(STR(nLimite)) +':' + CRLF
    nCont := 1
    while nCont != nLimite+1
        if nCont % nNumInt == 0
            cArmazena += ALLTRIM(STR(nCont)) + ' | '
        endif
        nCont++
    end

    FwAlertInfo(cArmazena)
Return
