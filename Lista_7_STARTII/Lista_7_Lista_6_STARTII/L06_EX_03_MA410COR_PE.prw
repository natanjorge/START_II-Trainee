#INCLUDE 'TOTVS.CH'


/*/ {Protheus.doc} User Function MA410COR
    Ponto de Entrada para alterar as legendas da rotina “Pedidos de Venda”.    
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aCores
    @return aCores
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function MA410COR()

Local aCores := {} // PARAMIXB traz a estrutura do array padrão

aAdd(aCores, {"Empty(C5_LIBEROK).And.Empty(C5_NOTA) .And. Empty(C5_BLQ)", "CHECKOK", "Pedido em Aberto"})
aAdd(aCores, {"!Empty(C5_NOTA).Or.C5_LIBEROK=='E' .And. Empty(C5_BLQ)", "BR_CANCEL", "Pedido Encerrado"})
aAdd(aCores, {"!Empty(C5_LIBEROK).And.Empty(C5_NOTA).And. Empty(C5_BLQ)", "GCTPIMSE", "Pedido Liberado"})
aAdd(aCores, {"C5_BLQ == '1'", "BR_AZUL"})
aAdd(aCores, {"C5_BLQ == '2'", "BR_LARANJA"})

Return aCores
