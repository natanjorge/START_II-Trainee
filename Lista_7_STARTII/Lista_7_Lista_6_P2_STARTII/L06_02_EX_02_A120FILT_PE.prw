#INCLUDE 'TOTVS.CH'


/*/ {Protheus.doc} User Function A120FILT
    Ponto de entrada na tabela SC5 valida para impedir a exclusão de pedidos de venda que tenham esse novo campo com o valor “Automático”.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param nNewORderSC7
    @return nNewORderSC7
    @example
    (examples)
    @see (links_or_references)
    /*/
#INCLUDE "PROTHEUS.CH"
 
User Function A120FILT() 

    Local nNewORderSC7 := 3//Codigo do usuario alterando a ordem do SC7

Return nNewOrderSC7
