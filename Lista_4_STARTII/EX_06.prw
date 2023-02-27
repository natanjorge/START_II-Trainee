#INCLUDE 'TOTVS.CH'

/*
• 6 – Faça um algoritmo para ler um nome de usuário
(user name) e uma senha. Caso correspondam aos
dados armazenados internamente no programa
através do uso de constantes (hard coded), deve
ser apresentada a mensagem “Acesso permitido”.
Caso o usuário/senha não coincidam, exibir a
mensagem “Usuário ou senha inválido”. A
verificação da senha só deverá ocorrer caso o
usuário coincida, porém o usuário não deve saber
especificamente se foi o nome de usuário ou a
senha que não coincidiu.
*/

#DEFINE cUsuario 'admin'
#DEFINE cPass    '12345'

User Function TelaLogin()

    Local cTitle := 'Login', cTexto := 'Digite seu nome de usuário:  ', cTexto2 := 'Digite sua senha: '
    Local nOpcao := 0
    Local cNome := Space(5), cSenh := Space(5)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    
    @ 014, 010 SAY    cTexto   SIZE 90, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2  SIZE 90, 12 OF oDlg PIXEL
    @ 010, 080 MSGET  cNome    SIZE 55, 11 OF oDlg PIXEL
    @ 030, 080 MSGET  cSenh    SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 010, 140 BUTTON 'Entrar' SIZE 55, 11 OF oDlg PIXEL ACTION Login(cNome, cSenh)
    @ 030, 140 BUTTON 'Sair'   SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function Login(cNome, cSenh)

    if cNome == cUsuario .and. cSenh == cPass
        FwAlertInfo('Acesso permitido!')
    else
        FwAlertInfo('Usuário ou senha inválido!')
    endif

Return

