#INCLUDE 'TOTVS.CH'
/*� 1 - Escreva um algoritmo para ler um valor e escrever o seu antecessor.*/

User Function NumeroAntecessor()

  Local nAnt   := 0 // Declara��o da vari�vel

  nAnt := VAL(FwInputBox('Digite um n�mero: ')) // valor inserido ser� alocado na vari�vel nAnt

  FwAlertInfo('O n�mero antecessor �: ' + ALLTRIM(STR(nAnt-1)), 'N�mero antecessor') // Print do n�mero antecessor

Return
