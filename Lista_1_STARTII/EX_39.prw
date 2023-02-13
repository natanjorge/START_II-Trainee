#INCLUDE 'TOTVS.CH'
/*• 39 - Faça um programa que realiza o sorteio de um
nome. Os nomes contidos no programa devem os
nomes dos participantes da trilha de capacitação
do Projeto Start II.        */

User Function NomesSTARTII() 

    Local aNomesStart := {'Natan','Stephani','Daniele','','Edison','Ruan',;
                        'Gabriela','Giulliana','Quirino','João','Gustavo',;
                        'Tamíris','Pintor','Henrique','Lucas','Fábio'}
    Local nTamanho := 0
    Local cSorteado := ''

    nTamanho := LEN( aNomesStart ) //* nTamanho recebe a quantidade de valores no array
    cSorteado := aNomesStart[RANDOMIZE(1,nTamanho)] //* Realizo a escolha de um valor aleatoriamente
    MSGINFO(cSorteado) //* Imprimo um nome de forma aleatória

Return
