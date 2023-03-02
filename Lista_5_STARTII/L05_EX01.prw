#INCLUDE 'TOTVS.CH'

/*• 1 – Fazer um programa que dados um número de 1
até 7, apresente o nome do dia da semana
correspondente. Considere 1 como “Domingo”.*/


User Function DiasSemana()

    Local aDias := {'Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'}    
    Local nCont := 0

    For nCont := 1 to 7
        FwAlertInfo('O número do dia da semana é: ' + ALLTRIM(STR(nCont)), (aDias[nCont]))
    Next

Return
