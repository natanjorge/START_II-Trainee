#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} InstMVC
    Exemplo do uso da classe FWMBrowse
    @type  Function
    @author Natan Jorge
    @since 17/03/2023
    /*/
User Function VizCAT()

    Local cAlias  := 'ZZ3'
    Local cTitle  := 'Vizualizar cadastros'
    Local oBrowse := FwMBrowse():New() //! oBrowse rebene a rotina FwMBrowse.

    oBrowse:SetAlias(cAlias)       //! 'Seta' a tabela SA1
    oBrowse:SetDescription(cTitle) //! Descri��o da tela
    oBrowse:DisableDetails()       //! Desabilita os detalhes na parte inferior
    oBrowse:DisableReport()        //! Desabilita relat�rio
    oBrowse:Activate()             //! Ativa o Browse.
    
Return 


Static Function MenuDef()

    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.VizCAT' OPERATION 2 ACCESS 0

Return aRotina
 

Static Function ModelDef()
    
    Local oModel    := MPFormModel():New('VizCATM')
    Local oStruZZ3  := FWFormStruct(1, 'ZZ3')        //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
    Local oStruZZ5  := FWFormStruct(1, 'ZZ5')
    Local oStruZZ6  := FWFormStruct(1, 'ZZ6')

    oModel:AddFields('ZZ3MASTER', /*cOwner*/, oStruZZ3)
    oModel:AddGrid('ZZ5DETAIL', 'ZZ3MASTER', oStruZZ5)
    oModel:AddGrid('ZZ6DETAIL', 'ZZ5DETAIL', oStruZZ6)

    oModel:SetDescription('Vizualizar cadastros')
    oModel:GetModel('ZZ3MASTER'):SetDescription('Categorias')
    oModel:GetModel('ZZ5DETAIL'):SetDescription('Instrutores')
    oModel:GetModel('ZZ6DETAIL'):SetDescription('Alunos')

    oModel:SetRelation('ZZ5DETAIL', {{'ZZ5_FILIAL', 'xFilial("ZZ5")'}, {'ZZ5_CATEGO', 'ZZ3_COD'}}, ZZ5->(IndexKey(1)))
    oModel:SetRelation('ZZ6DETAIL', {{'ZZ6_FILIAL', 'xFilial("ZZ6")'}, {'ZZ6_CODINS', 'ZZ5_COD'}}, ZZ6->(IndexKey(1)))

    oModel:SetPrimaryKey({'ZZ3_COD','ZZ5_COD','ZZ6_COD'})

Return oModel


Static Function ViewDef()

    Local oModel    := FwLoadModel('VizCAT')     //! Carregando o modelo
    Local oStruZZ3  := FWFormStruct(2, 'ZZ3')        //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
    Local oStruZZ5  := FWFormStruct(2, 'ZZ5')
    Local oStruZZ6  := FWFormStruct(2, 'ZZ6')
    Local oView     := FwFormView():New()       //! Cria��o de formul�rio do tipo FormField, onde � poss�vel que o usu�rio edite um registro por vez - Cria��o de formul�rio do tipo FormGrid, onde � poss�vel que o usu�rio edite N registros por vez - Cria��o de bot�es - Divis�o da tela em diversos paineis - Cria��o de Folder

    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model
    oView:AddField('VIEW_ZZ3', oStruZZ3, 'ZZ3MASTER') //! Adiciona um campo a estrutura.
    oView:AddGrid('VIEW_ZZ5', oStruZZ5, 'ZZ5DETAIL')
    oView:AddGrid('VIEW_ZZ6', oStruZZ6, 'ZZ6DETAIL')

    oView:CreateHorizontalBox('CATEGORIAS', 30)            //! Tela e quantos por cento ela ocupar�
    oView:CreateHorizontalBox('INSTRUTORES', 35) 
    oView:CreateHorizontalBox('ALUNOS', 35) 

    oView:SetOwnerView('VIEW_ZZ3', 'CATEGORIAS')
    oView:SetOwnerView('VIEW_ZZ5', 'INSTRUTORES')
    oView:SetOwnerView('VIEW_ZZ6', 'ALUNOS')

    oView:EnableTitleView('VIEW_ZZ3', 'Categorias')
    oView:EnableTitleView('VIEW_ZZ5', 'Instrutores')
    oView:EnableTitleView('VIEW_ZZ6', 'Alunos')

Return oView
