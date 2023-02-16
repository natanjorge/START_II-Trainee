#INCLUDE 'TOTVS.CH'

/*
10 - Efetuar a leitura de 5 valores inteiros e exibir
na tela o menor e o maior deles.
*/


User Function MenorMaior()

    Local nCont := 0
    Local aArmazena [5]

    for nCont := 1 to 5
        aArmazena [nCont]:= VAL(FwInputBox('Digite um valor: '))
    next

    ASORT(aArmazena)
    
    FwAlertInfo('O menor número é: ' + ALLTRIM(STR(aArmazena[1])) +CRLF+;
                'O maior número é: ' + ALLTRIM(STR(aArmazena[5])))
Return
