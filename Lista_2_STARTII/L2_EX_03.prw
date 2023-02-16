#INCLUDE 'TOTVS.CH'

/*
3 – Alterar o programa do exercício anterior de
modo que ele possa ser usado em veículos com
padrão de consumo diferente de 12 Km por litro.
*/

User Function QuantLitrosConsu()

    Local nTempo := 0, nVelMedia := 0, nLitrosUsados  := 0 , nDistancia := 0, nConsu := 0 

    nTempo    := VAL(FwInputBox('Digite o tempo gasto na viagem (em horas): '))
    nVelMedia := VAL(FwInputBox('Digite a velocidade média durante a viagem (em Km/h): '))
    nConsu    := VAL(FwInputBox('Digite o consumo de combustível (em Km/L): '))

    nDistancia := nTempo * nVelMedia
    nLitrosUsados := nDistancia / nConsu

    FwAlertInfo('Velocidade média: : ' + ALLTRIM(STR(nVelMedia))+'Km/h'+CRLF+;
                'Tempo gasto: ' + ALLTRIM(STR(nTempo))+' horas'+CRLF+;
                'Distância percorrida: ' + ALLTRIM(STR(nDistancia))+'Km'+CRLF+;
                'Litros de combustível utilizados: ' + ALLTRIM(STR(nLitrosUsados,5,1)) + ' litros', 'Calculos numéricos')

Return
