#INCLUDE 'TOTVS.CH'
/*• 38 - Faça um programa que receba a idade de dez
pessoas e que calcule e mostre a quantidade de
pessoas com idade maior ou igual a 18 anos.        */

User Function MaioridadePenal() 
 
  Local nIdade := 0, nQuant := 0, nCont := 0

  for nCont := 1 to 10
    nIdade := VAL(FWInputBox('Digite a idade da pessoa: '))
    
    if nIdade >= 18 //* Se a pessoa tiver mais de 18 anos adiciona 1 na variável nQuant, ou seja, um contador.
      nQuant++
    endif
  end

  FwAlertInfo('Quantidade de pessoas com idade maior ou igual a 18 anos: ' + ALLTRIM(STR(nQuant)))

Return
