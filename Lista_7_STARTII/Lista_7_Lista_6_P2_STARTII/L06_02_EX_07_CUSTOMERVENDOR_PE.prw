#include 'protheus.ch'
#include 'parmtype.ch'
#Include "FWMVCDEF.ch"


 /*/ {Protheus.doc} User Function CUSTOMERVENDOR
    Ponto de entrada na rotina de fornecedores que valida o campo loja, preenchendo o mesmo de 01 a 09, aleatoriamente.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aParam, lRet, oObj, cIdPonto, cIdModel, oView
    @return lRet
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CUSTOMERVENDOR()

    Local aParam   := PARAMIXB
    Local lRet     := .T.
    Local cIdPonto := '', cIdModel := ''//, cReceba :=''
    Local oView    := NIL
    Local oObj     := Nil
 
    if aParam <> NIL
        oObj     := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]
         
        if cIdPonto == 'BUTTONBAR' 

            oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", '0' + ALLTRIM(STR(RANDOMIZE(1,9))))

            oView := FwViewActive()
            oView:Refresh()

        endif
    endif

Return lRet
