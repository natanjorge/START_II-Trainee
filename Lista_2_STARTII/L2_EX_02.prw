#INCLUDE 'TOTVS.CH'

/*
• 2 - Efetuar o cálculo da quantidade de litros de
combustível gastos em uma viagem, utilizando-se
um automóvel que faz 12 Km por litro. Para obter o
cálculo, o usuário deverá fornecer o tempo gasto
na viagem e a velocidade média durante a mesma.
Desta forma, será possível obter a distância
percorrida com a fórmula:
 DISTÂNCIA = TEMPO x VELOCIDADE.
Tendo o valor da distância, basta calcular a
quantidade de litros de combustível utilizada na
viagem com a fórmula:
 nLitrosUsados = DISTÂNCIA / 12.
O programa deverá apresentar os valores da
velocidade média, tempo gasto na vigem, a
distância percorrida e a quantidade de litros
utilizada na viagem.
*/


User Function QuantidadeLitros()

    Local nTempo := 0, nVelMedia := 0, nLitrosUsados  := 0 , nDistancia := 0 

    nTempo    := VAL(FwInputBox('Digite o tempo gasto na viagem (em horas): '))
    nVelMedia := VAL(FwInputBox('Digite a velocidade média durante a viagem (em Km/h): '))

    nDistancia := nTempo * nVelMedia
    nLitrosUsados := nDistancia / 12

    FwAlertInfo('Velocidade média: : ' + ALLTRIM(STR(nVelMedia))+'Km/h'+CRLF+;
                'Tempo gasto: ' + ALLTRIM(STR(nTempo))+' horas'+CRLF+;
                'Distância percorrida: ' + ALLTRIM(STR(nDistancia))+'Km'+CRLF+;
                'Litros de combustível utilizados: ' + ALLTRIM(STR(nLitrosUsados,5,1)) + ' litros', 'Calculos numéricos') 

Return
