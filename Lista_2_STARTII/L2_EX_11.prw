#INCLUDE 'TOTVS.CH'

/*
• 11 - Elaborar um programa que exiba na tela,
automaticamente, 50 valores gerados
aleatoriamente, entre 10 e 99. Fazer 2 versões
desta solução:
o 1ª - Utilizando For
o 2ª – Utilizando While
*/


User Function NumerosAleatorios()

    Local nCont:=0
    Local cArmazena := ''

    cArmazena := 'Utilizando o For:' + CRLF
    for nCont := 1 to 50
        cArmazena += ALLTRIM(STR(RANDOMIZE( 10, 99))) + ' | '
    NEXT

    nCont := 0
    cArmazena += CRLF+CRLF+ 'Utilizando o While:' + CRLF
    while nCont != 50
        cArmazena += ALLTRIM(STR(RANDOMIZE( 10, 99))) + ' | '
        nCont++
    end

    FwAlertInfo(cArmazena)
Return
