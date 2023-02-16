#INCLUDE 'TOTVS.CH'

/* 8 - A jornada de trabalho semanal de um
funcion�rio � de 40 horas. O funcion�rio que
trabalhar mais de 40 horas receber� hora extra,
cujo c�lculo � o valor da hora regular com um
acr�scimo de 50%.
Escreva um algoritmo que leia o n�mero de horas
trabalhadas em um m�s, o sal�rio por hora e
escreva o sal�rio total do funcion�rio, que dever�
ser acrescido das horas extras, caso tenham sido
trabalhadas (considere que o m�s possua 4
semanas exatas).
*/

User Function SalarioTotal()

  Local nHorasTrab:= 0, nSalHora:= 0, nHoraExtra := 0, nSalHoraExtra := 0, nTotal := 0

  nHorasTrab := VAL(FwInputBox('Digite o n�mero de horas trabalhadas no m�s: ')) // Recebendo o n�mero de horas trabalhadas
  nSalHora   := VAL(FwInputBox('Digite o sal�rio por hora: ')) // Recebendo o sal�rio por hora

  if nHorasTrab > (40 * 4)                         // *Verificando se recebeer� horas extras
    nHoraExtra = nHorasTrab - (40 * 4)             // *Quant de horas extras = horas trabalhadas - 160
    nSalHoraExtra = nHoraExtra * nSalHora * 1.5    // *Valor da hora regular com um acr�scimo de 50%
    nTotal = (40 * 4 * nSalHora) + nSalHoraExtra   // *Valor total

  else
    nTotal = nHorasTrab * nSalHora
  endif

  FwAlertInfo('O sal�rio total � de: R$' + ALLTRIM(STR(nTotal)), 'Sal�rio total') // Exibindo o valor total do sal�rio

Return
