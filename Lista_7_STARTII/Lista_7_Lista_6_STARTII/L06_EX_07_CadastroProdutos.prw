#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function CadastroProdutos
    Realiza a inclusão do botão da rotina MA020ROT.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cAlias, cCadastro, aRotina
    @return 
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CadastroProdutos()

    Local cAlias      := 'SB1'
    Private cCadastro := 'Cadastro de Produtos '
    Private aRotina   := {{ 'Pesquisar' ,    'AxPesqui' ,     0, 1 },;
                          { 'Visualizar' ,   'AxVisual' ,     0, 2 },;
                          { 'Incluir' ,      'AxInclui' ,     0, 3 },;
                          { 'Alterar' ,      'AxAltera' ,     0, 4 },;
                          { 'Excluir' ,      'AxDeleta' ,     0, 5 }}

    DbSelectArea(cAlias)
    DbSetOrder(1)

    MBrowse(,,,,cAlias,,,,,,,,,,,,,,)     

    DbCloseArea()

Return
