#INCLUDE 'TOTVS.CH'

/*
� 9 - Dado um n�mero de 1 at� 12, apresentar o
n�mero de dias do m�s correspondente. Se o
n�mero escolhido for 2 (fevereiro), considere 28
dias. Dica: O uso de Array pode simplificar as
coisas, mas n�o � obrigat�rio.
*/


User Function TesteMESES()

    Local nNum := 0 // Declara��o da vari�vel
    Local aMeses := {'Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'}

    nNum := VAL(FwInputBox('Digite o n�mero do m�s (1-12): '))

    FwAlertInfo('O m�s selecionado �: ' + ALLTRIM(aMeses[nNum]))

Return
