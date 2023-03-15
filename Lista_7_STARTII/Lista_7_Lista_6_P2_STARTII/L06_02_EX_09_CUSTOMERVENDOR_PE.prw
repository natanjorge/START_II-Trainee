#INCLUDE 'TOTVS.CH'


/*
• 9 – Implemente uma validação na exclusão de
Cadastros de Fornecedores. O sistema deverá
perguntar se o usuário confirma a exclusão do
cadastro, se ele confirmar, o cadastro deverá ser
excluído, caso contrário, deverá permanecer na
tela de exclusão.
*/

 /*/ {Protheus.doc} User Function CUSTOMERVENDOR
    Ponto de entrada na rotica inclusão de forn, perguntando se o usuário confirma a exclusão.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aParam, lRet, oObj, cIdPonto, cIdModel, nOper
    @return lRet
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CUSTOMERVENDOR()

    Local aParam := PARAMIXB
    Local lRet := .T.
    Local oObj := Nil
    Local cIdPonto := '', cIdModel := ''
    Local nOper

    If aParam <> NIL
        oObj     := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]

        if cIdPonto == 'MODELPOS'

            nOper := oObj:nOperation

            if nOper == 5
                lRet := MSGYESNO( 'Deseja excluir o cadastro?', 'Excluir!' )
            endif
        EndIf
    endif
Return lRet
