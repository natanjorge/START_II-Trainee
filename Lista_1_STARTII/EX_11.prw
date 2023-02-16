#INCLUDE 'TOTVS.CH'

/* 11 - Ler 3 valores, cada um representando as
medidas dos lados de um triângulo e escrever se
formam ou não um triângulo. OBS: para formar um
triângulo, o valor de cada lado deve ser menor que
a soma dos outros 2 lados.*/

User Function FormaTriangulo()

  Local nA:= 0, nB := 0, nC:= 0

  nA := VAL(FwInputBox('Digite o primeiro valor: ')) // Recebendo os valores
  nB := VAL(FwInputBox('Digite o segundo valor: ')) 
  nC := VAL(FwInputBox('Digite o terceiro valor: '))

  if (nA + nB > nC) .and. (nA + nC > nB) .and. (nB + nC > nA) //* Se os 3 parâmetros forem atendidos simultâneamente, logo, os lados formam um triângulo
    FwAlertSuccess('Os lados formam um triângulo!', 'Forma triângulo') // Exibindo o resultado

  else
    FWAlertError('Os lados NÃO formam um triângulo!', 'Forma triângulo') // Exibindo o resultado
  endif

Return

