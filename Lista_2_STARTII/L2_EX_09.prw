#INCLUDE 'TOTVS.CH'

/*
• 9 - Dado um número de 1 até 12, apresentar o
número de dias do mês correspondente. Se o
número escolhido for 2 (fevereiro), considere 28
dias. Dica: O uso de Array pode simplificar as
coisas, mas não é obrigatório.
*/


User Function TesteMESES()

    Local nNum := 0 // Declaração da variável
    Local aMeses := {'Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'}

    nNum := VAL(FwInputBox('Digite o número do mês (1-12): '))

    FwAlertInfo('O mês selecionado é: ' + ALLTRIM(aMeses[nNum]))

Return
