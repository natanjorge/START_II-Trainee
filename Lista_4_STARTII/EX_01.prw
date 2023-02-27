#INCLUDE 'TOTVS.CH'

/*
� 1 � Ler dois n�meros positivos e apresentar a
soma, diferen�a, produto e quociente entre eles.
*/


User Function VisualDoisPositivos()

    Local cTitle := 'Soma, diferen�a, produto e quociente!', cTexto := 'Insira o primeiro valor: ', cTexto2 := 'Insira o segundo valor: '
    Local nOpcao := 0
    Local nValor_1 := Space(10), nValor_2 := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cTexto      SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010 SAY    cTexto2     SIZE 55, 07 OF oDlg PIXEL
    @ 010, 070 MSGET  nValor_1    SIZE 55, 11 OF oDlg PIXEL
    @ 030, 070 MSGET  nValor_2    SIZE 55, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Opera��es' SIZE 55, 11 OF oDlg PIXEL ACTION PrintaNum(nValor_1, nValor_2)
    @ 030, 140 BUTTON 'Sair'      SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function PrintaNum(nValor_1, nValor_2)

    nValor_1 := VAL(nValor_1)
    nValor_2 := VAL(nValor_2)

    FwAlertInfo('A soma dos n�meros �: '      + ALLTRIM(STR(nValor_1+nValor_2))+CRLF+;
                'A diferen�a entre eles �: '  + ALLTRIM(STR(nValor_1-nValor_2))+CRLF+;
                'O produto entre eles �: '    + ALLTRIM(STR(nValor_1*nValor_2))+CRLF+;
                'O quociente dos n�meros �: ' + ALLTRIM(STR(nValor_1/nValor_2)), 'Calculos num�ricos')

Return
