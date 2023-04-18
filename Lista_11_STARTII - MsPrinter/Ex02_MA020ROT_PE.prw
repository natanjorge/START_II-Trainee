/*� 2 � Adicione um bot�o � tela de Cadastro de
Fornecedores. A fun��o desse bot�o ser� imprimir
os dados do fornecedor selecionado.
Voc� mesmo determinar� quais s�o os campos que
devem ser impressos.
*/

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

User Function MA020ROT()
    Local aRotUser := {}     
	AAdd( aRotUser, { 'Relat�rio', 'U_MSPrinter()', 0, 4 } )
Return aRotUser

/*/{Protheus.doc} User Function MsPrinter
    Relat�rio utilizando FwMSPrinter
    @type  Function
    @author Natan Jorge
    @since 14/04/2023
/*/
User Function MSPrinter()

    //? R�gua de processamento
    Processa({|| MontaRel()}, 'Aguarde...', 'Imprimindo relat�rio...', .F.)

Return

//? Fun��o principal (Cria��o do Relat�rio)
Static Function MontaRel()

    Local cCamPDF    := 'C:\TOTVS\VsCode\Relatorios_L11\'
    Local cArqPDF    := 'Relat_L11_EX02.pdf'

    //? Local aFonts:= GetFontList() - A fun��o GetFontList retorna um array com todos os nomes de ontes dispon�veis. Obs: Nem todas funcionar�o corretamente no Protheus.
    Private dDataGer := Date()
    Private cHoraGer := Time()
    Private nLinha   := 105
    Private nColIni  := 020
    Private nColFim  := 820
    Private oPrint

    //? Criando padr�es de fontes
    Private oFont08  := TFont():New('Arial',/*Compat.*/, 08 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*It�lico*/)
    Private oFont10  := TFont():New('Arial',/*Compat.*/, 10 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*It�lico*/)
    Private oFont12  := TFont():New('Arial',/*Compat.*/, 12 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*It�lico*/)
    Private oFont14  := TFont():New('Arial',/*Compat.*/, 14 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*It�lico*/)
    Private oFont16  := TFont():New('Arial',/*Compat.*/, 16 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .T./*Sublinhado*/, .F./*It�lico*/)
    
    //? Criando objeto de impress�o
    oPrint := FWMSPrinter():New(cArqPDF, IMP_PDF, .F., '', .T.,, @oPrint, '',,,, .T.)
    oPrint:cPathPDF := cCamPDF

    //? Definindo que a orienta��o da p�gina ser� "Retrato"
    oPrint:SetPortrait()
   
    //? Definindo o tamanho da impress�o como A4
    oPrint:setPaperSize(9)
    
    //? Criando nova P�gina
    oPrint:StartPage()
    
    //? Imprime o cabe�alho
    Cabecalho()
    ImpDados()
    
    //? finalizamdo a impress�o
    oPrint:endPage()
    
    //? Mostrando o relat�rio
    oPrint:Preview()

Return

//? Fun��o para imprimir o cabe�alho
Static Function Cabecalho()
    
    oPrint:Box(015, 015, 140, 580, '-8')           //? Criando caixa para colocar texto
    
    oPrint:Line(085, 015, 085, 580, /*Cor*/, '-6') //? Adicionando uma linha horizontal

    oPrint:Line(050, 110, 050, 580, /*Cor*/, '-6') //? Adicionando uma linha horizontal
    
    oPrint:Line(015, 110, 085, 111)                //? Adicionando uma linha vertical

    //? Imprimindo texto do cabe�alho
    oPrint:Say(035, 130, 'Empresa / Filial: ' + AllTrim(SM0->M0_NOME) + ' / ' + AllTrim(SM0->M0_FILIAL), oFont14,, PRETO)
    oPrint:Say(070, 260, 'Cadastro de Fornecedores', oFont16,, PRETO)
    
    //? Imprimindo T�tulo das colunas
    oPrint:Say(nLinha, 20,  'C�DIGO',   oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 80,  'NOME',     oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 290, 'LOJA',     oFont12, /*Width*/, PRETO)
    oPrint:Say(nLinha, 445, 'ENDERE�O', oFont12, /*Width*/, PRETO)

    oPrint:SayBitMap(27, 25, LOGO_TOTVS, 75, 45)

    nLinha += 5
    //? Adicionando uma linha horizontal
    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')
    nLinha += 20 

Return

Static Function ImpDados()

    VeriQuebPg(MAX_LINE)

    oPrint:Say(nLinha, 020, AllTrim(SA2->A2_COD),  oFont10,, PRETO)
    oPrint:Say(nLinha, 080, AllTrim(SA2->A2_NOME), oFont10,, PRETO)
    oPrint:Say(nLinha, 300, AllTrim(SA2->A2_LOJA), oFont10,, PRETO)
    oPrint:Say(nLinha, 450, AllTrim(SA2->A2_END),  oFont10,, PRETO)

    nLinha += 30

Return

Static Function VeriQuebLn(cString, nLineTam, nCol)

    Local cLinha   := ''
    Local lTemQbra := .F.
    Local nQtdLine := MLCount(cString, nLineTam, /*Tab. Size*/, .F.) //? Conta quantas linhas s�o necess�rias para escrever o texto com baso no tamanho de linha estipulado em "nLineTam"
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


