#INCLUDE 'TOTVS.CH'


/*/ {Protheus.doc} User Function EX_08_Calcula_IMC
    O programa solicita ao usuário o valor da altura e peso, para calcular o IMC.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Peso, cMsg_Altura, nOpcao, nPeso, nAltura, oDlg 
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_08_Calcula_IMC()

    Local cTitle := 'CALCULO IMC', cMsg_Peso := 'Informe seu peso (em kg): ', cMsg_Altura := 'Informe sua altura (em metros): '
    Local nOpcao := 0
    Local nPeso := Space(10), nAltura := Space(3)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 550 PIXEL
    
    @ 014, 010 SAY    cMsg_Peso   SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cMsg_Altura SIZE 120, 12 OF oDlg PIXEL
    @ 010, 130 MSGET  nPeso       SIZE 55, 11 OF oDlg PIXEL
    @ 030, 130 MSGET  nAltura     SIZE 55, 11 OF oDlg PIXEL PICTURE '@R 9.99'
    @ 010, 200 BUTTON 'Calcular'  SIZE 55, 11 OF oDlg PIXEL ACTION CalculaIMC(nPeso, nAltura)
    @ 030, 200 BUTTON 'Cancelar'  SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function CalculaIMC
    Receber os dois valores inseridos e apresentar o calculo do IMC.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nPeso, nAltura, nImc
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
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
