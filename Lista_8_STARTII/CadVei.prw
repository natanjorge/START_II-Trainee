#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} CadVei
    Exemplo do uso da classe FWMBrowse
    @type  Function
    @author Natan Jorge
    @since 17/03/2023
    /*/
User Function CadVei()
    
    Local cAlias := 'ZZ4'
    Local cTitle := 'Cadastro de Veiculos'
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

Return FWMVCMenu('CadVei')
 

Static Function ModelDef()
    
    Local oModel   := MPFormModel():New('CadVeiM') //! precisa colocar o M no final
    Local oStruZZ4 := FWFormStruct(1, 'ZZ4') //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.

    oModel:AddFields('ZZ4MASTER', /*PAI!*/, oStruZZ4)

    oModel:SetDescription('Modelo de Cadastro de Veiculos')

    oModel:GetModel('ZZ4MASTER'):SetDescription('Formul�rio de Cadastro de Veiculos')

    oModel:SetPrimaryKey({'ZZ4_COD'})

Return oModel


Static Function ViewDef()

    Local oModel    := FwLoadModel('CadVei')     //! Carregando o modelo
    Local oStruZZ4  := FWFormStruct(2, 'ZZ4')   //! Agora com o par�metro '2'
    Local oView     := FwFormView():New()       //! Cria��o de formul�rio do tipo FormField, onde � poss�vel que o usu�rio edite um registro por vez - Cria��o de formul�rio do tipo FormGrid, onde � poss�vel que o usu�rio edite N registros por vez - Cria��o de bot�es - Divis�o da tela em diversos paineis - Cria��o de Folder

    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model

    oView:AddField('VIEW_ZZ4', oStruZZ4, 'ZZ4MASTER') //! Adiciona um campo a estrutura.

    oView:CreateHorizontalBox('TELA', 100)            //! Tela e quantos por cento ela ocupar�

    oView:SetOwnerView('VIEW_ZZ4', 'TELA')

Return oView
