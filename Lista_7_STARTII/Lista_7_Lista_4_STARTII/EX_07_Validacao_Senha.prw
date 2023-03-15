#INCLUDE 'TOTVS.CH'

/*/ {Protheus.doc} User Function EX_07_Validacao_Senha
    O programa solicita ao usuário o valor do Dólar e a quantidade de dólares que deseja converter.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cDigita_user, cDigite_Senha, cConfirma_Senha, nOpcao, cUsername, cPassword, cConfirmacao
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_07_Validacao_Senha()

    Local cTitle := 'Login', cDigita_user := 'Digite um username com mais de 5 caracteres:  ', cDigite_Senha := 'Digite uma senha com pelo menos 6 caracteres: ', cConfirma_Senha := 'Digite a senha novamente: '
    Local nOpcao := 0
    Local cUsername := Space(10), cPassword := Space(10), cConfirmacao := Space(10)
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 200, 550 PIXEL
    
    @ 014, 010 SAY    cDigita_user    SIZE 120, 12 OF oDlg PIXEL
    @ 034, 010 SAY    cDigite_Senha   SIZE 120, 12 OF oDlg PIXEL
    @ 054, 010 SAY    cConfirma_Senha SIZE 120, 12 OF oDlg PIXEL
    @ 010, 130 MSGET  cUsername       SIZE 55, 11 OF oDlg PIXEL
    @ 030, 130 MSGET  cPassword       SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 050, 130 MSGET  cConfirmacao    SIZE 55, 11 OF oDlg PIXEL PASSWORD
    @ 010, 200 BUTTON 'Cadastrar'     SIZE 55, 11 OF oDlg PIXEL ACTION Valida_Senha(cUsername, cPassword, cConfirmacao)
    @ 030, 200 BUTTON 'Cancelar'      SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function Valida_Senha
    Receber os três valores inseridos e validar.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param cUsername, cPassword, cConfirmacao, cArmazena, lValido, nCont, nSoma, nUser
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function Valida_Senha(cUsername, cPassword, cConfirmacao)

    Local cArmazena := ''
    local lValido   := .F.
    local nCont     := 0, nSoma := 0, nUser:=0

    cUsername := RTRIM(cUsername); cPassword := RTRIM(cPassword); cConfirmacao := RTRIM(cConfirmacao)

    if cUsername == ''
        FwAlertInfo('Campo do usuário está em branco, por favor, o preencha! ') 
    elseif LEN(cUsername) <= 5  //* Solicita o username tá OK
        FwAlertInfo('Username deve ter mais de 5 caracteres.')
    else
        FwAlertInfo('O Username '+cUsername+' é aceito!')
        nUser++
    endif

    if cConfirmacao == '' .or. cPassword == ''
        FwAlertInfo('Campo da senha em branco, por favor, o preencha! ') 
    elseif len(cPassword) < 6 
        FwAlertInfo('Senha inválida! A senha deve ter pelo menos 6 caracteres.')
    elseif cConfirmacao != cPassword
        FwAlertInfo('Por favor, digite senhas iguais! ') 
    else
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
    endif

    if cConfirmacao == cPassword .AND. nSoma == 3 .AND. nUser == 1
        FwAlertInfo('Usuário cadastrado com sucesso! '+ CRLF+ CRLF+'Username: '+ cUsername) 
    endif

Return
