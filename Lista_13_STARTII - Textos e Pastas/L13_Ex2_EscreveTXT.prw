#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Escreve
  Fun��o para criar arquivos de texto
  @type  Function
  @author Natan Jorge
  @since 24/04/2023
  /*/
User Function EscreveTxt()

  Local cPasta   := PARAMIXB   
  Local cArquivo := 'Lista13_Ex2.txt'                       
  Local oWriter := FWFileWriter():New(cPasta + cArquivo, .T.) 

  if File(cPasta + cArquivo) 
    FwAlertInfo('O arquivo j� existe na pasta!', 'Aten��o')
  else
    if !oWriter:Create() 
      FwAlertError('Houve um erro ao gerar o arquivo: ' + CRLF + oWriter:Error():Message, 'Aten��o') //! Message � um errorlog    

    else 
      oWriter:Write('Lista 13 Ex2!' + CRLF + 'Sentirei saudade das aulas!')

      oWriter:Close()

      if MsgYesNo('Arquivo gerado com sucesso (' + cPasta + cArquivo + ')!' + CRLF + 'Abrir arquivo?', 'Abrir?')
        ShellExecute('OPEN', cArquivo, '', cPasta, 1)
      endif
    endif
  endif
Return
