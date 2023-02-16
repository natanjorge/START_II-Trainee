#INCLUDE 'TOTVS.CH'

/*
Parte 1: Elaborar um jogo do tipo adivinhe o
n�mero. Onde dever� ser sorteado um n�mero
entre 0 e 100. Em seguida solicitado que o usu�rio
adivinhe qual foi o n�mero sorteado. Ap�s o
�chute� do usu�rio apresentar uma mensagem
informando se o n�mero sorteado � maior, menor ou
igual ao n�mero �chutado�. 
*/


User Function JogoNumeroAle()

    Local nNumAleat:=0, nNum :=0

    nNumAleat := RANDOMIZE(1,100) //* Realizo a escolha de um valor aleatoriamente

    
    while .T.

        nNum := VAL(FwInputBox('Adivinhe o n�mero sorteado entre 0 e 100: '))
        
        if nNum < nNumAleat
            MSGINFO('O n�mero sorteado � maior.')
        elseif nNum > nNumAleat
            MSGINFO('O n�mero sorteado � menor.')
        else
            MSGINFO('Parab�ns! Voc� acertou o n�mero sorteado.'+CRLF+CRLF+'O n�mero era: '+ALLTRIM(STR(nNumAleat))+'!')
            break
        endif
    end
Return
