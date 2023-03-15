#include 'protheus.ch'
#include 'parmtype.ch'

    //! • 6 – No Cadastro de Fornecedores, utilizando um
    //!   Ponto de Entrada, ao tentar incluir ou alterar um
    //!   cadastro, faça as seguintes validações:

    //* o Se o campo “País” estiver em branco não
    //* poderá realizar a inclusão / alteração. A2_PAIS	

    //* o Se o país for “Brasil” (105), o campo “CNPJ”
    //*   deverá ser preenchido, caso não seja, não
    //*   poderá realizar a inclusão / alteração.

    //* o Se o país não for “Brasil”, o CNPJ não é
    //*   obrigatório.

    //!  Obs: Para as situações em que o cadastro não
    //!  poderá ser realizado, apresentar mensagem de
    //!  erro informando o que o usuário deve fazer para
    //!  poder concluir o cadastro.

    //! Dica 1: Utilize a função Help()
    //! Dica 2: Para gerar CNPJs válidos, você pode usar o site 4Devs
*/

 
 /*/ {Protheus.doc} User Function CUSTOMERVENDOR
    Ponto de entrada na rotina de fornecedores que valida os CNPJS digitados e o pais.
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
         
        if cIdPonto == 'MODELPOS'
            if M->A2_PAIS == "   "
                lRet := .F.
                Help("",1,"ERRO!",,"O CAMPO PAÍS DEVE SER PREENCHIDO!",1)

            elseif M->A2_PAIS == "105" .AND. M->A2_CGC == "              " //* “Brasil” (105)
                lRet := .F.
                Help("",1,"ERRO!",,"O PAÍS É BRASIL, ENTÃO O CAMPO CNPJ DEVE SER PREENCHIDO!",1)
            endif

        endif
    EndIf

Return lRet
