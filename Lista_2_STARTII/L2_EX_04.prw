#INCLUDE 'TOTVS.CH'

/*
� 4 � Ler dois inteiros (A e B) e imprimir o resultado
do quadrado da diferen�a do primeiro valor pelo
segundo.
*/

User Function QuadradoDiferanca()

    Local nA := 0, nB  := 0

    nA := VAL(FwInputBox('Digite o valor de A: '))
    nB := VAL(FwInputBox('Digite o valor de B: '))

    FwAlertInfo('O quadrado da diferen�a entre A e B �: ' + ALLTRIM(STR((nA-nB)**2)), 'Quadrado da diferen�a')

Return
