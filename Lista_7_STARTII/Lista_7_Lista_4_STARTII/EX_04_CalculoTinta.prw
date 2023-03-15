#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function EX_02_Convesao_Moedas
    O programa calcula a quantidade de tinta necessária para pintar uma parede.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Largura, cMsg_Altura, nOpcao, nLargura, nAltura 
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CalculoTinta()

    Local cTitle := 'Calculo da área', cMsg_Largura := 'Informe a largura da parede em m²: ', cMsg_Altura := 'Informe a altura da parede em m²: '
    Local nOpcao := 0 
    Local nLargura := Space(10), nAltura := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cMsg_Largura SIZE 90, 12 OF oDlg PIXEL
    @ 030, 010 SAY    cMsg_Altura  SIZE 90, 12 OF oDlg PIXEL
    @ 010, 100 MSGET  nLargura     SIZE 35, 11 OF oDlg PIXEL
    @ 030, 100 MSGET  nAltura      SIZE 35, 11 OF oDlg PIXEL  
    @ 010, 140 BUTTON 'Calcular'   SIZE 55, 11 OF oDlg PIXEL ACTION Calcula_Area(nLargura, nAltura)
    @ 030, 140 BUTTON 'Sair'       SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function Calcula_Area
    Receber os dois valores inseridos, calcula e os apresenta.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param nLargura, nAltura
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function Calcula_Area(nLargura, nAltura)

    FwAlertInfo('A área da parede é ' + ALLTRIM(STR((VAL(nLargura)*((VAL(nAltura)),8,2))))   + ' m²' + CRLF +;
                'Serão necessários '  + ALLTRIM(STR((VAL(nLargura)*((VAL(nAltura)),8,2))/2)) + ' litros de tinta', 'Quantidade de tinta')

Return
