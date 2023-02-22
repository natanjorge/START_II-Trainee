#INCLUDE 'TOTVS.CH'

User Function LISTA3_16()
  Local cNome := "", cMsg := ""
  Local nNum  := 0

  cNome := FwInputBox("Informe seu nome: ")

  For nNum := Len(cNome) to 1 step -1
    cMsg+=SUBSTR(cNome, nNum, 1)
  Next

  MsgInfo(cMsg, "Seu Nome de trás pra frente!")

Return
