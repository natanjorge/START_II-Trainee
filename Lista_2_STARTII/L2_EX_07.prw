#INCLUDE 'TOTVS.CH'

/*
• 7 - Ler a hora de início e a hora de fim de um jogo
de Poker (considere apenas horas inteiras, sem os
minutos) e calcule a duração do jogo em horas,
sabendo-se que o tempo máximo de duração do
jogo é de 24 horas e que o jogo pode iniciar em um
dia e terminar no dia seguinte.
*/

User Function Dura24H()

    Local nHoraInicio := 0, nHoraFim := 0, nDuracao := 0

    nHoraInicio := VAL(FwInputBox('Digite a hora de início do jogo (sem minutos): '))
    nHoraFim    := VAL(FwInputBox('Digite a hora de fim do jogo (sem minutos): '))
   
    nDuracao := nHoraInicio-nHoraFim
    
    if nDuracao < 0
        nDuracao += 24
    endif

    FwAlertInfo('A duração do jogo foi de ' + ALLTRIM(STR(nDuracao)) + ' horas.','Duração do jogo ')

Return
