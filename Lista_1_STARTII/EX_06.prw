#INCLUDE 'TOTVS.CH'

/*6 -Escreva um algoritmo para ler uma temperatura
em graus Fahrenheit, calcular e escrever o valor
correspondente em graus Celsius.
*/

User Function FahrenheitToCelsius()

  Local nFahr:= 0, nCelcius := 0

  nFahr := FwInputBox('Digite a temperatura em Fahrenheit: ') // Recebendo a temperatura em Fahrenheit

  nCelcius := (VAL(nFahr) - 32) / 1.8 // C�lculo da temperatura em Celcius

  FwAlertInfo('A temperatura �:' + ALLTRIM(STR(nCelcius)) + '�C', 'Temperatura em Celsius') // Exibindo a temperatura em Celcius

Return
