
#INCLUDE 'TOTVS.CH'
/*16 - Escreva um algoritmo para ler as notas da 1ª e
2ª avaliações de um aluno, calcule e imprima a média
desse aluno. Só devem ser aceitos valores válidos
durante a leitura (0 a 10) para cada nota.*/

User Function LerNotas()

  Local nNota_1 := 0, nNota_2 := 0, nMedia := 0

  nNota_1 := VAL(FwInputBox('Insira a primeira nota: ')) // Lê a primeira nota

  while nNota_1 < 0 .or. nNota_1 > 10 // Verifica se a primeira nota é válida, caso não esteja entre 1 e 10 exibirá uma mensagem de erro e entrará num looping até que uma nota válida seja inserida
    FWAlertError('VALOR INVÁLIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
    nNota_1 := VAL(FwInputBox('Insira o segundo valor: '))
  end

  nNota_2 := VAL(FwInputBox('Insira a segunda nota: ')) // Lê a segunda nota

  while nNota_2 < 0 .or. nNota_2 > 10 // Verifica se a segunda nota é válida, caso não esteja entre 1 e 10 exibirá uma mensagem de erro e entrará num looping até que uma nota válida seja inserida
    FWAlertError('VALOR INVÁLIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
    nNota_2 := VAL(FwInputBox('Insira o segundo valor: '))
  end
  
  nMedia := (nNota_1+nNota_2) / 2 //Calculo da média das notas

  FwAlertSuccess('A média é: ' + ALLTRIM(STR(nMedia)), 'MÉDIA') // Exibindo o resultado

Return
