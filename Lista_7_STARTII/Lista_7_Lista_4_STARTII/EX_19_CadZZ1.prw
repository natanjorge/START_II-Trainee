#INCLUDE 'PROTHEUS.CH'


/*/ {Protheus.doc} User Function CadZZ1
    Altere a rotina do exercício anterior para que não seja possível excluir um curso cadastrado.    
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
User Function CadZZ1()

    Local cAlias := 'ZZ1', cTitulo := 'Cadastros de Cursos'

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
