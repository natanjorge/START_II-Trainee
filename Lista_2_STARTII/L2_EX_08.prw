#INCLUDE 'TOTVS.CH'

/*
• 8 - Faça um algoritmo para ler um nome de usuário
(user name) e uma senha. Caso correspondam aos
dados armazenados internamente no programa
através do uso de constantes (“chumbado” / hard
coded), deve ser apresentada a mensagem
“Acesso permitido”. Caso o usuário/senha não
coincidam, exibir a mensagem “Usuário ou senha
inválido”. A verificação da senha só deverá
ocorrer caso o usuário coincida, porém o usuário
não deve saber especificamente se foi o nome de
usuário ou a senha que não coincidiu.
*/

#DEFINE cUsuario 'NATOTVS'
#DEFINE cPass 'NA123'


User Function Login()

    Local cNome := '', cSenh := ''

    cNome := (FwInputBox('Digite seu nome de usuário: '))
    cSenh := (FwInputBox('Digite sua senha: '))
  
    if cNome == cUsuario .and. cSenh == cPass
        FwAlertInfo('Acesso permitido!')
    else
        FwAlertInfo('Usuário ou senha inválido!')
    endif
Return
