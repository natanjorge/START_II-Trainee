#INCLUDE 'TOTVS.CH'

User Function LISTA3_15()

	Local nTemp   := 0, nSoma      := 0, nMedia  := 0, nCont   := 0
	Local cMsg    := '', cArmazMes :=''
	Local aTemp   := {}

	For nCont := 1 to 12
		nTemp := Val(FwInputBox('Informe a temperatura do mês de ' + mesextenso(nCont)))
		Aadd(aTemp, nTemp)

		nSoma += nTemp
	Next

  	nMedia := nSoma / 12

    For nCont := 1 to 12
		cArmazMes := MesExtenso(nCont)

		if aTemp[nCont] > nMedia
			cMsg += cArmazMes +' - '+  cValToChar(aTemp[nCont]) +'°C' + CRLF
		endif
    NEXT

    FwAlertInfo('A média das temperaturas anual: ' + ALLTRIM(STR(nMedia,5,2)) + '°C' + CRLF + CRLF +;
				'As temperaturas dos seguintes meses estão acima da média: '     + CRLF + CRLF + cMsg,;
				'TEMPERATURAS ACIMA DA MÉDIA ')

Return
