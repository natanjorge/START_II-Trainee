#INCLUDE 'TOTVS.CH'

/*
• 1 – Ler dois números positivos e apresentar a
soma, diferença, produto e quociente entre eles.
*/


User Function LerDoisPositivos()

    Local nValor_1 := -1, nValor_2 := -1

    while nValor_1 < 0
        nValor_1 := VAL(FwInputBox('Digite um primeiro número positivo: ')) 
    END
    
    while nValor_2 < 0 
        nValor_2 := VAL(FwInputBox('Digite um segundo número positivo: ')) 
    END

    FwAlertInfo('A soma dos números é: ' + ALLTRIM(STR(nValor_1+nValor_2))+CRLF+;
                'A diferença entre eles é: ' + ALLTRIM(STR(nValor_1-nValor_2))+CRLF+;
                'O produto entre eles é: ' + ALLTRIM(STR(nValor_1*nValor_2))+CRLF+;
                'O quociente dos números é: ' + ALLTRIM(STR(nValor_1/nValor_2)), 'Calculos numéricos')

Return
