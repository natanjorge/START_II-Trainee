#INCLUDE 'TOTVS.CH'
/*• 1 - Escreva um algoritmo para ler um valor e escrever o seu antecessor.*/

User Function NumeroAntecessor()

  Local nAnt   := 0 // Declaração da variável

  nAnt := VAL(FwInputBox('Digite um número: ')) // valor inserido será alocado na variável nAnt

  FwAlertInfo('O número antecessor é: ' + ALLTRIM(STR(nAnt-1)), 'Número antecessor') // Print do número antecessor

Return
