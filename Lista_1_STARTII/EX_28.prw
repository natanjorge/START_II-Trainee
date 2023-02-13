#INCLUDE 'TOTVS.CH'
/*• 28 - Escreva um algoritmo que permita a leitura
dos nomes de 10 pessoas e armazene os nomes
lidos em um array. Após isto, o algoritmo deve
permitir a leitura de mais 1 nome qualquer de
pessoa e depois escrever a mensagem ACHEI, se o
nome estiver entre os 10 nomes lidos
anteriormente (guardados no array), ou NÃO ACHEI
caso contrário.
*/

User Function ArrayNomes() 

  Local aNomes[10]
  Local nCont := 0
  Local cNomeProcurado := ''
  Local bEncontrado := .F.

  for nCont := 1 to 10
    aNomes[nCont] := FWInputBox('Escreva um nome: ')
  next

  cNomeProcurado := FWInputBox('Digite o nome que você está procurando: ')

  For nCont := 1 To 10
    if aNomes[nCont] == cNomeProcurado // Busca no array se o nome procurado consta lá
      bEncontrado := .T. //! Utilizei bEncontrado pois não ficará printando "não achei" ou "achei" toda vez que comparar as variáveis aNomes e cNomeProcurado 
      exit
    endif
  Next

  if bEncontrado
    FwAlertInfo("ACHEI!", "Resultado")
  else
    FwAlertInfo("NÃO ACHEI!", "Resultado")
  endif

Return
