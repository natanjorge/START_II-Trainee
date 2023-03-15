#INCLUDE 'PROTHEUS.CH'


/*/ {Protheus.doc} User Function EX_18_Cad_ZZ1
    Desenvolva uma rotina que permita realizar cadastros de cursos.    
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
