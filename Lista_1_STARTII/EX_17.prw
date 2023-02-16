
#INCLUDE 'TOTVS.CH'
/*17 - Acrescente uma mensagem 'NOVO CÁLCULO
(S/N)?' ao final do exercício anterior. Se for
respondido 'S' deve retornar e executar um novo
cálculo, caso contrário deverá encerrar o
algoritmo.*/

User Function ReiniciaNotas() 

  Local nNota_1 := 0, nNota_2 := 0, nMedia := 0
  Local cContinua := ''
  Local nNovoCalculo := .T. //!Variável para controlar o loop 


  while nNovoCalculo //!Loop para realizar vários cálculos
  
    nNota_1 := VAL(FwInputBox('Insira a primeira nota: ')) // Lê a primeira nota

    while nNota_1 < 0 .or. nNota_1 > 10 // Verifica se a primeira nota é válida
      FWAlertError('VALOR INVÁLIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
      nNota_1 := VAL(FwInputBox('Insira a primeira nota: '))
    end

    nNota_2 := VAL(FwInputBox('Insira a segunda nota: ')) // Lê a segunda nota

    while nNota_2 < 0 .or. nNota_2 > 10 // Verifica se a segunda nota é válida
      FWAlertError('VALOR INVÁLIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
      nNota_2 := VAL(FwInputBox('Insira a segunda nota: '))
    end
    
    nMedia := (nNota_1+nNota_2) / 2 // Calculo da média

    FwAlertInfo('A média é: ' + ALLTRIM(STR(nMedia)), 'MÉDIA') // Exibindo o resultado

    cContinua := FwInputBox("NOVO CÁLCULO (S/N)? ") //Pergunta se o usuário deseja realizar um novo cálculo

    if UPPER(cContinua) != "S" //!Verifica a resposta, se for diferente de S (sim), encerrará o cálculo.
      nNovoCalculo = .F.
    endif
  end

  FwAlertInfo('Encerrando o cálculo de médias. ')

Return
