#INCLUDE 'TOTVS.CH'
/*� 35 - Fa�a um programa que receba v�rias idades e
que calcule e mostre a m�dia das idades digitadas.
Finalize o processo de entrada de dados digitando
a idade igual a zero   */

User Function MediaFinaliza() 
 
  Local nIdade := 1, nTotalIdade := 0, nCont := 0

  while nIdade <> 0
    nIdade := VAL(FWInputBox('Insira a idade da pessoa: ')) //Se a idade for igual a 0 o programa se encerra
    
    if nIdade <> 0                  //A idade � armazenada na vari�vel nTotalIdade e o contador contabiliza as repeti��es do ciclo
      nTotalIdade += nIdade
      nCont++
    endif
  end

  if nCont > 0
    MSGINFO('M�dia das idades: ' + ALLTRIM(Str(nTotalIdade/nCont))) // Calculo da m�dia das idades
  else
    MSGINFO('N�o foram digitadas idades! ')
  endif

Return 
