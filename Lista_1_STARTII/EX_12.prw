#INCLUDE 'TOTVS.CH'

/* 12 - Ler o nome de 2 times e o número de gols
marcados na partida (para cada time). Escrever o
nome do vencedor. Caso não haja vencedor
deverá ser impressa a palavra EMPATE.*/

User Function ResultadoPartida()

  Local cTime_1 := '', cTime_2 := ''
  Local nGols_1 := 0, nGols_2  := 0

  cTime_1   := FwInputBox('Digite o nome do primeiro time: ') // Recebendo os valores
  nGols_1   := VAL(FwInputBox('Insira a quantidade de gols do primeiro time: ')) 
  cTime_2   := FwInputBox('Digite o nome do segundo time: ')
  nGols_2   := VAL(FwInputBox('Insira a quantidade de gols do segundo time: ')) 

  if nGols_1 > nGols_2 //* Se o Time 1 (Detentor dos gols_1) estiver com mais gols, será o vencedor
    FwAlertSuccess('O vencedor é o time ' + cTime_1, 'Resultado da partida') // Exibindo o resultado

  elseif nGols_2 > nGols_1 //* Se o Time 2 (Detentor dos gols_2) estiver com mais gols, será o vencedor
    FwAlertSuccess('O vencedor é o time ' + cTime_2, 'Resultado da partida') // Exibindo o resultado

  else //*Nenhum dos dois ganharam, foi empate
    FWAlertWarning('Empate!', 'Resultado da partida') // Exibindo o resultado
  endif

Return

