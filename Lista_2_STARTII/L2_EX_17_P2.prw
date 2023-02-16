#INCLUDE 'TOTVS.CH'

/*
Parte 2: Continue o desenvolvimento do jogo.
Agora, o programa deverá continuar dando dicas a
cada palpite do usuário até que ele acerte o
número sorteado. Quando o usuário acertar o
número gerado deverá ser apresentado o
resultado do teste da seguinte forma:
• Em menos de 5 tentativas exibir a mensagem: “Você é muito bom, acertou em “x” tentativas.”
• Em mais que 5 e menos que 9 tentativas: “Você é bom, acertou em “x” tentativas".
• Em mais que 9 e menos que 13 tentativas: “Você é mediano, acertou em “x” tentativas”.
• Em mais que 13: “Você é muito fraco, acertou em “x” tentativas”
*/


User Function Parte2JogoAle()

    Local nNumAleat:=0, nNum :=0, nCont:=0

    nNumAleat := RANDOMIZE(1,100) //* Realizo a escolha de um valor aleatoriamente

    
    while .T.

        nNum := VAL(FwInputBox('Adivinhe o número sorteado entre 0 e 100: '))
        
        if nNum < nNumAleat
            MSGINFO('O número sorteado é maior.')
            nCont++
        elseif nNum > nNumAleat
            MSGINFO('O número sorteado é menor.')
            nCont++
        else
            if nCont < 5 
                MSGINFO('Você é muito bom, acertou em '+ALLTRIM(STR(nCont))+' tentativas.'+CRLF+CRLF+'O número era: '+ALLTRIM(STR(nNumAleat))+'!')
            elseif nCont > 5 .and. nCont < 9
                MSGINFO('Você é bom, acertou em '+ALLTRIM(STR(nCont))+' tentativas.'+CRLF+CRLF+'O número era: '+ALLTRIM(STR(nNumAleat))+'!')
            elseif nCont > 9 .and. nCont < 13
                MSGINFO('Você é mediano, acertou em '+ALLTRIM(STR(nCont))+' tentativas.'+CRLF+CRLF+'O número era: '+ALLTRIM(STR(nNumAleat))+'!')
            elseif nCont > 13
                MSGINFO('Você é muito fraco, acertou em  '+ALLTRIM(STR(nCont))+' tentativas.'+CRLF+CRLF+'O número era: '+ALLTRIM(STR(nNumAleat))+'!')
            endif
            break
        endif
    end
Return
