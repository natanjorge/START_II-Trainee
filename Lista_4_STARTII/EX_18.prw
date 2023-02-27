#INCLUDE 'PROTHEUS.CH'

 
/*
• 18 – Desenvolva uma rotina que permita realizar
cadastros de cursos.

*/


User Function CadZZ1()

    Local cAlias := 'ZZ1', cTitulo := 'Cadastros de Cursos'

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
