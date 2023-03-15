#include 'protheus.ch'


 /*/ {Protheus.doc} User Function CUSTOMERVENDOR
    Ponto de entrada na rotica inclusão de forn, tornando capaz de acessar os cadastros de produtos.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aParam, xTes, oObj, cIdPonto, cIdModel, cAlias, cTitulo
    @return xTes
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CUSTOMERVENDOR()

    Local aParam   := PARAMIXB
    Local oObj     := Nil
    Local cIdPonto := '', cIdModel := ''
    Local xTes
    Local cAlias := 'SB1', cTitulo := 'Cadastro de Produtos'

    DBSELECTAREA(cAlias)
    DBSETORDER(1)

    xTes := .T.

    If aParam <> NIL
        oObj     := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]

        If cIdPonto == 'BUTTONBAR'
            xTes := {}
            aAdd(xTes, {'Cadastros de Produtos', '', {||AxCadastro(cAlias, cTitulo, '.T.', '.T.')}, 'Cadastros de Produtos'})
        endif
    EndIf

    DBCLOSEAREA()

Return xTes
