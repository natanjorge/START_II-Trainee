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
  Local cAlias := GetNextAlias()
  Local cPedidoAnt := ''

  rpcsetenv("99", "01")

  cQuery := "SELECT ZZB.ZZB_COD, ZZB.ZZB_NOME, ZZ2.ZZ2_DATNAS, ZZ1.ZZ1_COD, ZZ1.ZZ1_CURSO FROM " + RetSqlName('ZZ1') + ' ZZ1 ' + CRLF
  cQuery += 'LEFT JOIN ' + RetSqlName('ZZB') + " ZZB ON ZZB.ZZB_CURSO = ZZ1.ZZ1_COD AND ZZB.D_E_L_E_T_=' '" + CRLF
  cQuery += 'LEFT JOIN ' + RetSqlName('ZZ2') + " ZZ2 ON ZZ2.ZZ2_COD = ZZB.ZZB_COD AND ZZ2.D_E_L_E_T_=' '" + CRLF
  cQuery += "WHERE ZZ1.D_E_L_E_T_=' '" + CRLF
  cQuery += "ORDER BY ZZ1.ZZ1_COD"

  TCQUERY cQuery ALIAS (cAlias)

  (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())

      if((cAlias)->(ZZ1_COD)<>cPedidoAnt)
        oExcel:AddworkSheet((cAlias)->(ZZ1_CURSO))
        oExcel:AddTable((cAlias)->(ZZ1_CURSO), 'Dados dos Alunos')
        oExcel:AddColumn((cAlias)->(ZZ1_CURSO), 'Dados dos Alunos', 'Código' ,         LEFT  , GERAL)
        oExcel:AddColumn((cAlias)->(ZZ1_CURSO), 'Dados dos Alunos', 'Nome' ,           LEFT  , GERAL)
        oExcel:AddColumn((cAlias)->(ZZ1_CURSO), 'Dados dos Alunos', 'Data Nascimento', CENTER, DATETIME)
        oExcel:AddColumn((cAlias)->(ZZ1_CURSO), 'Dados dos Alunos', 'Curso',           LEFT, GERAL)
      endif
      cPedidoAnt := ((cAlias)->(ZZ1_COD))

    oExcel:AddRow((cAlias)->(ZZ1_CURSO), 'Dados dos Alunos', {(cAlias)->(ZZB_COD), (cAlias)->(ZZB_NOME), StoD((cAlias)->(ZZ2_DATNAS)), (cAlias)->(ZZ1_CURSO)})

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
