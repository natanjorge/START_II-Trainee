#INCLUDE 'TOTVS.CH'

/*
Parte 2: Continue o desenvolvimento do jogo.
Agora, o programa dever� continuar dando dicas a
cada palpite do usu�rio at� que ele acerte o
n�mero sorteado. Quando o usu�rio acertar o
n�mero gerado dever� ser apresentado o
resultado do teste da seguinte forma:
� Em menos de 5 tentativas exibir a mensagem: �Voc� � muito bom, acertou em �x� tentativas.�
� Em mais que 5 e menos que 9 tentativas: �Voc� � bom, acertou em �x� tentativas".
� Em mais que 9 e menos que 13 tentativas: �Voc� � mediano, acertou em �x� tentativas�.
� Em mais que 13: �Voc� � muito fraco, acertou em �x� tentativas�
*/


User Function Parte2JogoAle()

    Local nNumAleat:=0, nNum :=0, nCont:=0

    nNumAleat := RANDOMIZE(1,100) //* Realizo a escolha de um valor aleatoriamente

    
    while .T.

        nNum := VAL(FwInputBox('Adivinhe o n�mero sorteado entre 0 e 100: '))
        
        if nNum < nNumAleat
            MSGINFO('O n�mero sorteado � maior.')
            nCont++
        elseif nNum > nNumAleat
            MSGINFO('O n�mero sorteado � menor.')
            nCont++
        else
            if nCont < 5 
                MSGINFO('Voc� � muito bom, acertou em '+ALLTRIM(STR(nCont))+' tentativas.'+CRLF+CRLF+'O n�mero era: '+ALLTRIM(STR(nNumAleat))+'!')
            elseif nCont > 5 .and. nCont < 9
                MSGINFO('Voc� � bom, acertou em '+ALLTRIM(STR(nCont))+' tentativas.'+CRLF+CRLF+'O n�mero era: '+ALLTRIM(STR(nNumAleat))+'!')
            elseif nCont > 9 .and. nCont < 13
                MSGINFO('Voc� � mediano, acertou em '+ALLTRIM(STR(nCont))+' tentativas.'+CRLF+CRLF+'O n�mero era: '+ALLTRIM(STR(nNumAleat))+'!')
            elseif nCont > 13
                MSGINFO('Voc� � muito fraco, acertou em  '+ALLTRIM(STR(nCont))+' tentativas.'+CRLF+CRLF+'O n�mero era: '+ALLTRIM(STR(nNumAleat))+'!')
            endif
            break
        endif
    end
Return
