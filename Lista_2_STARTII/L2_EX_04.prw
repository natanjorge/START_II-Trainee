#INCLUDE 'TOTVS.CH'

/*
• 4 – Ler dois inteiros (A e B) e imprimir o resultado
do quadrado da diferença do primeiro valor pelo
segundo.
*/

User Function QuadradoDiferanca()

    Local nA := 0, nB  := 0

    nA := VAL(FwInputBox('Digite o valor de A: '))
    nB := VAL(FwInputBox('Digite o valor de B: '))

    FwAlertInfo('O quadrado da diferença entre A e B é: ' + ALLTRIM(STR((nA-nB)**2)), 'Quadrado da diferença')

Return
