#INCLUDE 'TOTVS.CH'
/*� 39 - Fa�a um programa que realiza o sorteio de um
nome. Os nomes contidos no programa devem os
nomes dos participantes da trilha de capacita��o
do Projeto Start II.        */

User Function NomesSTARTII() 

    Local aNomesStart := {'Natan','Stephani','Daniele','','Edison','Ruan',;
                        'Gabriela','Giulliana','Quirino','Jo�o','Gustavo',;
                        'Tam�ris','Pintor','Henrique','Lucas','F�bio'}
    Local cSorteado := ''

    cSorteado := aNomesStart[RANDOMIZE(1,LEN( aNomesStart ))] //* Realizo a escolha de um valor aleatoriamente
    MSGINFO(cSorteado) //* Imprimo um nome de forma aleat�ria

Return
