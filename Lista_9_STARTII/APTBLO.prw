/*• 1 – Desenvolva uma rotina em MVC com uma
estrutura Pai x Filho (Componente de Formulário
(AddFields) e Componente de Grid (AddGrid)).
Essa rotina será utilizada para organizar os
cadastros de proprietários de apartamentos de
um condomínio.
Será necessário cadastrar o bloco e quais são os
apartamentos existentes nesse bloco, junto com o
nome e CPF de seus respectivos proprietários.
Na rotina, ao selecionar um bloco, deve ser
possível visualizar todos os apartamentos desse
bloco com o nome de seus respectivos
proprietários.*/

                                            
#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} APTBLO
    Rotina de cadastro de apartamentos com relação aos blocos.
    @type  Function
    @author Natan Jorge
    @since 17/03/2023
    /*/
User Function APTBLO()

    Local cAlias  := 'ZZD'
    Local cTitle  := 'TODO LIST'
    Local oBrowse := FwMBrowse():New() //! oBrowse rebene a rotina FwMBrowse.

     oBrowse:SetAlias(cAlias)       //! 'Seta' a tabela SA1
    oBrowse:SetDescription(cTitle) //! Descrição da tela
    oBrowse:DisableDetails()       //! Desabilita os detalhes na parte inferior
    oBrowse:DisableReport()        //! Desabilita relatório
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
    
    Local oStruZZD   := FWFormStruct(1, 'ZZD')        //! Esta função fornece o objeto com as estruturas de metadado do dicionário de dados, utilizadas pelas classes oModel e oView.
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
    Local oStruZZD  := FWFormStruct(2, 'ZZD')        //! Esta função fornece o objeto com as estruturas de metadado do dicionário de dados, utilizadas pelas classes oModel e oView.
    Local oStruZZE  := FWFormStruct(2, 'ZZE')
    Local oView     := FwFormView():New()       //! Criação de formulário do tipo FormField, onde é possível que o usuário edite um registro por vez - Criação de formulário do tipo FormGrid, onde é possível que o usuário edite N registros por vez - Criação de botões - Divisão da tela em diversos paineis - Criação de Folder

    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model
    oView:AddField('VIEW_ZZD', oStruZZD, 'ZZDMASTER') //! Adiciona um campo a estrutura.
    oView:AddGrid('VIEW_ZZE', oStruZZE, 'ZZEDETAIL')

    oView:CreateHorizontalBox('CATEGORIAS', 50)            //! Tela e quantos por cento ela ocupará
    oView:CreateHorizontalBox('INSTRUTORES', 50) 

    oView:SetOwnerView('VIEW_ZZD', 'CATEGORIAS')
    oView:SetOwnerView('VIEW_ZZE', 'INSTRUTORES')

    oView:EnableTitleView('VIEW_ZZD', 'Categorias')
    oView:EnableTitleView('VIEW_ZZE', 'Instrutores')

Return oView
