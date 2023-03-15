#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function MA410LEG
    Ponto de Entrada para alterar as imagens das legendas da rotina “Pedidos de Venda”.    
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aLegenda
    @return aLegenda
    @example
    (examples)
    @see (links_or_references)
    /*/
#INCLUDE 'protheus.ch'

User Function MA410LEG()

    Local aLegenda := PARAMIXB

    aLegenda := {}

    AADD(aLegenda,{"CHECKOK" ,"Pedido de Venda em aberto"})
    AADD(aLegenda,{"BR_CANCEL" ,"Pedido de Venda encerrado"})
    AADD(aLegenda,{"GCTPIMSE" ,"Pedido de Venda liberado"})
    AADD(aLegenda,{"BR_AZUL" ,"Pedido Bloqueado por Regra"})
    AADD(aLegenda,{"BR_LARANJA" ,"Pedido Bloqueado por Verba"})


Return(aLegenda)
