#INCLUDE 'TOTVS.CH'

User Function LISTA3_13()
  Local cDia := ""
  Local nNum := 0
  Local aSemana := {"Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"}

	while nNum <= 0 .or. nNum > 7
  
		nNum := Val(FwInputBox("Por favor informe um número de 1 a 7: "))

		If nNum <= 0 .or. nNum > 7
			MsgAlert("Número inválido!")
		EndIf
   	End

	cDia := cValtoChar(aSemana[nNum])

  	FwAlertInfo("O dia da semana relacionado ao número informado é: " + cDia )
Return
