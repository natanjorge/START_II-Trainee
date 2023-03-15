#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function MT120BRW
    Ponto de entrada adiciona � rotina dos Pedidos de Compra um bot�o, que apresenta uma mensagem dizendo: �Bot�o acionado com sucesso!�.  
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aRotina
    @return 
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function MT120BRW() 

    AAdd( aRotina, { 'Mensagem', FwAlertInfo('Bot�o acionado com sucesso!'), 0, 6 } )

Return
