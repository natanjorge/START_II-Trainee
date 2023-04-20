#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

#DEFINE LEFT      1
#DEFINE CENTER    2
#DEFINE RIGHT     3
#DEFINE GERAL     1
#DEFINE NUMERO    2
#DEFINE MONETARIO 3
#DEFINE DATETIME  4

/*/{Protheus.doc} User Function PlanXlsx
  Exemplo de criação de planilha com a classe FwMsExelXlsx 
  @type  Function
  @author Natan Jorge
  @since 12/04/2023
  /*/
User Function PlanXlsx()
  Local oExcel := FwMsExcelEx():New() //? Instanciando a classe para criação da planilha
  Local cPath  := 'C:\TOTVS\VsCode' //? Local onde quer salvar o arquivo
  Local cArq   := 'Teste_Excel.xls' //? nome do arquivo
  Local cQuery := ''
  Local cAlias := 'SB1'

  rpcsetenv("99", "01")

  cQuery := "SELECT B1_COD, B1_DESC, B1_TIPO, B1_UM, B1_PRV1, D_E_L_E_T_ AS deletado FROM " + RetSqlName('SB1')

  TCQUERY cQuery ALIAS (cAlias)

  (cAlias)->(DbGoTop())

  oExcel:AddworkSheet('Fornecedores')
  oExcel:AddTable('Fornecedores', 'Dados dos Fornecedores')
  oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Código' ,        LEFT  , GERAL)
  oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Descrição' ,     LEFT  , GERAL)
  oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Tipo',           CENTER, GERAL)
  oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Uni. de Med.',   CENTER, GERAL)
  oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Preço de venda', CENTER, MONETARIO)

  oExcel:SetCelFrColor('#FF0000')

    while (cAlias)->(!EOF())

      if (cAlias)->(deletado) == '*'
        oExcel:AddRow('Fornecedores', 'Dados dos Fornecedores', {(cAlias)->(B1_COD), (cAlias)->(B1_DESC), (cAlias)->(B1_TIPO), (cAlias)->(B1_UM), (cAlias)->(B1_PRV1)}, {1,2,3,4,5})
      else
        oExcel:AddRow('Fornecedores', 'Dados dos Fornecedores', {(cAlias)->(B1_COD), (cAlias)->(B1_DESC), (cAlias)->(B1_TIPO), (cAlias)->(B1_UM), (cAlias)->(B1_PRV1)})
      endif

      (cAlias)->(DbSkip())
    enddo

  oExcel:Activate()
  oExcel:GetXMLFile(cPath + cArq)

  if ApOleClient('MsExcel')
    oExec := MsExcel():New()
    oExec:WorkBooks:Open(cPath + cArq)
    oExec:SetVisible(.T.)
    oExec:Destroy()
    cMsgTitle := 'Planilha gerada com sucesso!'
    cMsg      := 'Arquivo salvo em: ' + cPath + cArq
    FwAlertSuccess(cMsg, 'Tudo certo!')
  else
    cMsg := 'Microsoft Excel não encontrado!' + CRLF
    cMsg += 'Arquivo salvo em: ' + cPath + cArq
    FwAlertError(cMsg, 'Atenção!')
  endif

  oExcel:DeActivate()
  (cAlias)->(DBCLOSEAREA())
Return
