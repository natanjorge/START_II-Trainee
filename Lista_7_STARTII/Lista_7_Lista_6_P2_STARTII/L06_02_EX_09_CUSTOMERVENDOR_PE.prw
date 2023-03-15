#INCLUDE 'TOTVS.CH'


/*
� 9 � Implemente uma valida��o na exclus�o de
Cadastros de Fornecedores. O sistema dever�
perguntar se o usu�rio confirma a exclus�o do
cadastro, se ele confirmar, o cadastro dever� ser
exclu�do, caso contr�rio, dever� permanecer na
tela de exclus�o.
*/

 /*/ {Protheus.doc} User Function CUSTOMERVENDOR
    Ponto de entrada na rotica inclus�o de forn, perguntando se o usu�rio confirma a exclus�o.
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
