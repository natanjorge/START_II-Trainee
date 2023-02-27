#INCLUDE 'TOTVS.CH'

/*
� 7 � Fazer um programa que simule um cadastro de
usu�rio e senha para um sistema qualquer.
O usu�rio informar� um �username� e uma senha
que dever� ser digitada duas vezes (confirma��o
de senha).
Realizar as seguintes consist�ncias:
o O �username� deve possuir mais do que 5
caracteres.
o A senha e a confirma��o da senha devem ser
id�nticas.
o A senha deve possuir ao menos 6 caracteres
e deve conter obrigatoriamente:
? Ao menos uma letra mai�scula, um d�gito
num�rico e um s�mbolo.

*/

User Function ValidacaoSenha()

    Local cTitle := 'Login', cTexto := 'Digite um username com mais de 5 caracteres:  ', cTexto2 := 'Digite uma senha com pelo menos 6 caracteres: ', cTexto3 := 'Digite a senha novamente: '
    Local nOpcao := 0
    Local cUsername := Space(10), cPassword := Space(10), cConfirmacao := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 550 PIXEL
    
    @ 014, 010 SAY    cTexto       SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cTexto2      SIZE 120, 12 OF oDlg PIXEL
    @ 054, 010 SAY    cTexto3      SIZE 120, 12 OF oDlg PIXEL
    @ 010, 130 MSGET  cUsername    SIZE 55, 11 OF oDlg PIXEL
    @ 030, 130 MSGET  cPassword    SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 050, 130 MSGET  cConfirmacao SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 010, 200 BUTTON 'Cadastrar'  SIZE 55, 11 OF oDlg PIXEL ACTION ValidaSenha(cUsername, cPassword, cConfirmacao)
    @ 030, 200 BUTTON 'Cancelar'   SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function ValidaSenha(cUsername, cPassword, cConfirmacao)

    Local cArmazena :=''
    local lValido := .F.
    local nCont := 0, nSoma := 0, nUser:=0

    cUsername := RTRIM(cUsername); cPassword := RTRIM(cPassword); cConfirmacao := RTRIM(cConfirmacao)

    if cUsername == ''
        FwAlertInfo('Campo do usu�rio est� em branco, por favor, o preencha! ') 
    elseif LEN(cUsername) <= 5  //* Solicita o username t� OK
        FwAlertInfo('Username deve ter mais de 5 caracteres.')
    else
        FwAlertInfo('O Username '+cUsername+' � aceito!')
        nUser++
    endif


    if cConfirmacao == '' .or. cPassword == ''
        FwAlertInfo('Campo da senha em branco, por favor, o preencha! ') 
    elseif len(cPassword) < 6 
        FwAlertInfo('Senha inv�lida! A senha deve ter pelo menos 6 caracteres.')
    elseif cConfirmacao != cPassword
        FwAlertInfo('Por favor, digite senhas iguais! ') 
    else
        for nCont:= 1 to len(cPassword)
            if (asc(SubStr(cPassword, nCont)) >= 65 .and. asc(SubStr(cPassword, nCont)) <= 90) .and. lValido == .F.
                cArmazena += 'Cont�m letra mai�scula! ' + CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        lValido := .F.
        for nCont:= 1 to len(cPassword)
            if lValido  == .F. .and. (asc(SubStr(cPassword, nCont)) >= 33 .and. asc(SubStr(cPassword, nCont)) <= 47) .or.(asc(SubStr(cPassword, nCont)) >=58 .and. asc(SubStr(cPassword, nCont)) <=64) .or. (asc(SubStr(cPassword, nCont)) >= 91 .and. asc(SubStr(cPassword, nCont)) <= 96) .or. (asc(SubStr(cPassword, nCont)) >= 123 .and. asc(SubStr(cPassword, nCont)) <= 126)
                cArmazena += 'Cont�m s�mbolo!'+ CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        lValido := .F.
        for nCont:= 1 to len(cPassword)
            if lValido == .F. .and. (asc(SubStr(cPassword, nCont)) >= 48 .and. asc(SubStr(cPassword, nCont)) <= 57)
                cArmazena += 'Cont�m valor num�rico!'+ CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        if nSoma == 3
            FwAlertInfo(cArmazena+ CRLF+ CRLF+ 'A SENHA � V�LIDA!')
        else
            FwAlertInfo('Senha inv�lida!' +CRLF+CRLF+ 'A senha deve conter ao menos uma letra mai�scula, um d�gito num�rico e um s�mbolo.' )
        endif
    endif

    if cConfirmacao == cPassword .AND. nSoma == 3 .AND. nUser == 1
        FwAlertInfo('Usu�rio cadastrado com sucesso! '+ CRLF+ CRLF+'Username: '+ cUsername) 
    endif

Return
