#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function M410ABN
    Ponto de entrada que caso cancele a inclusão de um novo Pedido de Venda, seja apresentada uma mensagem com o seguinte texto: “Operação cancelada pelo usuário!”
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param lRet
    @return lRet
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function M410ABN()

Local lRet := .F.

    if lRet := .T.
        MSGALERT('Operação cancelada pelo usuário!')
    endif

Return lRet
