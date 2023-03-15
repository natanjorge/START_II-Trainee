#INCLUDE 'PROTHEUS.CH'

/*/ {Protheus.doc} User Function EX_17_CadZZ2
    A Rotina realiza o cadastro de alunos
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cAlias, cTitulo
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_17_CadZZ2()

    Local cAlias := 'ZZ2', cTitulo := 'Cadastro de alunos '

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
