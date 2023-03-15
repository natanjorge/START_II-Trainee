#include 'protheus.ch'

/*
• 8 – Cri uma rotina que apresentará mensagens
diferentes em cada uma das seguintes situações
dos Cadastros de Fornecedores:
o Inclusão:
? Mensagem: Seja Bem vindo(a) ao Cadastro de
Fornecedores!
o Alteração:
? Mensagem: Você está prestes a alterar o
cadastro do fornecedor NomeFornecedor!
o Exclusão:
? Mensagem: Cuidado, você está prestes a
excluir o fornecedor NomeFornecedor!
Obs: Essas mensagens deverão aparecer antes do
carregamento da tela referente a opção desejada

*/


 /*/ {Protheus.doc} User Function CUSTOMERVENDOR
    Ponto de entrada na rotica inclusão de forn, onde exiba uma mensagem na inclusão, alteração e exclusão.
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
            MSGINFO('Você está prestes a alterar o cadastro do fornecedor ' + ALLTRIM(SA2->A2_NOME) + '!')
        
        elseif CCADASTRO == 'Fornecedores - EXCLUIR' .and. cIdPonto == 'MODELVLDACTIVE' //!cDelFunc
            MSGINFO('Você está prestes a alterar o cadastro do fornecedor ' + ALLTRIM(SA2->A2_NOME) + '!')
        endif
    EndIf

Return lRet

