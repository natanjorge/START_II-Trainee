#INCLUDE 'TOTVS.CH'

/*� 1 � Fazer um programa que dados um n�mero de 1
at� 7, apresente o nome do dia da semana
correspondente. Considere 1 como �Domingo�.*/


User Function DiasSemana()

    Local aDias := {'Domingo', 'Segunda-feira', 'Ter�a-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'S�bado'}    
    Local nCont := 0

    For nCont := 1 to 7
        FwAlertInfo('O n�mero do dia da semana �: ' + ALLTRIM(STR(nCont)), (aDias[nCont]))
    Next

Return
