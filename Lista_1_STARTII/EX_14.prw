#INCLUDE 'TOTVS.CH'

/* 14 - Escreva um algoritmo para ler 2 valores e se o
segundo valor informado for ZERO, deve ser lido
um novo valor, ou seja, para o segundo valor n�o
pode ser aceito o valor zero. Imprimir o resultado
da divis�o do primeiro valor lido pelo segundo
valor lido. */

User Function DiferenteZero()

  Local nVal_1 := 0, nVal_2 := 0

  nVal_1   := VAL(FwInputBox('Insira o primeiro valor: ')) 

  while nVal_2 == 0            //* Enquanto o segundo valor for igual a 0, o usu�rio cair� num looping at� alterar o respectivo valor
    nVal_2 := VAL(FwInputBox('Insira o segundo valor: ')) 
  end

  FwAlertInfo('O valor da divis�o �: ' + ALLTRIM(STR(nVal_1/nVal_2)), 'Valor da divis�o') //* Realizando a divis�o dos valores e Exibindo o resultado 

Return
