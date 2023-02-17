#INCLUDE 'TOTVS.CH'

/*
• 14 - Faça um programa que calcule a somatória dos
"n" primeiros números naturais pares ou ímpares.
O usuário informará através de digitação a
quantidade de números desejada ("n") e escolherá
entre par ou ímpar.

*/

User Function ParOuImpar()

    Local nCont:=0, nLimite := 0, nArmazena:=0
    Local cPar := '', cImpar := '',cEscolha:='', cArmazena:=''

    nLimite := VAL(FwInputBox('Digite o limite de números que deseja: '))

    for nCont := 1 to nLimite
        if nCont % 2 == 0
            cPar += 'Os números pares são: '+ALLTRIM(STR(nCont)) + ' | '+CRLF
            nArmazena+=nCont
            cArmazena:= 'A somatória dos valores é: '+ALLTRIM(STR(nArmazena)) + ' | '+CRLF
        else
            cImpar += 'Os números impares são: '+ALLTRIM(STR(nCont)) + ' | '+CRLF
            nArmazena+=nCont
            cArmazena:= 'A somatória dos valores é: '+ALLTRIM(STR(nArmazena)) + ' | '+CRLF       
        endif
    NEXT

    cEscolha := FwInputBox('Digite se deseja saber os números Pares ou Impares (P/I): ')
    if UPPER(cEscolha)  == 'P'
        FwAlertInfo(cPar+cArmazena)
    elseif UPPER(cEscolha) == 'I'
        FwAlertInfo(cImpar+cArmazena)
    endif

Return
