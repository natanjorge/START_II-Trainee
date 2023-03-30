/*• 2 – Desenvolva um TODO List em MVC.
Essa rotina deve permitir cadastrar uma tarefa e
quais são os passos necessários para realizá-la.
Exemplo:
o Tarefa:
? Fazer um exercício da lista 08.
o Passos:
? Ler e entender o exercício
? Pensar no processo de desenvolvimento
? Desenvolver
? Testar o funcionamento
*/

                                            
#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} TDLIST
    Todo list
    @type  Function
    @author Natan Jorge
    @since 17/03/2023
    /*/
User Function TDLIST()

    Local cAlias  := 'ZZA'
    Local cTitle  := 'Vizualizar relação blocos x apartamentos'
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
    
    Local oStruZZA   := FWFormStruct(1, 'ZZA')        //! Esta função fornece o objeto com as estruturas de metadado do dicionário de dados, utilizadas pelas classes oModel e oView.
    Local oStruZZC   := FWFormStruct(1, 'ZZC')
    Local bValidLine := {|oGrid, nLine, cAction, cFieldId, xValue, xCurValue| ValidLine(oGrid, nLine, cAction, cFieldId, xValue, xCurValue)}

    Local oModel    := MPFormModel():New('APTBLOM', bValidLine)

    oModel:AddFields('ZZAMASTER', /*cOwner*/, oStruZZA)
    oModel:AddGrid('ZZCDETAIL', 'ZZAMASTER', oStruZZC)

    oModel:SetDescription('Vizualizar cadastros')
    oModel:GetModel('ZZAMASTER'):SetDescription('Categorias')
    oModel:GetModel('ZZCDETAIL'):SetDescription('Instrutores')

    oModel:SetRelation('ZZCDETAIL', {{'ZZC_FILIAL', 'xFilial("ZZC")'}, {'ZZC_BLOCO', 'ZZA_BLOCO'}}, ZZC->(IndexKey(1)))

    oModel:SetPrimaryKey({'ZZA_COD','ZZC_COD'})


Return oModel


Static Function ViewDef()

    Local oModel    := FwLoadModel('APTBLO')     //! Carregando o modelo
    Local oStruZZA  := FWFormStruct(2, 'ZZA')        //! Esta função fornece o objeto com as estruturas de metadado do dicionário de dados, utilizadas pelas classes oModel e oView.
    Local oStruZZC  := FWFormStruct(2, 'ZZC')
    Local oView     := FwFormView():New()       //! Criação de formulário do tipo FormField, onde é possível que o usuário edite um registro por vez - Criação de formulário do tipo FormGrid, onde é possível que o usuário edite N registros por vez - Criação de botões - Divisão da tela em diversos paineis - Criação de Folder

    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model
    oView:AddField('VIEW_ZZA', oStruZZA, 'ZZAMASTER') //! Adiciona um campo a estrutura.
    oView:AddGrid('VIEW_ZZC', oStruZZC, 'ZZCDETAIL')

    oView:CreateHorizontalBox('CATEGORIAS', 50)            //! Tela e quantos por cento ela ocupará
    oView:CreateHorizontalBox('INSTRUTORES', 50) 

    oView:SetOwnerView('VIEW_ZZA', 'CATEGORIAS')
    oView:SetOwnerView('VIEW_ZZC', 'INSTRUTORES')

    oView:EnableTitleView('VIEW_ZZA', 'Categorias')
    oView:EnableTitleView('VIEW_ZZC', 'Instrutores')

Return oView


Static Function ValidLine(oGrid, nLine, cAction, cFieldId, xValue, xCurValue)

    local lValido := .T.

    if cAction == 'SETVALUE' .AND. cFieldID == 'ZZC_APTNUM' .AND. xValue == xCurValue
        lValido := .F.
        Help(,,"Não tem porque fazer isso!",,'Você repetiu o apartamento',1 ,0,,,,,,{'Selecione outro apartamento!'})
    endif 

Return lValido
