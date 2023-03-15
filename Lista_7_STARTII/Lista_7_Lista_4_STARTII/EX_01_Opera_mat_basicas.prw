#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function EX_01_Opera_mat_basicas
    Ler dois números positivos e apresentar a soma, diferença, produto e quociente entre eles.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Primei_Val, cMsg_Segun_Val, nOpcao, nPrimeiro_Valor, nSegundo_Valor 
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_01_Opera_mat_basicas()

    Local cTitle := 'Soma, diferença, produto e quociente!', cMsg_Primei_Val := 'Insira o primeiro valor: ', cMsg_Segun_Val := 'Insira o segundo valor: '
    Local nOpcao := 0
    Local nPrimeiro_Valor := Space(10), nSegundo_Valor := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cMsg_Primei_Val SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010 SAY    cMsg_Segun_Val  SIZE 55, 07 OF oDlg PIXEL
    @ 010, 070 MSGET  nPrimeiro_Valor SIZE 55, 11 OF oDlg PIXEL
    @ 030, 070 MSGET  nSegundo_Valor  SIZE 55, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Operações'     SIZE 55, 11 OF oDlg PIXEL ACTION Calcula_Valores(nPrimeiro_Valor, nSegundo_Valor)
    @ 030, 140 BUTTON 'Sair'          SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


/*/{Protheus.doc} Static Function Calcula_Valores
    Receber os dois valores inseridos, calcular as operações matemáticas e imprimir na tela.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nPrimeiro_Valor, nSegundo_Valor
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function Calcula_Valores(nPrimeiro_Valor, nSegundo_Valor)

    nPrimeiro_Valor := VAL(nPrimeiro_Valor)
    nSegundo_Valor := VAL(nSegundo_Valor)

    FwAlertInfo('A soma dos números é: '      + ALLTRIM(STR(nPrimeiro_Valor+nSegundo_Valor))+CRLF+;
                'A diferença entre eles é: '  + ALLTRIM(STR(nPrimeiro_Valor-nSegundo_Valor))+CRLF+;
                'O produto entre eles é: '    + ALLTRIM(STR(nPrimeiro_Valor*nSegundo_Valor))+CRLF+;
                'O quociente dos números é: ' + ALLTRIM(STR(nPrimeiro_Valor/nSegundo_Valor)), 'Calculos numéricos')

Return
