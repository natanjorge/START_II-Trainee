
#INCLUDE 'TOTVS.CH'

User Function LISTA3_19()
  Local cFrase := ""
  Local nEspaço:= 0, nA := 0, nE := 0, nI := 0, nO := 0, nU := 0, nCel := 0

  cFrase := Upper(FwInputBox("Escreva uma frase"))

  For nCel := 1 to Len(cFrase)
    If ASC(Substr(cFrase, ncel, 1)) == 32
      nEspaço++
    EndIf 
    If Substr(cFrase, nCel, 1) == "A"
      nA++
    EndIf
    IF Substr(cFrase, nCel, 1) == "E"
      nE++
    EndIf
    IF Substr(cFrase, nCel) == "I"
      nI++
    EndIf
    IF Substr(cFrase, nCel) == "O"
      nO++
    EndIf
    IF Substr(cFrase, nCel) == "U"
      nU++
    ENDIF
NEXT

  FwAlertInfo(Str(nEspaço) + " espaços, "+CRLF+Str(nA) + " vogais A; "+CRLF+Str(nE) + " vogais E; "+CRLF+Str(nI) + " vogais I; "+CRLF+Str(nO) + " vogais O; "+CRLF+Str(nU) + " vogais U; "+CRLF,"A frase digitada possui: ")

Return
