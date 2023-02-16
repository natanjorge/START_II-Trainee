#INCLUDE 'TOTVS.CH'

/*
� 14 - Fa�a um programa que calcule a somat�ria dos
"n" primeiros n�meros naturais pares ou �mpares.
O usu�rio informar� atrav�s de digita��o a
quantidade de n�meros desejada ("n") e escolher�
entre par ou �mpar.

*/


User Function ParOuImpar()

    Local nCont:=0, nLimite := 0
    Local cPar := '', cImpar := '',cEscolha:=''

    nLimite := VAL(FwInputBox('Digite o limite de n�meros que deseja: '))

    for nCont := 1 to nLimite
        if nCont % 2 == 0
            cPar += 'Os n�meros pares s�o: '+ALLTRIM(STR(nCont)) + ' | '+CRLF
        else
            cImpar += 'Os n�meros impares s�o: '+ALLTRIM(STR(nCont)) + ' | '+CRLF
        endif
    NEXT

    cEscolha := FwInputBox('Digite se deseja saber os n�meros Pares ou Impares (P/I): ')
    if UPPER(cEscolha)  == 'P'
        FwAlertInfo(cPar)
    elseif UPPER(cEscolha) == 'I'
        FwAlertInfo(cImpar)
    endif

Return
