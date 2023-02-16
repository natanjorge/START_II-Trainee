#INCLUDE 'TOTVS.CH'
/*• 35 - Faça um programa que receba várias idades e
que calcule e mostre a média das idades digitadas.
Finalize o processo de entrada de dados digitando
a idade igual a zero   */

User Function MediaFinaliza() 
 
  Local nIdade := 1, nTotalIdade := 0, nCont := 0

  while nIdade <> 0
    nIdade := VAL(FWInputBox('Insira a idade da pessoa: ')) //Se a idade for igual a 0 o programa se encerra
    
    if nIdade <> 0                  //A idade é armazenada na variável nTotalIdade e o contador contabiliza as repetições do ciclo
      nTotalIdade += nIdade
      nCont++
    endif
  end

  if nCont > 0
    MSGINFO('Média das idades: ' + ALLTRIM(Str(nTotalIdade/nCont))) // Calculo da média das idades
  else
    MSGINFO('Não foram digitadas idades! ')
  endif

Return 
