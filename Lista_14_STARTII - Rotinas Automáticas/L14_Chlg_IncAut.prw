
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function IncAut
  Incluir Produtos a partir de um doc '.csv'
  @type  Function
  @author Natan Jorge
  @since 05/05/2023
  /*/
User Function IncAut()
    Local cPasta    := 'C:\TOTVS\VsCode\Lista 14\', cArquivo  := 'Produtos.csv'
    Local oArq      := FWFileReader():New(cPasta + cArquivo)
	Local aArea     := GetArea()
	Local cLine     := ''
    Local aLinha    := {}
	Private cCode   := '', cDesc := '', cTipo := '', cUM := '', nPrV := 0

	if oArq:Open()
		if !oArq:EOF()
			while oArq:HasLine()

				cLine := oArq:GetLine()
				aLinha := StrToKArr(cLine, ';')

				cCode  := aLinha[1]
				cDesc  := SUBSTRING(aLinha[2], 1, 30) //! O campo cDescrição tem tamanho de 30 caracteres
				cTipo  := aLinha[3]
				cUM    := aLinha[4]
				nPrV   := aLinha[5]

				if cCode != 'Codigo' .and. aLinha[6] == 'A'
					AddProd()
				endif
			enddo
		endif
	endif

	RestArea(aArea)

Return

Static Function AddProd()
	Local aDados := {}
	Local nOper  := 3
    Private lMsErroAuto := .F.

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

	Aadd(aDados, {'B1_FILIAL', FwFilial('SB1'), NIL})
	Aadd(aDados, {'B1_COD'   , cCode          , NIL})
	Aadd(aDados, {'B1_DESC'  , cDesc          , NIL})
	Aadd(aDados, {'B1_TIPO'  , cTipo          , NIL})
	Aadd(aDados, {'B1_UM'    , cUM            , NIL})
	Aadd(aDados, {'B1_PRV1'  , val(nPrV)      , NIL})
	Aadd(aDados, {'B1_LOCPAD', '01'           , NIL})

  	MSExecAuto({|x, y| MATA010(x, y)}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif 
return
