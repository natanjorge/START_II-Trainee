#INCLUDE 'TOTVS.CH'

/*
• 5 – Escreva um programa que pergunte a
quantidade de Km percorridos por um carro
alugado e a quantidade de dias pelos quais ele foi
alugado. Calcule o preço a pagar, sabendo que o
carro custa R$60,00/dia e R$0,15/Km rodado.
*/

User Function CarroAlugado()

    Local cTitle := 'Valor do aluguel', cTexto := 'Quantidade de Km percorridos:  ', cTexto2 := 'Quantidade de dias de aluguel: '
    Local nOpcao := 0
    Local nKm := Space(10), nDias := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 90, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cTexto2    SIZE 90, 12 OF oDlg PIXEL
    @ 010, 100 MSGET  nKm        SIZE 35, 11 OF oDlg PIXEL
    @ 030, 100 MSGET  nDias      SIZE 35, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Calcular' SIZE 55, 11 OF oDlg PIXEL ACTION CalcArea(nKm, nDias)
    @ 030, 140 BUTTON 'Sair'     SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function CalcArea(nKm, nDias)

    FwAlertInfo('Preço a pagar: R$ ' + ALLTRIM(STR(((VAL(nKm))*0.15)+((VAL(nDias))*60),8,2)), 'Valor do aluguel')

Return
