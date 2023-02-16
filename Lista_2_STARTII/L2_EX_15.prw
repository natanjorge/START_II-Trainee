#INCLUDE 'TOTVS.CH'

/*
• 15 - Fazer um programa para calcular e exibir os
"n" primeiros números da série de Fibonacci.
O usuário informará o valor de n.
*/


User Function Fibonacci()

    Local nCont :=0, nNum := 0, nSoma:=0
    Local cArmazena := ''
    Local aFib:={0,1}

    nNum := VAL(FwInputBox('Quantos números de Fibonacci você quer gerar? '))

    while nNum <= 0
        FwAlertInfo('Por favor, digite um número inteiro positivo.')
        nNum := VAL(FwInputBox('Quantos números de Fibonacci você quer gerar? '))
    end

    for nCont:= 3 to nNum
        nSoma := aFib[nCont-1] + aFib[nCont-2]
        AADD(aFib, nSoma)  
    NEXT

    for nCont:= 1 to nNum
        cArmazena += STR(aFib[nCont]) + ' | '
    NEXT

    FwAlertInfo('Os '+ALLTRIM(STR(nNum))+' primeiro números da série Fibonacci são:' +CRLF+CRLF+ ALLTRIM(cArmazena))

Return
