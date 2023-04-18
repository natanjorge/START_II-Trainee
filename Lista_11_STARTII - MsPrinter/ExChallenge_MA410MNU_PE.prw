/* • 5 – Também na rotina de Pedidos de Compra,
adicione um novo botão que possibilite gerar um
relatório de todos os pedidos existentes
juntamente com seus respectivos produtos e com
o totalizador do pedido.
Obs: Cada pedido deve ser impresso em uma página,
independente da quantidade de itens. Toda vez
que uma página for iniciada, antes dos dados do
pedido, deve ser impresso o cabeçalho.
Também adicionar o número da página impressa.
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
//Alinhamentos
#Define PAD_LEFT    0
#Define PAD_RIGHT   1
#Define PAD_CENTER  2
#Define PAD_JUSTIFY 3

User Function MA410MNU()

    Local aArea := GetArea()
     
    aadd(aRotina, {"Relatorio", "U_MSPrinter", 0 , 4, 0 , Nil})
     
    RestArea(aArea)
Return

/*/{Protheus.doc} User Function MsPrinter
    Exemplo de relatório utilizando FwMSPrinter
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

    cQuery := 'SELECT SC5.C5_NUM, SC5.C5_FRETE, SC5.C5_DESPESA, SC5.C5_CONDPAG,SC5.C5_TRANSP, SC5.C5_TPFRETE,SC5.C5_ESPECI1, SC5.C5_VOLUME1, SC5.C5_DESC1, SC5.C5_DESC2, SC5.C5_DESC3, SC5.C5_DESC4, SC5.C5_MENNOTA,' + CRLF
    cQuery += 'SA1.A1_NOME, SA1.A1_HPAGE,SA1.A1_EMAIL, SA1.A1_CONTATO,SA1.A1_END, SA1.A1_BAIRRO, SA1.A1_MUN, SA1.A1_CEP, SA1.A1_DDD, SA1.A1_TEL, SA1.A1_FAX, SA1.A1_CGC, SA1.A1_INSCR,' + CRLF
    cQuery += 'SE4.E4_DESCRI,' + CRLF
    cQuery += 'SC6.C6_ITEM, SC6.C6_PRODUTO, SC6.C6_DESCRI, SC6.C6_UM, SC6.C6_QTDVEN, SC6.C6_PRCVEN, SC6.C6_VALOR, SC6.C6_IPITRF, SC6.C6_ENTREG, SC6.C6_DTVALID,' + CRLF
    cQuery += 'SA4.A4_NOME,' + CRLF
    cQuery += 'SA3.A3_NOME FROM ' +  RetSqlName('SC5') + ' SC5' + CRLF
    cQuery += 'INNER JOIN ' + RetSqlName('SA1') + ' SA1 ON SA1.A1_COD = SC5.C5_CLIENTE' + CRLF
    cQuery += 'INNER JOIN ' + RetSqlName('SE4') + ' SE4 ON SE4.E4_CODIGO = SC5.C5_CONDPAG' + CRLF
    cQuery += 'INNER JOIN ' + RetSqlName('SC6') + ' SC6 ON SC6.C6_NUM = SC5.C5_NUM' + CRLF
    cQuery += 'LEFT JOIN '  + RetSqlName('SA4') + ' SA4 ON SA4.A4_COD = SC5.C5_TRANSP' + CRLF
    cQuery += 'LEFT JOIN '  + RetSqlName('SA3') + ' SA3 ON SA3.A3_COD = SC5.C5_VEND1' + CRLF
    cQuery += "WHERE SC5.D_E_L_E_T_ = ' ' AND SC5.C5_NUM = '" + SC5->C5_NUM + "'"


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
    Local cArqPDF    := 'Relat_L11_Challenge.pdf'

    //? Local aFonts:= GetFontList() - A função GetFontList retorna um array com todos os nomes de ontes disponíveis. Obs: Nem todas funcionarão corretamente no Protheus.
    Private dDataGer := Date()
    Private cHoraGer := Time()
    Private nLinha   := 20
    Private nColIni  := 20
    Private nColFim  := 820
    Private oPrint

    //? Criando padrões de fontes
    Private oFont08  := TFont():New('Arial',/*Compat.*/, 08 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont10  := TFont():New('Arial',/*Compat.*/, 10 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont10B := TFont():New('Arial',/*Compat.*/, 10 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont12  := TFont():New('Arial',/*Compat.*/, 12 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont12B := TFont():New('Arial',/*Compat.*/, 12 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont14  := TFont():New('Arial',/*Compat.*/, 14 /*Tamanho*/, /*Compat.*/, .F. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
    Private oFont14B := TFont():New('Arial',/*Compat.*/, 14 /*Tamanho*/, /*Compat.*/, .T. /*Negrito*/,/*Compat.*/,/*Compat.*/,/*Compat.*/,/*Compat.*/, .F./*Sublinhado*/, .F./*Itálico*/)
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
    Cabecalho(cAlias)
    ImpRodape(cAlias)
    ImpDados(cAlias)
    //? finalizamdo a impressão
    oPrint:endPage()
    
    //? Mostrando o relatório
    oPrint:Preview()

Return

//? Função para imprimir o cabeçalho
Static Function Cabecalho(cAlias)
    
    
    oPrint:Box(015, 015, 800, 580, '-8')           //? Criando caixa para colocar texto

    //oPrint:Line(015, 110, 085, 111)                //? Adicionando uma linha vertical

    oPrint:SayBitMap(27, 25, LOGO_TOTVS, 125, 65)

    //? Imprimindo texto do cabeçalho Fornecedor 
    oPrint:SayAlign(nLinha, nColIni, 'TOTVS IP/TM',                                            oFont16,  545,,, PAD_RIGHT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'AV. DR. ANT. CARLOS BARROS, 937 CAMPINAS/SP, 13105-000', oFont14,  545,,, PAD_RIGHT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'E-mail: relatorioteste@totvs.com.br',                    oFont14B, 545,,, PAD_RIGHT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'FONE: (19) 3924-0367 FAX: (19) 3327-6600',               oFont14,  545,,, PAD_RIGHT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'CNPJ: 28.721.054/0001-65 - IE: 100.105.454.555',         oFont14,  545,,, PAD_RIGHT,  ); nLinha += 25
    
    //! Adicionando uma linha horizontal
    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')
    nLinha  += 5
    nColIni += 7
    //? Imprimindo Pedido de venda
    oPrint:SayAlign(nLinha, nColIni, 'PEDIDO DE VENDA Nº '+ AllTrim(C5_NUM),        oFont16, 500,,,  PAD_LEFT,  )
    oPrint:SayAlign(nLinha, nColIni, 'Data: ' + TRANSFORM( dDataGer, "@R 99/99/99" ), oFont16, 538,,, PAD_RIGHT, )

    //! Adicionando uma linha horizontal
    nLinha += 20
    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')
    nLinha += 25

    oPrint:SayAlign(nLinha, nColIni, 'Cliente: ',  oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'E-mail: ',   oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'Endereço: ', oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'Cidade: ',   oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'TEL: ',      oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'CNPJ: ',     oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    
    nLinha -= 90
    nColIni+= 50

    oPrint:SayAlign(nLinha, nColIni,  AllTrim(C5_CLIENTE) + '-' + AllTrim((cAlias)->(A1_NOME)),                                          oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  AllTrim((cAlias)->(A1_EMAIL)),                                                                     oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  AllTrim((cAlias)->(A1_END)),                                                                       oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  AllTrim((cAlias)->(A1_MUN)),                                                                       oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  '(' + AllTrim((cAlias)->(A1_DDD)) + ') ' + TRANSFORM(AllTrim((cAlias)->(A1_TEL)), '@R 9999-9999'), oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  TRANSFORM(AllTrim((cAlias)->(A1_CGC)), '@R 99.999.999/9999-99'),                                   oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15

    nLinha -= 90
    nColIni+= 300
    
    oPrint:SayAlign(nLinha, nColIni, 'Site: ',    oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'Contato: ', oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'Bairro: ',  oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'CEP: ',     oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'FAX: ',     oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni, 'I.E.: ',    oFont12B, 500,,,  PAD_LEFT,  ); nLinha += 15

    nLinha -= 90
    nColIni+= 50

    oPrint:SayAlign(nLinha, nColIni,  AllTrim((cAlias)->(A1_HPAGE)),                                                                     oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  AllTrim((cAlias)->(A1_CONTATO)),                                                                   oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  AllTrim((cAlias)->(A1_BAIRRO)),                                                                    oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  TRANSFORM(AllTrim((cAlias)->(A1_CEP)), '@R 99999-999'),                                            oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  '(' + AllTrim((cAlias)->(A1_DDD)) + ') ' + TRANSFORM(AllTrim((cAlias)->(A1_FAX)), '@R 9999-9999'), oFont12, 500,,,  PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,  AllTrim((cAlias)->(A1_INSCR)),                                                                     oFont12, 500,,,  PAD_LEFT,  ); nLinha += 30


    nColIni -= 400

    //! Adicionando uma linha horizontal
    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')
    nLinha += 5

    oPrint:SayAlign(nLinha, nColIni,  'Item',                  oFont10B, 500,,,  PAD_LEFT,); nColIni += 30
    oPrint:SayAlign(nLinha, nColIni,  'Produto',               oFont10B, 500,,,  PAD_LEFT,); nColIni += 50
    oPrint:SayAlign(nLinha, nColIni,  'Descrição do Produto',  oFont10B, 500,,,  PAD_LEFT,); nColIni += 175
    oPrint:SayAlign(nLinha, nColIni,  'UM',                    oFont10B, 500,,,  PAD_LEFT,); nColIni += 30
    oPrint:SayAlign(nLinha, nColIni,  'Qtd.',                  oFont10B, 500,,,  PAD_LEFT,); nColIni += 35
    oPrint:SayAlign(nLinha, nColIni,  'Prc Unit',              oFont10B, 500,,,  PAD_LEFT,); nColIni += 60
    oPrint:SayAlign(nLinha, nColIni,  'Prc Total',             oFont10B, 500,,,  PAD_LEFT,); nColIni += 60
    oPrint:SayAlign(nLinha, nColIni,  'IPI',                   oFont10B, 500,,,  PAD_LEFT,); nColIni += 42
    oPrint:SayAlign(nLinha, nColIni,  'Data Entrega',          oFont10B, 500,,,  PAD_LEFT,)
   
    //! Adicionando uma linha horizontal
    nLinha += 20
    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')
    nLinha += 5

Return

Static Function ImpDados(cAlias)
    Local nPagAtual := 1, nLinhaInicio := 30, nValorTotal := 0, nRepete := 1, nFrete := C5_FRETE; nDespesa := C5_DESPESA

    DbSelectArea(cAlias)
    
    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())

        if nRepete > 1
            nLinhaInicio := 0
        endif

        nColIni -= 482

        VeriQuebPg(MAX_LINE)

        oPrint:SayAlign(nLinha, nColIni,  AllTrim(C6_ITEM),    oFont10, 500,,,  PAD_LEFT,); nColIni += 30
        oPrint:Line(nLinha-nLinhaInicio, nColIni-7, (nLinha+20), nColIni-7)                //? Adicionando uma linha vertical
    
        oPrint:SayAlign(nLinha, nColIni,  AllTrim(C6_PRODUTO), oFont10, 500,,,  PAD_LEFT,); nColIni += 50
        oPrint:Line(nLinha-nLinhaInicio, nColIni-10, (nLinha+20), nColIni-10)                //? Adicionando uma linha vertical

        oPrint:SayAlign(nLinha, nColIni,  AllTrim(C6_DESCRI),  oFont10, 500,,,  PAD_LEFT,); nColIni += 175
        oPrint:Line(nLinha-nLinhaInicio, nColIni-7, (nLinha+20), nColIni-7)                //? Adicionando uma linha vertical

        oPrint:SayAlign(nLinha, nColIni,  AllTrim(C6_UM),      oFont10, 500,,,  PAD_LEFT,); nColIni += 35
        oPrint:Line(nLinha-nLinhaInicio, nColIni-10, (nLinha+20), nColIni-10)                //? Adicionando uma linha vertical

        oPrint:SayAlign(nLinha, nColIni,  AllTrim(STR(C6_QTDVEN)),  oFont10, 500,,,  PAD_LEFT,); nColIni += 30
        oPrint:Line(nLinha-nLinhaInicio, nColIni-10, (nLinha+20), nColIni-10)                //? Adicionando uma linha vertical
        
        oPrint:SayAlign(nLinha, nColIni, 'R$ ' + AllTrim(STR(C6_PRCVEN,,2)),  oFont10, 500,,,  PAD_LEFT,); nColIni += 60
        oPrint:Line(nLinha-nLinhaInicio, nColIni-7, (nLinha+20), nColIni-7)                //? Adicionando uma linha vertical
        
        oPrint:SayAlign(nLinha, nColIni, 'R$ ' + AllTrim(STR(C6_VALOR,,2)),   oFont10, 500,,,  PAD_LEFT,); nColIni += 60
        oPrint:Line(nLinha-nLinhaInicio, nColIni-15, (nLinha+20), nColIni-15)                //? Adicionando uma linha vertical

        oPrint:SayAlign(nLinha, nColIni,  AllTrim(STR(C6_IPITRF,,1)),  oFont10, 500,,,  PAD_LEFT,); nColIni += 47
        oPrint:Line(nLinha-nLinhaInicio, nColIni-15, (nLinha+20), nColIni-15)                //? Adicionando uma linha vertical

        oPrint:SayAlign(nLinha, nColIni,  Transform((STOD(C6_ENTREG)), '@R 99/99/9999'),  oFont10, 500,,,  PAD_LEFT,); nColIni -= 5

        nLinha += 20
        nRepete++
        nValorTotal += (C6_VALOR) //? soma dos valores totais 

        (cALias)->(DbSkip())

    enddo

    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')

    nColIni -= 482
    nLinha += 10

    oPrint:SayAlign(nLinha, 400, 'Valor Frete:',   oFont12,  475,,, PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, 400, 'Valor Despesa:', oFont12,  475,,, PAD_LEFT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, 400, 'Valor Total:',   oFont12B, 475,,, PAD_LEFT,  ); nLinha -= 30
 
    oPrint:SayAlign(nLinha, nColIni,'R$ ' + (AllTrim(STR(nFrete,,2))),                        oFont12,  525,,, PAD_RIGHT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,'R$ ' + (AllTrim(STR(nDespesa,,2))),                      oFont12,  525,,, PAD_RIGHT,  ); nLinha += 15
    oPrint:SayAlign(nLinha, nColIni,'R$ ' + (AllTrim(STR((nValorTotal+nDespesa+nFrete),,2))), oFont12B, 525,,, PAD_RIGHT,  )

    nLinha += 20

    oPrint:SayAlign(820, 0,'Página: '+ (AllTrim(STR(nPagAtual))), oFont12,  580,,, PAD_RIGHT,  )
    nPagAtual++

    oPrint:Line(nLinha, 015, nLinha, 580, /*Cor*/, '-6')

    (cAlias)->(DbCloseArea())

Return

Static Function ImpRodape(cAlias)

    Local nLinhaRoda := 675
    Local nColRoda   := 27

    //! Adicionando uma linha horizontal
    nLinhaRoda += 20
    oPrint:Line(nLinhaRoda, 015, nLinhaRoda, 580, /*Cor*/, '-6')

    nLinhaRoda += 5
    oPrint:SayAlign(nLinhaRoda, 0, 'Informações Gerais', oFont14B, 600,,,  PAD_CENTER,  )
    nLinhaRoda += 20

    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Forma de Pagamento  ', oFont12B, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Transportadora ',      oFont12B, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Espécie ',             oFont12B, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Volume ',              oFont12B, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Descontos ',           oFont12B, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10

    nLinhaRoda -= 50
    nColRoda+= 105

    oPrint:SayAlign(nLinhaRoda, nColRoda,  ': '  + AllTrim((SE4->E4_DESCRI)),                                                                                                                                 oFont12, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda,  ': (' + AllTrim((SA4->A4_COD)) + ') ' + AllTrim((SA4->A4_NOME)),                                                                                                   oFont12, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda,  ': '  + AllTrim((SC5->C5_ESPECI1)),                                                                                                                                oFont12, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda,  ': '  + AllTrim(STR(SC5->C5_VOLUME1)),                                                                                                                             oFont12, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda,  ': '  + AllTrim(STR(SC5->C5_DESC1,,2)) + ' + ' + AllTrim(STR(SC5->C5_DESC2,,2)) + ' + ' + AllTrim(STR(SC5->C5_DESC3,,2)) + ' + ' + AllTrim(STR(SC5->C5_DESC4,,2)), oFont12, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10

    nLinhaRoda -= 30
    nColRoda+= 150
    
    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Tipo Frete ', oFont12B, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Vendedor ',   oFont12B, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Validade ',   oFont12B, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10

    nLinhaRoda -= 30
    nColRoda+= 50

    oPrint:SayAlign(nLinhaRoda, nColRoda,  ': '  + AllTrim((SC5->C5_TPFRETE)),                              oFont12, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda,  ': (' + AllTrim((SA3->A3_COD)) + ') ' + AllTrim((SA3->A3_NOME)), oFont12, 500,,,  PAD_LEFT,  ); nLinhaRoda += 10
    oPrint:SayAlign(nLinhaRoda, nColRoda,  ': 17/04/2023',                                                  oFont12, 500,,,  PAD_LEFT,  ); nLinhaRoda += 15

    nColRoda := 27
    //! Adicionando uma linha horizontal
    oPrint:Line(nLinhaRoda, 015, nLinhaRoda, 580, /*Cor*/, '-6')
    nLinhaRoda += 5

    oPrint:SayAlign(nLinhaRoda, nColRoda, 'Mensagem: ',                 oFont12B, 500,,,  PAD_LEFT,  ); nColRoda += 55
    oPrint:SayAlign(nLinhaRoda, nColRoda,   AllTrim((SC5->C5_MENNOTA)), oFont12, 500,,,  PAD_LEFT,  )

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
