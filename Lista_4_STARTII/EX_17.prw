#INCLUDE 'PROTHEUS.CH'

 
/*
Há algum tempo nós criamos duas tabelas no
dicionário de dados, a tabela de Alunos e a de
Cursos, lembra? Chegou a hora de usá-las!
Os próximos exercícios estarão associados a elas.
Ah! Mais uma coisa...

Para conseguir rodar essas rotinas, será
necessário criar uma opção (ou mais) no Menu do
Protheus.
Vamos lá!

• 17 – Desenvolva uma rotina que permita realizar
cadastros de alunos.
*/


User Function CadZZ2()

    Local cAlias := 'ZZ2', cTitulo := 'Cadastro de alunos '

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
