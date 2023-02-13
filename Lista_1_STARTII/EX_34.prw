#INCLUDE 'TOTVS.CH'
/*• 34 - Faça um programa que receba a idade e o peso
de sete pessoas. Calcule e mostre:
o A quantidade de pessoas com mais de 90
quilos
o A média das idades das sete pessoas     */

User Function IdadeEPeso() 
 
Local nI := 0, nCont := 0, nIdade := 0, nPesos := 0

  for nI := 1 to 7
    nIdade += VAL(FWInputBox('Insira a idade da pessoa: '))
    nPesos := VAL(FWInputBox('Insira o peso da pessoa: '))
    
    if nPesos > 90 //* Se o peso for maior de 90 o valor do contador aumentará em 1, assim, saberemos a quantidade de pessoas com mais de 90 kg
      nCont++
    endif
  next

  MSGINFO('Quantidade de pessoas com mais de 90 quilos: ' + Str(nCont) + CRLF +; 
          'A média das idades das sete pessoas: ' + Str(nIdade/7))       //*O calculo da média das idades foi realizado aqui, sendo 7 valores inseridos.

Return 
