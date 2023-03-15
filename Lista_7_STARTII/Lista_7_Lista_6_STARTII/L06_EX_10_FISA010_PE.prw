#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'


/*/ {Protheus.doc} User Function FISA010
    Ponto de entrada que é executado na inclusão de municípios, não permite cadastros com municípios já registrados.
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
User Function FISA010()

    Local aParam   := PARAMIXB
    Local lRet     := .T.
    Local oObj     := Nil
    Local cIdPonto := '', cIdModel := ''


    if aParam <> NIL
        oObj     := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]
         
        if cIdPonto == "MODELPOS"
            if U_ValidaCidade(M->CC2_MUN, M->CC2_EST) == .T.
                lRet := .F.
                Help("",1,"FISA010",,"Já existe uma cidade cadastrada neste estado!",1)
            endif
        endif
    endif

Return lRet
    
