#include 'protheus.ch'
#include 'parmtype.ch'

    //! � 6 � No Cadastro de Fornecedores, utilizando um
    //!   Ponto de Entrada, ao tentar incluir ou alterar um
    //!   cadastro, fa�a as seguintes valida��es:

    //* o Se o campo �Pa�s� estiver em branco n�o
    //* poder� realizar a inclus�o / altera��o. A2_PAIS	

    //* o Se o pa�s for �Brasil� (105), o campo �CNPJ�
    //*   dever� ser preenchido, caso n�o seja, n�o
    //*   poder� realizar a inclus�o / altera��o.

    //* o Se o pa�s n�o for �Brasil�, o CNPJ n�o �
    //*   obrigat�rio.

    //!  Obs: Para as situa��es em que o cadastro n�o
    //!  poder� ser realizado, apresentar mensagem de
    //!  erro informando o que o usu�rio deve fazer para
    //!  poder concluir o cadastro.

    //! Dica 1: Utilize a fun��o Help()
    //! Dica 2: Para gerar CNPJs v�lidos, voc� pode usar o site 4Devs
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
                Help("",1,"ERRO!",,"O CAMPO PA�S DEVE SER PREENCHIDO!",1)

            elseif M->A2_PAIS == "105" .AND. M->A2_CGC == "              " //* �Brasil� (105)
                lRet := .F.
                Help("",1,"ERRO!",,"O PA�S � BRASIL, ENT�O O CAMPO CNPJ DEVE SER PREENCHIDO!",1)
            endif

        endif
    EndIf

Return lRet
