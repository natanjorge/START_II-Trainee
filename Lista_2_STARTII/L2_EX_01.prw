#INCLUDE 'TOTVS.CH'

/*
� 1 � Ler dois n�meros positivos e apresentar a
soma, diferen�a, produto e quociente entre eles.
*/


User Function LerDoisPositivos()

    Local nValor_1 := -1, nValor_2 := -1

    while nValor_1 < 0
        nValor_1 := VAL(FwInputBox('Digite um primeiro n�mero positivo: ')) 
    END
    
    while nValor_2 < 0 
        nValor_2 := VAL(FwInputBox('Digite um segundo n�mero positivo: ')) 
    END

    FwAlertInfo('A soma dos n�meros �: ' + ALLTRIM(STR(nValor_1+nValor_2))+CRLF+;
                'A diferen�a entre eles �: ' + ALLTRIM(STR(nValor_1-nValor_2))+CRLF+;
                'O produto entre eles �: ' + ALLTRIM(STR(nValor_1*nValor_2))+CRLF+;
                'O quociente dos n�meros �: ' + ALLTRIM(STR(nValor_1/nValor_2)), 'Calculos num�ricos')

Return
