#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} MYMVC
    Exemplo do uso da classe FWMBrowse
    @type  Function
    @author Natan Jorge
    @since 17/03/2023
    /*/
User Function AlunMVC()

    Local cAlias := 'ZZ6'
    Local cTitle := 'Cadastro de Cursos'
    Local oMark   := FWMarkBrowse():New() //? Instanciando a Classe

    oMark:AddButton('Excluir Marc.',   'U_Deleti', 5, 1)

    oMark:SetAlias(cAlias)       

    oMark:SetDescription(cTitle) 

    oMark:SetFieldMark('ZZ6_MARC')

    oMark:DisableDetails() 
    oMark:DisableReport()       

    oMark:Activate()            
    
Return 

Static Function MenuDef()
    
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF' OPERATION 5 ACCESS 0

Return FWMVCMenu('AlunMVC')
 
Static Function ModelDef()

    Local oStruZZ6    := FWFormStruct(1, 'ZZ6')      //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
    Local bModelPos   := {|oModel| ValidPos(oModel)} //! Bloco de c�digo que ser� chamado na P�s-valida��o (MODELPOS)
    Local aGatilho    := FwStruTrigger('ZZ6_CODINS', 'ZZ6_NOMINS', 'ZZ5->ZZ5_NOME', .T., 'ZZ5', 1, 'xFilial("ZZ5")+AllTrim(M->ZZ6_CODINS)')

    Local oModel      := MPFormModel():New('AlunMVCM', , bModelPos,, )

    oStruZZ6:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

    oModel:AddFields('ZZ6MASTER', /*cOwner*/, oStruZZ6, , /*bFieldPos*/, /*bLoad*/)

    oStruZZ6:SetProperty('ZZ6_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZZ6", "ZZ6_COD")'))

    oModel:SetDescription('Cadastro de Alunos')

    oModel:GetModel('ZZ6MASTER'):SetDescription('Formul�rio do Cadastro de Alunos')

    oModel:SetPrimaryKey({'ZZ6_COD'})

Return oModel

Static Function ViewDef()

    Local oModel    := FwLoadModel('AlunMVC')   //! Carregando o modelo
    Local oStruZZ6  := FWFormStruct(2, 'ZZ6')   //! Agora com o par�metro '2'
    Local oView     := FwFormView():New()       //! Cria��o de formul�rio do tipo FormField, onde � poss�vel que o usu�rio edite um registro por vez - Cria��o de formul�rio do tipo FormGrid, onde � poss�vel que o usu�rio edite N registros por vez - Cria��o de bot�es - Divis�o da tela em diversos paineis - Cria��o de Folder


    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model

    oView:AddField('VIEW_ZZ6', oStruZZ6, 'ZZ6MASTER') //! Adiciona um campo a estrutura.

    oView:CreateHorizontalBox('TELA', 100)            //! Tela e quantos por cento ela ocupar�

    oView:SetFieldAction('ZZ6_COD', {|oView| ValidField(oView)})
    
    oView:SetOwnerView('VIEW_ZZ6', 'TELA')

Return oView

Static Function ValidPos(oModel)

    Local nOperation   := oModel:GetOperation()
    Local cCodInstru   := oModel:GetValue('ZZ6MASTER','ZZ6_CODINS')
    Local cRealizaAula := oModel:GetValue('ZZ6MASTER','ZZ6_LISTA')
    Local lAutorizado  := .T.
    
    DbSelectArea("ZZ5")
    DbSetOrder(1)

    if nOperation == 3 

        if DbSeek(xFilial("ZZ5") + cCodInstru)
            if ZZ5->ZZ5_QTDE > 4
                lAutorizado := .F.
                Help(NIL, NIL, "ERRO QTDE DE ALUNOS!", NIL, "Quantidade de alunos maior que 5!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Selecione outro Instrutor!"})
            else
                RecLock("ZZ5", .F.)
                    ZZ5_QTDE++
                MSUNLOCK()
            endif
        endif

    elseif nOperation == 5

        if cRealizaAula == "1"

            lAutorizado := .F.
            Help(NIL, NIL, "Realizando Aulas!", NIL, "Aluno realizando aulas!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Remover o aluno!"})
        
        else
            if DbSeek(xFilial("ZZ5") + cCodInstru)
                RecLock("ZZ5", .F.)
                    ZZ5_QTDE--
                MSUNLOCK()
            endif
        endif
    endif

Return lAutorizado

//? Fun��o para Apagar registros marcados
User Function Deleti()

    if MsgYesNo('Confirma a exclus�o dos cursos selecionados?')
    
        DbSelectArea('ZZ6')
        
        ZZ6->(DbGotop())
        
        while ZZ6->(!EOF())

            if oMark:IsMark() .and. ZZ6->ZZ6_LISTA != "1"  //? Verifica se o registro est� marcado

                RecLock('ZZ6', .F.)
                    ZZ6->(DbDelete()) //? Marca o registro como Apagada (D_E_L_E_T_ = '*')
                    ExcluiAlu()
                ZZ6->(MSUnlock())
            else 
                FwAlertError('O campo realiza aula n�o pode estar como SIM', 'ERRO!')
            endif

            ZZ6->(DbSkip())

        enddo
    endif
    
    //? Executa a atualiza��o das informa��es no Browse
    oMark:Refresh(.T.) //? .T. Indica que dever� ser posicionado no primeiro registro do Browse
Return

Static Function ExcluiAlu()
    
    DbSelectArea("ZZ5")
    DbSetOrder(1)

    if DbSeek(xFilial("ZZ5") + ZZ6->ZZ6_CODINS)
        RecLock("ZZ5", .F.)
            ZZ5_QTDE--
        ZZ5->(MSUNLOCK())
    endif

Return 
