/*� 2 � Desenvolva um TODO List em MVC.
Essa rotina deve permitir cadastrar uma tarefa e
quais s�o os passos necess�rios para realiz�-la.
Exemplo:
o Tarefa:
? Fazer um exerc�cio da lista 08.
o Passos:
? Ler e entender o exerc�cio
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
    Local cTitle  := 'Vizualizar rela��o blocos x apartamentos'
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
    
    Local oStruZZA   := FWFormStruct(1, 'ZZA')        //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
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
    Local oStruZZA  := FWFormStruct(2, 'ZZA')        //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
    Local oStruZZC  := FWFormStruct(2, 'ZZC')
    Local oView     := FwFormView():New()       //! Cria��o de formul�rio do tipo FormField, onde � poss�vel que o usu�rio edite um registro por vez - Cria��o de formul�rio do tipo FormGrid, onde � poss�vel que o usu�rio edite N registros por vez - Cria��o de bot�es - Divis�o da tela em diversos paineis - Cria��o de Folder

    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model
    oView:AddField('VIEW_ZZA', oStruZZA, 'ZZAMASTER') //! Adiciona um campo a estrutura.
    oView:AddGrid('VIEW_ZZC', oStruZZC, 'ZZCDETAIL')

    oView:CreateHorizontalBox('CATEGORIAS', 50)            //! Tela e quantos por cento ela ocupar�
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
        Help(,,"N�o tem porque fazer isso!",,'Voc� repetiu o apartamento',1 ,0,,,,,,{'Selecione outro apartamento!'})
    endif 

Return lValido
