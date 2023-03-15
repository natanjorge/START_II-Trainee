#INCLUDE 'PROTHEUS.CH'
 
/*
• 20 – Altere a rotina do exercício 17 para que no
browse do cadastro de alunos sejam
apresentadas legendas da seguinte forma:
o Alunos com mais de 18 anos:
? Legenda Verde
o Alunos com menos de 18 anos:
? Legenda Vermelha

*/

/*/ {Protheus.doc} User Function CadZZ2
    O programa altera a rotina do exercício 17 para que no browse do cadastro de alunos sejam apresentadas legendas: Verde para alunos com +18 e vermelhor para -18.
    @type User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cAlias, cFiltro, aCores, cCadastro, aRotina
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CadZZ2()

    Local cAlias := 'ZZ2',  cFiltro   := ''

    Local aCores := { { 'ZZ2->ZZ2_DATNAS < Date()-6570' , 'ENABLE' },; // 6570 dias = 8 anos
                      { 'ZZ2->ZZ2_DATNAS > Date()-6570' , 'DISABLE' } }

    Private cCadastro := 'Cadastro de alunos '
    Private aRotina := {{ 'Pesquisar' ,    'AxPesqui' ,     0, 1 },;
                        { 'Visualizar' ,   'AxVisual' ,     0, 2 },;
                        { 'Incluir' ,      'AxInclui' ,     0, 3 },;
                        { 'Alterar' ,      'AxAltera' ,     0, 4 },;
                        { 'Excluir' ,      'AxDeleta' ,     0, 5 },;
                        { 'Alunos' ,       'U_CadZZ2' ,     0, 6 }}

    DbSelectArea('ZZ2')
    DbSetOrder(1)

    MBrowse(,,,,cAlias,,,,,,aCores,,,,,,,,cFiltro)     

    DbCloseArea()

Return
