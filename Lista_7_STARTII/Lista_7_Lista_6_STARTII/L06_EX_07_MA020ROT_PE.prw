#INCLUDE 'TOTVS.CH'


/*/ {Protheus.doc} User Function MA020ROT
    Ponto de entrada que cria um botão “Outras Ações” do cadastro de fornecedores. Que abri o browse do cadastro de produtos
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aRotUser
    @return aRotUser
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function MA020ROT()

    Local aRotUser := {}
   
    AAdd(aRotUser,{ 'Cad. Produtos', 'U_CadastroProdutos()', 0, 6 } )

Return aRotUser
