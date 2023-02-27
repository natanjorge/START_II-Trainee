#INCLUDE 'PROTHEUS.CH'
 
/*
� 19 � Altere a rotina do exerc�cio anterior para que
n�o seja poss�vel excluir um curso cadastrado.
*/


User Function CadZZ1()

    Local cAlias := 'ZZ1', cTitulo := 'Cadastros de Cursos', lFunExc := 'U_BloqueiaExcluir()'

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, lFunExc, NIL)

Return

User Function BloqueiaExcluir()
    
    Local lRet := .F.

    FwAlertError('N�o � poss�vel excluir cursos cadastrados!')
    lRet := .F.

Return lRet
