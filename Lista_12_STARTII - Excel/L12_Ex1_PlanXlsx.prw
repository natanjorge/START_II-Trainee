#INCLUDE 'TOTVS.CH'

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
  
  DbSelectArea('SA2')
  SA2->(DbSetOrder(1))
  SA2->(DbGoTop())

  //! Criando nova aba
  oExcel:AddworkSheet('Fornecedores')
  
  //! Adicionando nova tabela
  oExcel:AddTable('Fornecedores', 'Dados dos Fornecedores')

    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Código' ,  LEFT  , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Nome' ,    LEFT  , GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Loja',     CENTER, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'CNPJ',     CENTER, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Endereço', LEFT,   GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Bairro',   LEFT,   GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Cidade',   LEFT,   GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'UF',       CENTER, GERAL)

    while SA2->(!EOF())

      //! Adicionando linhas com dados em cada coluna
      oExcel:AddRow('Fornecedores', 'Dados dos Fornecedores', {(SA2->A2_COD), (SA2->A2_NOME), (SA2->A2_LOJA), TRANSFORM((SA2->A2_CGC),'@R 99.999.999/9999-99'), (SA2->A2_END), (SA2->A2_BAIRRO), (SA2->A2_MUN), (SA2->A2_EST)})
      
      SA2->(DbSkip())
    enddo

  //! Ativando a classe
  oExcel:Activate()

  //! Gerando arquivo físico
  oExcel:GetXMLFile(cPath + cArq)

  //! Verifica se tem o Excel instalado no PC
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
  
  //! Desativando a classe
  oExcel:DeActivate()

Return
