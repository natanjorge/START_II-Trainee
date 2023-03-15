#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function M410ABN
    Ponto de entrada que caso cancele a inclus�o de um novo Pedido de Venda, seja apresentada uma mensagem com o seguinte texto: �Opera��o cancelada pelo usu�rio!�
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
        MSGALERT('Opera��o cancelada pelo usu�rio!')
    endif

Return lRet
