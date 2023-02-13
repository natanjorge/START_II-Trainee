#INCLUDE 'TOTVS.CH'

/* 11 - Ler 3 valores, cada um representando as
medidas dos lados de um tri�ngulo e escrever se
formam ou n�o um tri�ngulo. OBS: para formar um
tri�ngulo, o valor de cada lado deve ser menor que
a soma dos outros 2 lados.*/

User Function FormaTriangulo()

  Local nA:= 0, nB := 0, nC:= 0

  nA := VAL(FwInputBox('Digite o primeiro valor: ')) // Recebendo os valores
  nB := VAL(FwInputBox('Digite o segundo valor: ')) 
  nC := VAL(FwInputBox('Digite o terceiro valor: '))

  if (nA + nB > nC) .and. (nA + nC > nB) .and. (nB + nC > nA) //* Se os 3 par�metros forem atendidos simult�neamente, logo, os lados formam um tri�ngulo
    FwAlertSuccess('Os lados formam um tri�ngulo!', 'Forma tri�ngulo') // Exibindo o resultado

  else
    FWAlertError('Os lados N�O formam um tri�ngulo!', 'Forma tri�ngulo') // Exibindo o resultado
  endif

Return

