#INCLUDE 'TOTVS.CH'

/* 8 - A jornada de trabalho semanal de um
funcionário é de 40 horas. O funcionário que
trabalhar mais de 40 horas receberá hora extra,
cujo cálculo é o valor da hora regular com um
acréscimo de 50%.
Escreva um algoritmo que leia o número de horas
trabalhadas em um mês, o salário por hora e
escreva o salário total do funcionário, que deverá
ser acrescido das horas extras, caso tenham sido
trabalhadas (considere que o mês possua 4
semanas exatas).
*/

User Function SalarioTotal()

  Local nHorasTrab:= 0, nSalHora:= 0, nHoraExtra := 0, nSalHoraExtra := 0, nTotal := 0

  nHorasTrab := VAL(FwInputBox('Digite o número de horas trabalhadas no mês: ')) // Recebendo o número de horas trabalhadas
  nSalHora   := VAL(FwInputBox('Digite o salário por hora: ')) // Recebendo o salário por hora

  if nHorasTrab > (40 * 4)                         // *Verificando se recebeerá horas extras
    nHoraExtra = nHorasTrab - (40 * 4)             // *Quant de horas extras = horas trabalhadas - 160
    nSalHoraExtra = nHoraExtra * nSalHora * 1.5    // *Valor da hora regular com um acréscimo de 50%
    nTotal = (40 * 4 * nSalHora) + nSalHoraExtra   // *Valor total

  else
    nTotal = nHorasTrab * nSalHora
  endif

  FwAlertInfo('O salário total é de: R$' + ALLTRIM(STR(nTotal)), 'Salário total') // Exibindo o valor total do salário

Return
