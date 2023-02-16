#INCLUDE 'TOTVS.CH'

/*
• 6 – Efetuar a leitura de quatro números inteiros e
apresentar os números que são divisíveis por 2 e 3.
*/

User Function DivisivelDoisTres()

    Local nCont := 0, nNumInt := 0 
    Local cArmazena := ''

    for nCont := 1 to 4
        nNumInt   := VAL(FwInputBox('Digite um número inteiro: '))
        if nNumInt % 2 == 0 .and.  nNumInt % 3 == 0
            cArmazena+= ('O número ' + ALLTRIM(STR(nNumInt)) + ' é divisível por 2 e 3') + CRLF 
        else
            cArmazena+= ('O número ' + ALLTRIM(STR(nNumInt)) + ' não divisível por 2 ou 3') + CRLF 
        endif
    next

    FwAlertInfo(cArmazena) 

Return
