#INCLUDE 'TOTVS.CH'

/*
• 3 - Escreva um algoritmo para ler o salário mensal
atual de um funcionário e o percentual de reajuste. 
Calcular e escrever o valor do novo salário.
*/


User Function ResjusteSal()

    Local cTitle := 'Calculo do salário', cTexto := 'Informe o salário do funcionário: ', cTexto2 := 'Informe o percentual de reajuste: '
    Local nOpcao := 0
    Local nSalario := Space(10), nReajuste := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 80, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cTexto2    SIZE 80, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nSalario   SIZE 45, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nReajuste  SIZE 45, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Reajuste' SIZE 55, 11 OF oDlg PIXEL ACTION PrintaCot(nSalario, nReajuste)
    @ 030, 140 BUTTON 'Sair'     SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function PrintaCot(nSalario, nReajuste)

    FwAlertInfo('O valor do salário reajustado é: R$ ' + ALLTRIM(STR((VAL(nSalario)*((1+(VAL(nReajuste))/100))),8,2)) + CRLF +;
                'O valor do reajuste é: R$ '           + ALLTRIM(STR((VAL(nSalario)*((VAL(nReajuste))/100)),6,2)), 'Valor em real')

Return
