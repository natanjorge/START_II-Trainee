#INCLUDE 'TOTVS.CH'

/*
• 16 - Fazer um programa que simule um cadastro de
usuário e cPassword para um sistema qualquer.
O usuário informará um “username” e uma cPassword
que deverá ser digitada duas vezes (confirmação
de cPassword).
Realizar as seguintes consistências:
o O “username” deve possuir mais do que 5
caracteres.
o A cPassword e a confirmação da cPassword devem ser
idênticas.
o A cPassword deve possuir ao menos 6 caracteres
e deve conter obrigatoriamente:
 Ao menos uma letra maiúscula, um dígito
numérico e um símbolo.
*/


User Function UsernamePassword()

    Local cUsername := '', cArmazena :='', cPassword := '', cConfirmacao := ''
    local lValido := .F., lSenhaInvalida := .F.
    local nCont := 0, nSoma := 0


    cUsername := FwInputBox('Digite um username com mais de 5 caracteres: ')

    while LEN(cUsername) < 5  //* Solicita o username tá OK
        FwAlertInfo('Username deve ter mais de 5 caracteres.')
        cUsername := FwInputBox('Digite um username com mais de 5 caracteres: ')
    end
    FwAlertInfo('O Username '+cUsername+' é aceito!')


    while lSenhaInvalida == .F.
        nSoma:=0; cArmazena :='' ; lValido := .F. //*RESTAURANDO OS PARÂMETROS

        cPassword := FwInputBox('Digite uma senha com pelo menos 6 caracteres: ') //* SE A SENHA tá OK

        while len(cPassword) < 6 
            FwAlertInfo('Senha inválida. A senha deve ter pelo menos 6 caracteres.')
            cPassword := FwInputBox('Digite uma senha com pelo menos 6 caracteres: ')
        end

        for nCont:= 1 to len(cPassword)
            if (asc(SubStr(cPassword, nCont)) >= 65 .and. asc(SubStr(cPassword, nCont)) <= 90) .and. lValido == .F.
                cArmazena += 'Contém letra maiúscula! ' + CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        lValido := .F.
        for nCont:= 1 to len(cPassword)
            if lValido  == .F. .and. (asc(SubStr(cPassword, nCont)) >= 33 .and. asc(SubStr(cPassword, nCont)) <= 47) .or.(asc(SubStr(cPassword, nCont)) >=58 .and. asc(SubStr(cPassword, nCont)) <=64) .or. (asc(SubStr(cPassword, nCont)) >= 91 .and. asc(SubStr(cPassword, nCont)) <= 96) .or. (asc(SubStr(cPassword, nCont)) >= 123 .and. asc(SubStr(cPassword, nCont)) <= 126)
                cArmazena += 'Contém símbolo!'+ CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        lValido := .F.
        for nCont:= 1 to len(cPassword)
            if lValido == .F. .and. (asc(SubStr(cPassword, nCont)) >= 48 .and. asc(SubStr(cPassword, nCont)) <= 57)
                cArmazena += 'Contém valor numérico!'+ CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        if nSoma == 3
            FwAlertInfo(cArmazena+ CRLF+ CRLF+ 'A SENHA É VÁLIDA!')
        else
            FwAlertInfo('Senha inválida!' +CRLF+CRLF+ 'A senha deve conter ao menos uma letra maiúscula, um dígito numérico e um símbolo.' )
        endif


        cConfirmacao := FwInputBox('Digite a senha novamente para confirmação: ') //* SE A SENHA tá OK

        if cConfirmacao == cPassword
            lSenhaInvalida := .T.
            FwAlertInfo('USUÁRIO CADASTRADO COM SUCESSO! '+ CRLF+ CRLF+'Username: '+ cUsername) 
        else
            while cConfirmacao <> cPassword  .or. cConfirmacao == 'R'
                cConfirmacao := FwInputBox('Digite a senha novamente para confirmação (ou R Recomeça): ')
                if cConfirmacao == 'R'
                    lSenhaInvalida := .F.
                    exit
                endif
            end
        endif
    end


Return
