#include 'protheus.ch'

/*
� 8 � Cri uma rotina que apresentar� mensagens
diferentes em cada uma das seguintes situa��es
dos Cadastros de Fornecedores:
o Inclus�o:
? Mensagem: Seja Bem vindo(a) ao Cadastro de
Fornecedores!
o Altera��o:
? Mensagem: Voc� est� prestes a alterar o
cadastro do fornecedor NomeFornecedor!
o Exclus�o:
? Mensagem: Cuidado, voc� est� prestes a
excluir o fornecedor NomeFornecedor!
Obs: Essas mensagens dever�o aparecer antes do
carregamento da tela referente a op��o desejada

*/


 /*/ {Protheus.doc} User Function CUSTOMERVENDOR
    Ponto de entrada na rotica inclus�o de forn, onde exiba uma mensagem na inclus�o, altera��o e exclus�o.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aParam, lRet, oObj, cIdPonto, cIdModel
    @return lRet
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CUSTOMERVENDOR()

    Local aParam   := PARAMIXB
    Local lRet     := .T.
    Local oObj     := Nil
    Local cIdPonto := '', cIdModel := ''
 
    If aParam <> NIL
        oObj     := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]
         
        if INCLUI .and. cIdPonto == 'MODELVLDACTIVE'
            MSGINFO('Seja Bem vindo(a) ao Cadastro de Fornecedores!')

        elseif ALTERA .and. cIdPonto == 'MODELVLDACTIVE'
            MSGINFO('Voc� est� prestes a alterar o cadastro do fornecedor ' + ALLTRIM(SA2->A2_NOME) + '!')
        
        elseif CCADASTRO == 'Fornecedores - EXCLUIR' .and. cIdPonto == 'MODELVLDACTIVE' //!cDelFunc
            MSGINFO('Voc� est� prestes a alterar o cadastro do fornecedor ' + ALLTRIM(SA2->A2_NOME) + '!')
        endif
    EndIf

Return lRet

