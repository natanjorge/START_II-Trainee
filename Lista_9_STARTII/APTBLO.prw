/*� 1 � Desenvolva uma rotina em MVC com uma
estrutura Pai x Filho (Componente de Formul�rio
(AddFields) e Componente de Grid (AddGrid)).
Essa rotina ser� utilizada para organizar os
cadastros de propriet�rios de apartamentos de
um condom�nio.
Ser� necess�rio cadastrar o bloco e quais s�o os
apartamentos existentes nesse bloco, junto com o
nome e CPF de seus respectivos propriet�rios.
Na rotina, ao selecionar um bloco, deve ser
poss�vel visualizar todos os apartamentos desse
bloco com o nome de seus respectivos
propriet�rios.*/

                                            
#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} APTBLO
    Rotina de cadastro de apartamentos com rela��o aos blocos.
    @type  Function
    @author Natan Jorge
    @since 17/03/2023
    /*/
User Function APTBLO()

    Local cAlias  := 'ZZD'
    Local cTitle  := 'TODO LIST'
    Local oBrowse := FwMBrowse():New() //! oBrowse rebene a rotina FwMBrowse.

     oBrowse:SetAlias(cAlias)       //! 'Seta' a tabela SA1
    oBrowse:SetDescription(cTitle) //! Descri��o da tela
    oBrowse:DisableDetails()       //! Desabilita os detalhes na parte inferior
    oBrowse:DisableReport()        //! Desabilita relat�rio
    oBrowse:Activate()             //! Ativa o Browse.
    
Return 


Static Function MenuDef()

    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.APTBLO' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.APTBLO' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.APTBLO' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.APTBLO' OPERATION 5 ACCESS 0

Return aRotina
 

Static Function ModelDef()
    
    Local oStruZZD   := FWFormStruct(1, 'ZZD')        //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
    Local oStruZZE   := FWFormStruct(1, 'ZZE')

    Local oModel    := MPFormModel():New('APTBLOM')

    oModel:AddFields('ZZDMASTER', /*cOwner*/, oStruZZD)
    oModel:AddGrid('ZZEDETAIL', 'ZZDMASTER', oStruZZE)

    oModel:SetDescription('Vizualizar cadastros')
    oModel:GetModel('ZZDMASTER'):SetDescription('Categorias')
    oModel:GetModel('ZZEDETAIL'):SetDescription('Instrutores')

    oModel:SetPrimaryKey({'ZZD_COD','ZZE_COD'})


Return oModel


Static Function ViewDef()

    Local oModel    := FwLoadModel('APTBLO')     //! Carregando o modelo
    Local oStruZZD  := FWFormStruct(2, 'ZZD')        //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
    Local oStruZZE  := FWFormStruct(2, 'ZZE')
    Local oView     := FwFormView():New()       //! Cria��o de formul�rio do tipo FormField, onde � poss�vel que o usu�rio edite um registro por vez - Cria��o de formul�rio do tipo FormGrid, onde � poss�vel que o usu�rio edite N registros por vez - Cria��o de bot�es - Divis�o da tela em diversos paineis - Cria��o de Folder

    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model
    oView:AddField('VIEW_ZZD', oStruZZD, 'ZZDMASTER') //! Adiciona um campo a estrutura.
    oView:AddGrid('VIEW_ZZE', oStruZZE, 'ZZEDETAIL')

    oView:CreateHorizontalBox('CATEGORIAS', 50)            //! Tela e quantos por cento ela ocupar�
    oView:CreateHorizontalBox('INSTRUTORES', 50) 

    oView:SetOwnerView('VIEW_ZZD', 'CATEGORIAS')
    oView:SetOwnerView('VIEW_ZZE', 'INSTRUTORES')

    oView:EnableTitleView('VIEW_ZZD', 'Categorias')
    oView:EnableTitleView('VIEW_ZZE', 'Instrutores')

Return oView
