#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function ITEM
    Ponto de entrada que é executado na alteração/inclusão de produtos.
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
User Function ITEM()

    Local aParam   := PARAMIXB
    Local lRet     := .T.
    Local oObj     := Nil
    Local cIdPonto := '', cIdModel := ''
 
    If aParam <> NIL
        oObj     := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]
         
        if cIdPonto == 'MODELCOMMITTTS'
            SB1->B1_DESC := ALLTRIM('Cad. Manual - ' + M->B1_DESC)
        endif
    EndIf

Return lRet

