#INCLUDE 'TOTVS.CH'

/*
� 8 - Fa�a um algoritmo para ler um nome de usu�rio
(user name) e uma senha. Caso correspondam aos
dados armazenados internamente no programa
atrav�s do uso de constantes (�chumbado� / hard
coded), deve ser apresentada a mensagem
�Acesso permitido�. Caso o usu�rio/senha n�o
coincidam, exibir a mensagem �Usu�rio ou senha
inv�lido�. A verifica��o da senha s� dever�
ocorrer caso o usu�rio coincida, por�m o usu�rio
n�o deve saber especificamente se foi o nome de
usu�rio ou a senha que n�o coincidiu.
*/

#DEFINE cUsuario 'NATOTVS'
#DEFINE cPass 'NA123'


User Function Login()

    Local cNome := '', cSenh := ''

    cNome := (FwInputBox('Digite seu nome de usu�rio: '))
    cSenh := (FwInputBox('Digite sua senha: '))
  
    if cNome == cUsuario .and. cSenh == cPass
        FwAlertInfo('Acesso permitido!')
    else
        FwAlertInfo('Usu�rio ou senha inv�lido!')
    endif
Return
