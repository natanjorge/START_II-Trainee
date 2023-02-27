#INCLUDE 'TOTVS.CH'

/*
• 4 – Faça um programa que leia a largura e a altura
de uma parede em metros, calcule sua área e a
quantidade de tinta necessária para pintá-la,
sabendo que cada litro de tinta pinta uma área de 2
metros quadrados
*/

User Function CalculoTinta()

    Local cTitle := 'Calculo da área', cTexto := 'Informe a largura da parede em m²: ', cTexto2 := 'Informe a altura da parede em m²: '
    Local nOpcao := 0
    Local nLargura := Space(10), nAltura := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 90, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cTexto2    SIZE 90, 12 OF oDlg PIXEL
    @ 010, 100 MSGET  nLargura   SIZE 35, 11 OF oDlg PIXEL
    @ 030, 100 MSGET  nAltura    SIZE 35, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Calcular' SIZE 55, 11 OF oDlg PIXEL ACTION CalcArea(nLargura, nAltura)
    @ 030, 140 BUTTON 'Sair'     SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function CalcArea(nLargura, nAltura)

    FwAlertInfo('A área da parede é ' + ALLTRIM(STR((VAL(nLargura)*((VAL(nAltura)),8,2))))   + ' m²' + CRLF +;
                'Serão necessários '  + ALLTRIM(STR((VAL(nLargura)*((VAL(nAltura)),8,2))/2)) + ' litros de tinta', 'Quantidade de tinta')

Return
