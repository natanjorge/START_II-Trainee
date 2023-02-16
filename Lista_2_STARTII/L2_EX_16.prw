#INCLUDE 'TOTVS.CH'

/*
� 16 - Fazer um programa que simule um cadastro de
usu�rio e cPassword para um sistema qualquer.
O usu�rio informar� um �username� e uma cPassword
que dever� ser digitada duas vezes (confirma��o
de cPassword).
Realizar as seguintes consist�ncias:
o O �username� deve possuir mais do que 5
caracteres.
o A cPassword e a confirma��o da cPassword devem ser
id�nticas.
o A cPassword deve possuir ao menos 6 caracteres
e deve conter obrigatoriamente:
 Ao menos uma letra mai�scula, um d�gito
num�rico e um s�mbolo.
*/


User Function UsernamePassword()

    Local cUsername := '', cArmazena :='', cPassword := '', cConfirmacao := ''
    local lValido := .F., lSenhaInvalida := .F.
    local nCont := 0, nSoma := 0


    cUsername := FwInputBox('Digite um username com mais de 5 caracteres: ')

    while LEN(cUsername) < 5  //* Solicita o username t� OK
        FwAlertInfo('Username deve ter mais de 5 caracteres.')
        cUsername := FwInputBox('Digite um username com mais de 5 caracteres: ')
    end
    FwAlertInfo('O Username '+cUsername+' � aceito!')


    while lSenhaInvalida == .F.
        nSoma:=0; cArmazena :='' ; lValido := .F. //*RESTAURANDO OS PAR�METROS

        cPassword := FwInputBox('Digite uma senha com pelo menos 6 caracteres: ') //* SE A SENHA t� OK

        while len(cPassword) < 6 
            FwAlertInfo('Senha inv�lida. A senha deve ter pelo menos 6 caracteres.')
            cPassword := FwInputBox('Digite uma senha com pelo menos 6 caracteres: ')
        end

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


        cConfirmacao := FwInputBox('Digite a senha novamente para confirma��o: ') //* SE A SENHA t� OK

        if cConfirmacao == cPassword
            lSenhaInvalida := .T.
            FwAlertInfo('USU�RIO CADASTRADO COM SUCESSO! '+ CRLF+ CRLF+'Username: '+ cUsername) 
        else
            while cConfirmacao <> cPassword  .or. cConfirmacao == 'R'
                cConfirmacao := FwInputBox('Digite a senha novamente para confirma��o (ou R Recome�a): ')
                if cConfirmacao == 'R'
                    lSenhaInvalida := .F.
                    exit
                endif
            end
        endif
    end


Return
