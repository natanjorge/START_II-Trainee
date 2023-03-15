#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function EX_03_Salario_Reajustado
    O programa lê o salário mensal atual de um funcionário e o percentual de reajuste. 
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Salario, cMsg_Percentual, nOpcao, nSalario, nReajuste 
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_03_Salario_Reajustado()

    Local cTitle := 'Calculo do salário', cMsg_Salario := 'Informe o salário do funcionário: ', cMsg_Percentual := 'Informe o percentual de reajuste: '
    Local nOpcao := 0
    Local nSalario := Space(10), nReajuste := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cMsg_Salario    SIZE 80, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cMsg_Percentual SIZE 80, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nSalario        SIZE 45, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nReajuste       SIZE 45, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Reajuste'      SIZE 55, 11 OF oDlg PIXEL ACTION Calcula_Salario(nSalario, nReajuste)
    @ 030, 140 BUTTON 'Sair'          SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function Calcula_Salario
    Calcula e escreve o valor do novo salário.    
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nSalario, nReajuste
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function Calcula_Salario(nSalario, nReajuste)

    FwAlertInfo('O valor do salário reajustado é: R$ ' + ALLTRIM(STR((VAL(nSalario)*((1+(VAL(nReajuste))/100))),8,2)) + CRLF +;
                'O valor do reajuste é: R$ '           + ALLTRIM(STR((VAL(nSalario)*((VAL(nReajuste))/100)),6,2)), 'Valor em real')

Return
