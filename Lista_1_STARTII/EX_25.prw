#INCLUDE 'TOTVS.CH'
/*� 25 - Escreva um algoritmo para ler 10 n�meros e ao
final da leitura escrever a soma total dos 10
n�meros lidos.*/

User Function SomaVal() 

  Local nCont := 0, nNum := 0, nSoma := 0

  for nCont := 1 to 10 
    nNum := VAL(FwInputBox('Insira um n�mero: ')) // L� os 10 valores inseridos
    nSoma += nNum //  a vari�vel nSoma realiza a soma conforme os valores inseridos
  next

  FwAlertInfo('A soma dos valores � '+ ALLTRIM(STR(nSoma)), 'Resultado') // Exibindo o resultado

Return
