
#INCLUDE 'TOTVS.CH'
/*17 - Acrescente uma mensagem 'NOVO C�LCULO
(S/N)?' ao final do exerc�cio anterior. Se for
respondido 'S' deve retornar e executar um novo
c�lculo, caso contr�rio dever� encerrar o
algoritmo.*/

User Function ReiniciaNotas() 

  Local nNota_1 := 0, nNota_2 := 0, nMedia := 0
  Local cContinua := ''
  Local nNovoCalculo := .T. //!Vari�vel para controlar o loop 


  while nNovoCalculo //!Loop para realizar v�rios c�lculos
  
    nNota_1 := VAL(FwInputBox('Insira a primeira nota: ')) // L� a primeira nota

    while nNota_1 < 0 .or. nNota_1 > 10 // Verifica se a primeira nota � v�lida
      FWAlertError('VALOR INV�LIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
      nNota_1 := VAL(FwInputBox('Insira a primeira nota: '))
    end

    nNota_2 := VAL(FwInputBox('Insira a segunda nota: ')) // L� a segunda nota

    while nNota_2 < 0 .or. nNota_2 > 10 // Verifica se a segunda nota � v�lida
      FWAlertError('VALOR INV�LIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
      nNota_2 := VAL(FwInputBox('Insira a segunda nota: '))
    end
    
    nMedia := (nNota_1+nNota_2) / 2 // Calculo da m�dia

    FwAlertInfo('A m�dia �: ' + ALLTRIM(STR(nMedia)), 'M�DIA') // Exibindo o resultado

    cContinua := FwInputBox("NOVO C�LCULO (S/N)? ") //Pergunta se o usu�rio deseja realizar um novo c�lculo

    if UPPER(cContinua) != "S" //!Verifica a resposta, se for diferente de S (sim), encerrar� o c�lculo.
      nNovoCalculo = .F.
    endif
  end

  FwAlertInfo('Encerrando o c�lculo de m�dias. ')

Return
