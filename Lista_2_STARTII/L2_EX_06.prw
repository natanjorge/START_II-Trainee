#INCLUDE 'TOTVS.CH'

/*
� 6 � Efetuar a leitura de quatro n�meros inteiros e
apresentar os n�meros que s�o divis�veis por 2 e 3.
*/

User Function DivisivelDoisTres()

    Local nCont := 0, nNumInt := 0 
    Local aArmazena := ''

    for nCont := 1 to 4
        nNumInt   := VAL(FwInputBox('Digite um n�mero inteiro: '))
        if nNumInt % 2 == 0
            aArmazena+= ('O n�mero ' + ALLTRIM(STR(nNumInt)) + ' � divis�vel por 2') + CRLF 
        elseif nNumInt % 3 == 0
            aArmazena+= ('O n�mero ' + ALLTRIM(STR(nNumInt)) + ' � divis�vel por 3') + CRLF 
        else
            aArmazena+= ('O n�mero ' + ALLTRIM(STR(nNumInt)) + ' n�o divis�vel por 2 ou 3') + CRLF 
        endif
    next

    FwAlertInfo(aArmazena) 

Return
