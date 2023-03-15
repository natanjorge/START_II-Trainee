#INCLUDE 'TOTVS.CH'

#DEFINE nFATOR_SOMA_HOMEM 66.5
#DEFINE nMULTI_PESO_HOMEM 13.75
#DEFINE nMULTI_ALT_HOMEM 5.003
#DEFINE nMULTI_IDADE_HOMEM 6.75

#DEFINE nFATOR_SOMA_MULHER 655.1
#DEFINE nMULTI_PESO_MULHER 9.563
#DEFINE nMULTI_ALT_MULHER 1.850
#DEFINE nMULTI_IDADE_MULHER 4.676

/*/ {Protheus.doc} User Function EX_09_Calcula_TMB
    O programa solicita ao usuário o valor do peso, altura e idade para calcular a TMB do homem ou mulher.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Peso, cMsg_Altura, cMsg_Idade, nOpcao, nPeso, nAltura, nIdade
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_09_Calcula_TMB()

    Local cTitle := 'CALCULO TMB', cMsg_Peso := 'Informe seu peso (em kg): ', cMsg_Altura := 'Informe sua altura (em cm): ', cMsg_Idade := 'Informe sua idade: '
    Local nOpcao := 0
    Local nPeso := Space(10), nAltura := Space(3), nIdade := Space(3)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 450 PIXEL
    
    @ 014, 010 SAY    cMsg_Peso   SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cMsg_Altura SIZE 120, 12 OF oDlg PIXEL
    @ 054, 010 SAY    cMsg_Idade  SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nPeso       SIZE 55, 11 OF oDlg PIXEL
    @ 030, 090 MSGET  nAltura     SIZE 55, 11 OF oDlg PIXEL
    @ 050, 090 MSGET  nIdade      SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Homem'     SIZE 55, 11 OF oDlg PIXEL ACTION TmbHomem(nPeso, nAltura, nIdade)
    @ 030, 160 BUTTON 'Mulher'    SIZE 55, 11 OF oDlg PIXEL ACTION TmbMulher(nPeso, nAltura, nIdade)
    @ 075, 160 BUTTON 'Cancelar'  SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


/*/{Protheus.doc} Static Function TmbHomem
    Receber os três valores inseridos e calcular a TMB do homem.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nPeso, nAltura, nIdade, nTmb, nFATOR_SOMA_HOMEM, nMULTI_PESO_HOMEM, nMULTI_ALT_HOMEM, nMULTI_IDADE_HOMEM
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function TmbHomem(nPeso, nAltura, nIdade)

    Local nTmb := 0

    nTmb := nFATOR_SOMA_HOMEM + (nMULTI_PESO_HOMEM * VAL(nPeso)) + (nMULTI_ALT_HOMEM * VAL(nAltura)) - (nMULTI_IDADE_HOMEM * VAL(nIdade))
    FwAlertInfo("Sua TMB é: "+ ALLTRIM(STR(nTmb)) + ' Calorias/Dia','TBM')

Return


/*/{Protheus.doc} Static Function TmbMulher
    Receber os três valores inseridos e calcular a TMB da mulher.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nPeso, nAltura, nIdade, nTmb, nFATOR_SOMA_MULHER, nMULTI_PESO_MULHER, nMULTI_ALT_MULHER, nMULTI_IDADE_MULHER
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function TmbMulher(nPeso, nAltura, nIdade)

    Local nTmb := 0

    nTmb := nFATOR_SOMA_MULHER  + (nMULTI_PESO_MULHER * VAL(nPeso)) + (nMULTI_ALT_MULHER * VAL(nAltura)) - (nMULTI_IDADE_MULHER * VAL(nIdade))
    FwAlertInfo("Sua TMB é: "+ ALLTRIM(STR(nTmb)) + ' Calorias/Dia','TBM')

Return
