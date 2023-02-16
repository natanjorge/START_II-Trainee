#INCLUDE 'TOTVS.CH'

/*
� 15 - Fazer um programa para calcular e exibir os
"n" primeiros n�meros da s�rie de Fibonacci.
O usu�rio informar� o valor de n.
*/


User Function Fibonacci()

    Local nCont :=0, nNum := 0, nSoma:=0
    Local cArmazena := ''
    Local aFib:={0,1}

    nNum := VAL(FwInputBox('Quantos n�meros de Fibonacci voc� quer gerar? '))

    while nNum <= 0
        FwAlertInfo('Por favor, digite um n�mero inteiro positivo.')
        nNum := VAL(FwInputBox('Quantos n�meros de Fibonacci voc� quer gerar? '))
    end

    for nCont:= 3 to nNum
        nSoma := aFib[nCont-1] + aFib[nCont-2]
        AADD(aFib, nSoma)  
    NEXT

    for nCont:= 1 to nNum
        cArmazena += STR(aFib[nCont]) + ' | '
    NEXT

    FwAlertInfo('Os '+ALLTRIM(STR(nNum))+' primeiro n�meros da s�rie Fibonacci s�o:' +CRLF+CRLF+ ALLTRIM(cArmazena))

Return
