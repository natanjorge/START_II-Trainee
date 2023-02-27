#INCLUDE 'TOTVS.CH'

/*
� 2 � Desenvolva um programa que converta D�lar
(US$) para Real (R$). O programa dever� solicitar
ao usu�rio o valor do D�lar e a quantidade de
d�lares que deseja converter. No final,
apresentar o valor total convertido para reais.
*/


User Function CotacaoDolan()

    Local cTitle := 'Digite a cota��o do d�lar ', cTexto := 'Digite a cota��o do d�lar: ', cTexto2 := 'Digite a quantidade de d�lares: '
    Local nOpcao := 0
    Local nCotacaoDolar := Space(10), nQuantDolar := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cTexto         SIZE 80, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cTexto2        SIZE 80, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nCotacaoDolar  SIZE 45, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nQuantDolar    SIZE 45, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Cota��o'      SIZE 55, 11 OF oDlg PIXEL ACTION PrintaCot(nCotacaoDolar, nQuantDolar)
    @ 030, 140 BUTTON 'Sair'         SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function PrintaCot(nCotacaoDolar, nQuantDolar)

    FwAlertInfo('O valor em real �: R$ ' + ALLTRIM(STR((VAL(nCotacaoDolar)*VAL(nQuantDolar)),5,2)), 'Valor em real')

Return
