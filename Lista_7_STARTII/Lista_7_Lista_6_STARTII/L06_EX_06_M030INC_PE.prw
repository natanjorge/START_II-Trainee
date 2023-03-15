#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function M030INC
    Ponto de entrada que quando qualquer cliente, quando for cadastrado no Protheus, tenha o status de bloqueado
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aArea, aAreaSA1, lRetorno
    @return lRetorno
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function M030INC()
              
    Local aArea    := GetArea()
    Local aAreaSA1 := SA1->(GetArea())
    Local lRetorno := .T.

    SA1->A1_MSBLQL := '1'

    Alert(SA1->A1_MSBLQL)
    RestArea(aArea)
    RestArea(aAreaSA1)
    
Return lRetorno
