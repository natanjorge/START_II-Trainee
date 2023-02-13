
#INCLUDE 'TOTVS.CH'
/*16 - Escreva um algoritmo para ler as notas da 1� e
2� avalia��es de um aluno, calcule e imprima a m�dia
desse aluno. S� devem ser aceitos valores v�lidos
durante a leitura (0 a 10) para cada nota.*/

User Function LerNotas()

  Local nNota_1 := 0, nNota_2 := 0, nMedia := 0

  nNota_1 := VAL(FwInputBox('Insira a primeira nota: ')) // L� a primeira nota

  while nNota_1 < 0 .or. nNota_1 > 10 // Verifica se a primeira nota � v�lida, caso n�o esteja entre 1 e 10 exibir� uma mensagem de erro e entrar� num looping at� que uma nota v�lida seja inserida
    FWAlertError('VALOR INV�LIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
    nNota_1 := VAL(FwInputBox('Insira o segundo valor: '))
  end

  nNota_2 := VAL(FwInputBox('Insira a segunda nota: ')) // L� a segunda nota

  while nNota_2 < 0 .or. nNota_2 > 10 // Verifica se a segunda nota � v�lida, caso n�o esteja entre 1 e 10 exibir� uma mensagem de erro e entrar� num looping at� que uma nota v�lida seja inserida
    FWAlertError('VALOR INV�LIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
    nNota_2 := VAL(FwInputBox('Insira o segundo valor: '))
  end
  
  nMedia := (nNota_1+nNota_2) / 2 //Calculo da m�dia das notas

  FwAlertSuccess('A m�dia �: ' + ALLTRIM(STR(nMedia)), 'M�DIA') // Exibindo o resultado

Return
