#INCLUDE 'TOTVS.CH'


/*/ {Protheus.doc} User Function MTA410I
    Ponto de entrada que ao incluir ou alterar um Pedido de Venda, todos os produtos desse pedido fiquem com a observação “Inc. PE - ” antes da descrição.    
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param lRet, nPosQuant
    @return lRet
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function MTA410I()

Local lRet := .T.
Local nPosQuant := Ascan(Aheader,{|x| AllTrim(x[2]) == "C6_DESCRI" })

If acols[n][nPosQuant] != 'Inc. PE – '
    SC6->C6_DESCRI := ALLTRIM('Inc. PE – ' + SC6->C6_DESCRI)
    MSGINFO(C6_DESCRI)
EndIf

Return lRet
