#INCLUDE 'TOTVS.CH'

/*
� 2 - Efetuar o c�lculo da quantidade de litros de
combust�vel gastos em uma viagem, utilizando-se
um autom�vel que faz 12 Km por litro. Para obter o
c�lculo, o usu�rio dever� fornecer o tempo gasto
na viagem e a velocidade m�dia durante a mesma.
Desta forma, ser� poss�vel obter a dist�ncia
percorrida com a f�rmula:
 DIST�NCIA = TEMPO x VELOCIDADE.
Tendo o valor da dist�ncia, basta calcular a
quantidade de litros de combust�vel utilizada na
viagem com a f�rmula:
 nLitrosUsados = DIST�NCIA / 12.
O programa dever� apresentar os valores da
velocidade m�dia, tempo gasto na vigem, a
dist�ncia percorrida e a quantidade de litros
utilizada na viagem.
*/


User Function QuantidadeLitros()

    Local nTempo := 0, nVelMedia := 0, nLitrosUsados  := 0 , nDistancia := 0 

    nTempo    := VAL(FwInputBox('Digite o tempo gasto na viagem (em horas): '))
    nVelMedia := VAL(FwInputBox('Digite a velocidade m�dia durante a viagem (em Km/h): '))

    nDistancia := nTempo * nVelMedia
    nLitrosUsados := nDistancia / 12

    FwAlertInfo('Velocidade m�dia: : ' + ALLTRIM(STR(nVelMedia))+'Km/h'+CRLF+;
                'Tempo gasto: ' + ALLTRIM(STR(nTempo))+' horas'+CRLF+;
                'Dist�ncia percorrida: ' + ALLTRIM(STR(nDistancia))+'Km'+CRLF+;
                'Litros de combust�vel utilizados: ' + ALLTRIM(STR(nLitrosUsados,5,1)) + ' litros', 'Calculos num�ricos') 

Return
