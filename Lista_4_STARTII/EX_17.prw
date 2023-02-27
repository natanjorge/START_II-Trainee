#INCLUDE 'PROTHEUS.CH'

 
/*
H� algum tempo n�s criamos duas tabelas no
dicion�rio de dados, a tabela de Alunos e a de
Cursos, lembra? Chegou a hora de us�-las!
Os pr�ximos exerc�cios estar�o associados a elas.
Ah! Mais uma coisa...

Para conseguir rodar essas rotinas, ser�
necess�rio criar uma op��o (ou mais) no Menu do
Protheus.
Vamos l�!

� 17 � Desenvolva uma rotina que permita realizar
cadastros de alunos.
*/


User Function CadZZ2()

    Local cAlias := 'ZZ2', cTitulo := 'Cadastro de alunos '

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
