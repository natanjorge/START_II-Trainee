#INCLUDE 'TOTVS.CH'
/*� 34 - Fa�a um programa que receba a idade e o peso
de sete pessoas. Calcule e mostre:
o A quantidade de pessoas com mais de 90
quilos
o A m�dia das idades das sete pessoas     */

User Function IdadeEPeso() 
 
Local nI := 0, nCont := 0, nIdade := 0, nPesos := 0

  for nI := 1 to 7
    nIdade += VAL(FWInputBox('Insira a idade da pessoa: '))
    nPesos := VAL(FWInputBox('Insira o peso da pessoa: '))
    
    if nPesos > 90 //* Se o peso for maior de 90 o valor do contador aumentar� em 1, assim, saberemos a quantidade de pessoas com mais de 90 kg
      nCont++
    endif
  next

  MSGINFO('Quantidade de pessoas com mais de 90 quilos: ' + Str(nCont) + CRLF +; 
          'A m�dia das idades das sete pessoas: ' + Str(nIdade/7))       //*O calculo da m�dia das idades foi realizado aqui, sendo 7 valores inseridos.

Return 
