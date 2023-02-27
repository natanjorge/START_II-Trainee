#INCLUDE 'TOTVS.CH'

/*
8 – Desenvolva um programa que calcule o IMC
(Índice de Massa Corporal) de um indivíduo. Para
descobrir o valor do IMC, basta dividir o peso pela
altura ao quadrado. O usuário deve informar seu
peso e sua altura. Após o usuário inserir os
dados, o programa deve informar qual o valor do
IMC e a classificação, que segue as seguintes
regras:
o Menor que 18,5: Magreza – Obesidade (Grau): 0
o Entre 18,5 e 24,9: Normal – Obesidade (Grau): 0
o Entre 25,0 e 29,9: Sobrepeso – Obes. (Grau): I
o Entre 30,0 e 39,9: Obesidade – Obes. (Grau): II
o Maior que 40,0: Obes. Grave - Obes. (Grau): III
*/

User Function EntradaIMC()

    Local cTitle := 'CALCULO IMC', cTexto := 'Informe seu peso (em kg): ', cTexto2 := 'Informe sua altura (em metros): '
    Local nOpcao := 0
    Local nPeso := Space(10), nAltura := Space(3)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 550 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2    SIZE 120, 12 OF oDlg PIXEL
    @ 010, 130 MSGET  nPeso      SIZE 55, 11 OF oDlg PIXEL
    @ 030, 130 MSGET  nAltura    SIZE 55, 11 OF oDlg PIXEL PICTURE '@R 9.99'
    @ 010, 200 BUTTON 'Calcular' SIZE 55, 11 OF oDlg PIXEL ACTION CalculaIMC(nPeso, nAltura)
    @ 030, 200 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function CalculaIMC(nPeso, nAltura)

    Local nImc := 0

    nAltura:= TRANSFORM (nAltura,'@R 9.99') //* Formata o valor inserindo o "."

    nImc := VAL(nPeso)/(VAL(nAltura)^2)

    if nImc < 18.5
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF + CRLF +"Classificação: Magreza - Obesidade (Grau): 0")
    elseif nImc >= 18.5 .AND. nImc <= 24.9
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF + CRLF +"Classificação: Normal - Obesidade (Grau): 0")
    elseif nImc >= 25.0 .AND. nImc <= 29.9
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF + CRLF +"Classificação: Sobrepeso - Obes. (Grau): I")
    elseif nImc >= 30.0 .AND. nImc <= 39.9
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF + CRLF +"Classificação: Obesidade - Obes. (Grau): II")
    else
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF + CRLF +"Classificação: Obes. Grave - Obes. (Grau): III")
    endif

Return
