#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} InstMVC
    Exemplo do uso da classe FWMBrowse
    @type  Function
    @author Natan Jorge
    @since 17/03/2023
    /*/
User Function InstMVC()
    
    Local cAlias := 'ZZ5'
    Local cTitle := 'Cadastro de Cursos'
    Local oMark   := FWMarkBrowse():New() //? Instanciando a Classe

    oMark:AddButton('Excluir Marc.',   'U_Apaga', 5, 1)

    oMark:SetAlias(cAlias) //! 'Seta' a tabela SA1

    oMark:SetDescription(cTitle) //! Descri��o da tela

    oMark:SetFieldMark('ZZ5_MARC')

    oMark:DisableDetails() //! Desabilita os detalhes na parte inferior
    oMark:DisableReport()  //! Desabilita relat�rio

    oMark:Activate()       //! Ativa o Browse.
    
Return 
 

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.InstMVC' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.InstMVC' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.InstMVC' OPERATION 5 ACCESS 0

Return aRotina
 

Static Function ModelDef()
    
    Local oStruZZ5      := FWFormStruct(1, 'ZZ5') //! Esta fun��o fornece o objeto com as estruturas de metadado do dicion�rio de dados, utilizadas pelas classes oModel e oView.
    Local bModelPos     := {|oModel| ValidPos(oModel)}   //! Bloco de c�digo que ser� chamado na P�s-valida��o (MODELPOS)

    Local oModel    := MPFormModel():New('InstMVCM', , bModelPos, , )

    oModel:AddFields('ZZ5MASTER', /*PAI!*/, oStruZZ5)

    oModel:SetDescription('Modelo de Dados de Cursos')

    oModel:GetModel('ZZ5MASTER'):SetDescription('Formul�rio de Curso')

    oModel:SetPrimaryKey({'ZZ5_COD'})

Return oModel


Static Function ViewDef()

    Local oModel    := FwLoadModel('InstMVC')     //! Carregando o modelo
    Local oStruZZ5  := FWFormStruct(2, 'ZZ5')   //! Agora com o par�metro '2'
    Local oView     := FwFormView():New()       //! Cria��o de formul�rio do tipo FormField, onde � poss�vel que o usu�rio edite um registro por vez - Cria��o de formul�rio do tipo FormGrid, onde � poss�vel que o usu�rio edite N registros por vez - Cria��o de bot�es - Divis�o da tela em diversos paineis - Cria��o de Folder

    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model

    oView:AddField('VIEW_ZZ5', oStruZZ5, 'ZZ5MASTER') //! Adiciona um campo a estrutura.

    oView:CreateHorizontalBox('TELA', 100)            //! Tela e quantos por cento ela ocupar�

    oView:SetOwnerView('VIEW_ZZ5', 'TELA')

Return oView


Static Function ValidPos(oModel)

    Local nOperation  := oModel:GetOperation()
    Local cConteudo   := oModel:GetValue('ZZ5MASTER','ZZ5_DATHAB')
    Local cDataNasc   := oModel:GetValue('ZZ5MASTER','ZZ5_DATNAS')
    Local cQtdAlu     := oModel:GetValue('ZZ5MASTER','ZZ5_QTDE')
    Local cEscola     := ALLTRIM(oModel:GetValue('ZZ5MASTER','ZZ5_ESCOLA'))
    Local lAutorizado := .T.
    
    cConteudo := DateDiffYear(cConteudo, Date())
    cDataNasc := DateDiffYear(cDataNasc, Date())

    if nOperation == 3
        if cConteudo < 2
            lAutorizado := .F.
            Help(NIL, NIL, "ERRO - DATA DA HABILITA��O!", NIL, "Data incorreta!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"A data da habilita��o deve ser maior que 2 anos!"})
        
        elseif cDataNasc < 21
            lAutorizado := .F.
            Help(NIL, NIL, "ERRO - DATA DE NASCIMENTO!", NIL, "Data incorreta!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"A idade m�nima deve ser 21 anos!"})
        
        elseif cEscola == '1'
            lAutorizado := .F.
            Help(NIL, NIL, "ERRO - ESCOLA!", NIL, "Deve ter no m�nimo ensino m�dio!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Cadastre a m�nimo ensino m�dio!"})
        endif
    endif

    if nOperation == 5 .and. cQtdAlu >= 1

        lAutorizado := .F.
        Help(NIL, NIL, "ERRO - QTD ALUNOS!", NIL, "N�o � poss�vel apagar instrutores com alunos!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Remova os alunos para que possa apagar o cadastro do instrutor!"})

    endif

Return lAutorizado

//? Fun��o para Apagar registros marcados
User Function Apaga()
  if MsgYesNo('Confirma a exclus�o dos cursos selecionados?')
    DbSelectArea('ZZ5')
    
    ZZ5->(DbGotop())
    
    while ZZ5->(!EOF())
      if oMark:IsMark()   //? Verifica se o registro est� marcado
          RecLock('ZZ5', .F.)
            ZZ5->(DbDelete()) //? Marca o registro como Apagada (D_E_L_E_T_ = '*')
          ZZ5->(MSUnlock())
      endif
      ZZ5->(DbSkip())
    enddo
  endif
  
  //? Executa a atualiza��o das informa��es no Browse
  oMark:Refresh(.T.) //? .T. Indica que dever� ser posicionado no primeiro registro do Browse
Return

