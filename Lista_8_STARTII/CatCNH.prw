#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} CatCNH
    Categorias de CNH
    @type  Function
    @author Natan Jorge
    @since 17/03/2023
    /*/
User Function CatCNH()
    
    Local cAlias := 'ZZ3'
    Local cTitle := 'Categorias de CNH'
    Local oBrowse

    oBrowse := FwMBrowse():New() //! oBrowse rebene a rotina FwMBrowse.

    oBrowse:SetAlias(cAlias) //! 'Seta' a tabela SA1

    oBrowse:SetDescription(cTitle) //! Descri��o da tela

    oBrowse:DisableReport()  //! Desabilita relat�rio
    oBrowse:DisableDetails() //! Desabilita os detalhes na parte inferior

    oBrowse:Activate()       //! Ativa o Browse.
    
Return 
 

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF' OPERATION 5 ACCESS 0

Return FWMVCMenu('CatCNH')
 


Static Function ModelDef()
    
    Local oStruZZ3  := FWFormStruct(1, 'ZZ3')        //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
    Local bModelPos := {|oModel| ValidPos(oModel)}   //! Bloco de c�digo que ser� chamado na P�s-valida��o (MODELPOS)
    Local aGatilho  := FwStruTrigger('ZZ3_CODVEI', 'ZZ3_NOME', 'ZZ4->ZZ4_NOME', .T., 'ZZ4', 1, 'xFilial("ZZ4")+AllTrim(M->ZZ3_CODVEI)')

    Local oModel    := MPFormModel():New('CatCNHM', , bModelPos, /*MODELCOMITTTS*/, )

    oStruZZ3:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

    oModel:AddFields('ZZ3MASTER', /*cOwner*/, oStruZZ3, , /*bFieldPos*/, /*bLoad*/)

    oStruZZ3:SetProperty('ZZ3_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZZ3", "ZZ3_COD")'))

    oModel:SetDescription('Categorias de CNH')

    oModel:GetModel('ZZ3MASTER'):SetDescription('Formul�rio das categorias de CNH')

    oModel:SetPrimaryKey({'ZZ3_COD'})

Return oModel


Static Function ViewDef()

    Local oModel    := FwLoadModel('CatCNH')     //! Carregando o modelo
    Local oStruZZ3  := FWFormStruct(2, 'ZZ3')   //! Agora com o par�metro '2'
    Local oView     := FwFormView():New()       //! Cria��o de formul�rio do tipo FormField, onde � poss�vel que o usu�rio edite um registro por vez - Cria��o de formul�rio do tipo FormGrid, onde � poss�vel que o usu�rio edite N registros por vez - Cria��o de bot�es - Divis�o da tela em diversos paineis - Cria��o de Folder

    
    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model

    oView:AddField('VIEW_ZZ3', oStruZZ3, 'ZZ3MASTER') //! Adiciona um campo a estrutura.

    oView:CreateHorizontalBox('TELA', 100)            //! Tela e quantos por cento ela ocupar�

    oView:SetFieldAction('ZZ3_COD', {|oView| ValidField(oView)})
    
    oView:SetOwnerView('VIEW_ZZ3', 'TELA')

Return oView


Static Function ValidPos(oModel)

    Local nOperation  := oModel:GetOperation()
    Local cConteudo   := ALLTRIM(oModel:GetValue('ZZ3MASTER','ZZ3_SIGLA'))
    Local lAutorizado := .T.
    
    if nOperation == 3 .AND. LEN(cConteudo) == 2
        
        lAutorizado := .F.
        Help(NIL, NIL, "ERRO SIGLA!", NIL, "Sigla incorreta!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Informe a sigla com 1 ou 3 caracteres"})
   
    endif

Return lAutorizado
