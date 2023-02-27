#INCLUDE 'TOTVS.CH'

/*
• 9 – Desenvolva um programa para calcular a TMB
(Taxa Metabólica Basal) de um indivíduo. A fórmula
para calcular a TMB de homens, é diferente da
fórmula para mulheres. As fórmulas são:
o Para Homens:
? TMB = 66.5 + (13.75 * peso) + (5.003 *
altura em cm) – (6.75 * idade)
o Para Mulheres:
? TMB = 655.1 + (9.563 * peso) + (1.850 *
altura em cm) – (4.676 * idade)

*/

User Function CalculaTmb()

    Local cTitle := 'CALCULO TMB', cTexto := 'Informe seu peso (em kg): ', cTexto2 := 'Informe sua altura (em cm): ', cTexto3 := 'Informe sua idade: '
    Local nOpcao := 0
    Local nPeso := Space(10), nAltura := Space(3), nIdade := Space(3)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 450 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2    SIZE 120, 12 OF oDlg PIXEL
    @ 054, 010 SAY    cTexto3    SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nPeso      SIZE 55, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nAltura    SIZE 55, 11 OF oDlg PIXEL
    @ 050, 090 MSGET  nIdade     SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Homem'    SIZE 55, 11 OF oDlg PIXEL ACTION TmbHomem(nPeso, nAltura, nIdade)
    @ 030, 160 BUTTON 'Mulher'   SIZE 55, 11 OF oDlg PIXEL ACTION TmbMulher(nPeso, nAltura, nIdade)
    @ 075, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function TmbHomem(nPeso, nAltura, nIdade)

    Local nTmb := 0

    nTmb := 66.5 + (13.75 * VAL(nPeso)) + (5.003 * VAL(nAltura)) - (6.75 * VAL(nIdade))
    FwAlertInfo("Sua TMB é: "+ ALLTRIM(STR(nTmb)) + ' Calorias/Dia','TBM')

Return

Static Function TmbMulher(nPeso, nAltura, nIdade)

    Local nTmb := 0

    nTmb := 655.1  + (9.563 * VAL(nPeso)) + (1.850 * VAL(nAltura)) - (4.676 * VAL(nIdade))
    FwAlertInfo("Sua TMB é: "+ ALLTRIM(STR(nTmb)) + ' Calorias/Dia','TBM')

Return
