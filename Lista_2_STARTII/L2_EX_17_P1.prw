#INCLUDE 'TOTVS.CH'

/*
Parte 1: Elaborar um jogo do tipo adivinhe o
número. Onde deverá ser sorteado um número
entre 0 e 100. Em seguida solicitado que o usuário
adivinhe qual foi o número sorteado. Após o
“chute” do usuário apresentar uma mensagem
informando se o número sorteado é maior, menor ou
igual ao número “chutado”. 
*/


User Function JogoNumeroAle()

    Local nNumAleat:=0, nNum :=0

    nNumAleat := RANDOMIZE(1,100) //* Realizo a escolha de um valor aleatoriamente

    
    while .T.

        nNum := VAL(FwInputBox('Adivinhe o número sorteado entre 0 e 100: '))
        
        if nNum < nNumAleat
            MSGINFO('O número sorteado é maior.')
        elseif nNum > nNumAleat
            MSGINFO('O número sorteado é menor.')
        else
            MSGINFO('Parabéns! Você acertou o número sorteado.'+CRLF+CRLF+'O número era: '+ALLTRIM(STR(nNumAleat))+'!')
            break
        endif
    end
Return
