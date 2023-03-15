#INCLUDE 'TOTVS.CH'

/*
� 6 � Fa�a um algoritmo para ler um nome de usu�rio
(user name) e uma senha. Caso correspondam aos
dados armazenados internamente no programa
atrav�s do uso de constantes (hard coded), deve
ser apresentada a mensagem �Acesso permitido�.
Caso o usu�rio/senha n�o coincidam, exibir a
mensagem �Usu�rio ou senha inv�lido�. A
verifica��o da senha s� dever� ocorrer caso o
usu�rio coincida, por�m o usu�rio n�o deve saber
especificamente se foi o nome de usu�rio ou a
senha que n�o coincidiu.
*/

#DEFINE cUsuario 'admin'
#DEFINE cPass    '12345'

/*/ {Protheus.doc} User Function EX_06_Tela_ValidacaoLogin
    O programa solicita o usu�rio e a senha, se conferirem o acesso � liberado.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_User, cMsg_Senha, nOpcao, cNome, cSenh
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_06_Tela_ValidacaoLogin()

    Local cTitle := 'ValidacaoLogin', cMsg_User := 'Digite seu nome de usu�rio:  ', cMsg_Senha := 'Digite sua senha: '
    Local nOpcao := 0
    Local cNome := Space(5), cSenh := Space(5)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cMsg_User  SIZE 90, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cMsg_Senha SIZE 90, 12 OF oDlg PIXEL
    @ 010, 080 MSGET  cNome      SIZE 55, 11 OF oDlg PIXEL
    @ 030, 080 MSGET  cSenh      SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 010, 140 BUTTON 'Entrar'   SIZE 55, 11 OF oDlg PIXEL ACTION ValidacaoLogin(cNome, cSenh)
    @ 030, 140 BUTTON 'Sair'     SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function ValidacaoLogin
    Receber o Nome e a senha e realiza a valida��o.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param cNome, cSenh, cUsuario, cPass 
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function ValidacaoLogin(cNome, cSenh)

    if cNome == cUsuario .and. cSenh == cPass
        FwAlertInfo('Acesso permitido!')
    else
        FwAlertInfo('Usu�rio ou senha inv�lido!')
    endif

Return

