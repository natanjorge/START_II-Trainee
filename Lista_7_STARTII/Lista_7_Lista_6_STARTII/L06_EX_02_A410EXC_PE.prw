#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function A410EXC
    Ponto de entrada para impedir a exclusão de pedidos de venda que tenham esse novo campo com o valor “Automático”.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aArea, aAreaSC5, lRetorno
    @return lRetorno
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function A410EXC()

    Local aAreaSC5 := SC5->(GetArea())
    Local lRetorno := .T.

    if SC5->C5_TIPINCL == 'Automatico'
        lRetorno := .F.
    endif

    RestArea(aArea)
    RestArea(aAreaSC5)
    
Return lRetorno

