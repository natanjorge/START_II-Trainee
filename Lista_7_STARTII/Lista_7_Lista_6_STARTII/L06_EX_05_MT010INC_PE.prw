#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function MT010INC
    Ponto de entrada que quando for cadastrado no Protheus, tenha o status de bloqueado
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aArea, aAreaSB1, lRetorno
    @return lRetorno
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function MT010INC()

    Local aArea    := GetArea()
    Local aAreaSB1 := SB1->(GetArea())
    Local lRetorno := .T.

    if INCLUI
        SB1->B1_MSBLQL := 'Sim'
    endif

    RestArea(aArea)
    RestArea(aAreaSB1)
    
Return lRetorno
