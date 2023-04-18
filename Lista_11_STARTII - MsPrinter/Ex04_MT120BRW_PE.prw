/*• 4 – Adicione um totalizador ao relatório gerado no
exercício anterior. Esse totalizador deve conter
o valor total da compra, ou seja, a soma do valor
total de cada item. */

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

//? Cores
#DEFINE PRETO    RGB(000, 000, 000)
#DEFINE VERMELHO RGB(255, 000, 000)

#DEFINE PAD_RIGHT 1
#DEFINE MAX_LINE  770

#DEFINE LOGO_TOTVS 'C:\TOTVS\RELATORIOS_IMAGENS\logo-totvs.png'

User Function MT120BRW()   
	AAdd( aRotina, { 'Relatorio', "U_MSPrinter)", 0, 4 } )
Return

/*/{Protheus.doc} User Function MsPrinter
    Relatório utilizando MSPrinter
    @type  Function
    @author Natan Jorge
    @since 14/04/2023
/*/
User Function MSPrinter()

    Local cAlias := GeraCons()

    if !Empty(cAlias)

        //? Régua de processamento
	    Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'Imprimindo relatório...', .F.)

    else 
        FwAlertError('Nenhum Registro encontrado!', 'Atenção')
    endif
Return

Static Function GeraCons()

    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    
    cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF
    cQuery += " AND C7_NUM = '" + SC7->C7_NUM + " '"

    TCQUERY cQuery ALIAS (cAlias) NEW

    (cAlias)->(DbGoTop())

    if (cAlias)->(EOF())
       cAlias := '' 
    endif
    
    RestArea(aArea)

Return cAlias

//? Função principal (Criação do Relatório)
Static Function MontaRel(cAlias)

    Local cCamPDF    := 'C:\TOTVS\VsCode\Relatorios_L11\'
    Local cArqPDF    := 'Relat_L11_EX04.pdf'

    //? Local aFonts:= GetFontList() - A função GetFontList retorna um array com todos os nomes de ontes disponíveis. Obs: Nem todas funcionarão corretamente no Protheus.
    Private dDataGer := Date()
    Private cHoraGer := Time()
    Private nLinha   := 105
    Private nColIni  := 020
    Private nColFim  := 820
    Private oPrint

    //? Criando padrões de fontes
    Private oFont08  := TFont():New('Arial',/*Compat.*/, 08 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont10  := TFont():New('Arial',/*Compat.*/, 10 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont12  := TFont():New('Arial',/*Compat.*/, 12 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont14  := TFont():New('Arial',/*Compat.*/, 14 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont16  := TFont():New('Arial',/*Compat.*/, 16 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .T./*Sublinhado*/, .F./*Itálico*/)
    
    //? Criando objeto de impressão
    oPrint := FWMSPrinter():New(cArqPDF, IMP_PDF, .F., '', .T.,, @oPrint, '',,,, .T.)
    oPrint:cPathPDF := cCamPDF

    //? Definindo que a orientação da página será "Retrato"
    oPrint:SetPortrait()
   
    //? Definindo o tamanho da impressão como A4
    oPrint:setPaperSize(9)
    
    //? Criando nova Página
    oPrint:StartPage()
    
    //? Imprime o cabeçalho
    Cabecalho()
    ImpDados(cAlias)
    
    //? finalizamdo a impressão
    oPrint:endPage()
    
    //? Mostrando o relatório
    oPrint:Preview()

Return

//? Função para imprimir o cabeçalho
Static Function Cabecalho(cAlias)
    
    Local nCont := 0

    oPrint:Box(015, 015, 800, 580, '-8')           //? Criando caixa para colocar texto
    
    oPrint:Line(085, 015, 085, 580, /*Cor*/, '-6') //? Adicionando uma linha horizontal

    oPrint:Line(050, 110, 050, 580, /*Cor*/, '-6') //? Adicionando uma linha horizontal
    
    oPrint:Line(015, 110, 085, 111)                //? Adicionando uma linha vertical

    oPrint:SayBitMap(27, 25, LOGO_TOTVS, 75, 45)

    //? Imprimindo texto do cabeçalho
    oPrint:Say(035, 130, 'Empresa / Filial: ' + AllTrim(SM0->M0_NOME) + ' / ' + AllTrim(SM0->M0_FILIAL), oFont14,, PRETO)
    oPrint:Say(070, 260, 'Cadastro de Fornecedores', oFont16,, PRETO)
    
    //? Imprimindo Título das colunas
    oPrint:Say(nLinha, 20,  'Nº DO PEDIDO',    oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 110, 'DATA DE EMISSÃO', oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 220, 'COD. FORNECEDOR', oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 345, 'LOJA FORNECEDOR', oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 470, 'COND. PAGAMENTO', oFont12, /*Width*/, PRETO)
    
    //? Adicionando uma linha horizontal
    oPrint:Line(140, 015, 140, 580, /*Cor*/, '-6')

    if nCont == 0
        oPrint:Say(160, 20,  'COD. PEDIDO',    oFont12, /*Width*/, PRETO)
        oPrint:Say(160, 105, 'DESC. PEDIDO',   oFont12, /*Width*/, PRETO)
        oPrint:Say(160, 250, 'QTDE. VENDIDA',  oFont12, /*Width*/, PRETO)
        oPrint:Say(160, 360, 'VALOR UNITÁRIO', oFont12, /*Width*/, PRETO)
        oPrint:Say(160, 485, 'VALOR TOTAL',    oFont12, /*Width*/, PRETO)

        nCont++
    endif

    //? Adicionando uma linha horizontal
    oPrint:Line(165, 015, 165, 580, /*Cor*/, '-6')

    nLinha += 5
    //? Adicionando uma linha horizontal
    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')
    nLinha += 20 

Return

Static Function ImpDados(cAlias)

    Local nValorTotal := 0

    VeriQuebPg(MAX_LINE)

    oPrint:Say(nLinha, 020, AllTrim(SC7->C7_NUM),         oFont10,, PRETO)
    oPrint:Say(nLinha, 130, Transform((SC7->C7_EMISSAO), "@R 99/99/9999"), oFont10,, PRETO)
    oPrint:Say(nLinha, 250, AllTrim(SC7->C7_FORNECE),     oFont10,, PRETO)
    oPrint:Say(nLinha, 390, AllTrim(SC7->C7_LOJA),        oFont10,, PRETO)
    oPrint:Say(nLinha, 505, AllTrim(SC7->C7_COND),        oFont10,, PRETO)

    nLinha += 60

    DbSelectArea(cAlias)
    
    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())

        VeriQuebPg(MAX_LINE)

        oPrint:Say(nLinha, 020,          AllTrim((cALias)->(C7_PRODUTO)),        oFont10,, PRETO)
        oPrint:Say(nLinha, 105,          AllTrim((cALias)->(C7_DESCRI)),         oFont10,, PRETO)
        oPrint:Say(nLinha, 280,          AllTrim(STR((cAlias)->(C7_QUANT))),  oFont10,, PRETO)
        oPrint:Say(nLinha, 390, ('R$ ' + AllTrim(STR((cAlias)->(C7_PRECO),,2))), oFont10,, PRETO)
        oPrint:Say(nLinha, 505, ('R$ ' + AllTrim(STR((cAlias)->(C7_TOTAL),,2))), oFont10,, PRETO)
        
        nLinha += 30

        nValorTotal += ((cAlias)->(C7_TOTAL)) //? soma dos valores totais 

        (cALias)->(DbSkip())

    enddo

    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')

    nLinha += 20

    oPrint:Say(nLinha, 420, ('VALOR TOTAL: R$ ' + AllTrim(STR(nValorTotal,,2))), oFont12,, PRETO)

    nLinha += 20

    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')

    (cAlias)->(DbCloseArea())

Return

Static Function VeriQuebLn(cString, nLineTam, nCol)

    Local cLinha   := ''
    Local lTemQbra := .F.
    Local nQtdLine := MLCount(cString, nLineTam, /*Tab. Size*/, .F.) //? Conta quantas linhas são necessárias para escrever o texto com baso no tamanho de linha estipulado em "nLineTam"
    Local nI       := 1

    if nQtdLine > 1
        lTemQbra := .T.
        for nI := 1 to nQtdLine
            cLinha := MemoLine(cString, nLineTam, nI) 
            oPrint:Say(nLinha, nCol, cLinha, oFont10,, nCor)
            nLinha += 10
        next
    else
        oPrint:Say(nLinha, nCol, cString, oFont10,, nCor)
    endif

    if lTemQbra
        nLinha -= nQtdLine * 10 
    endif
Return

Static Function VeriQuebPg(nMax)

    if nLinha > nMax

        oPrint:EndPage()

        oPrint:StartPage()
        nLinha := 105
        
        Cabecalho()
    endif

Return


