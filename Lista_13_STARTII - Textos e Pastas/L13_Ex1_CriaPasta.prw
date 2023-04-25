#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Fun��o para criar pastas no arquivo tempor�rio
  @type  Function
  @author Natan Jorge
  @since 24/04/2023
  /*/
User Function CriaPasta()
  Local cCaminho   := GetTempPath()
  Local cNomePasta := 'Lista 13 � Ex1\'

  if !ExistDir(cCaminho + cNomePasta)
    if MakeDir(cCaminho + cNomePasta) == 0 
      if ExistBlock('EscreveTxt')             
        ExecBlock('EscreveTxt', .F., .F., cCaminho + cNomePasta)
      endif
    else
      FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
    endif
  else
    if ExistBlock('Escreve')
      ExecBlock('Escreve', .F., .F., cCaminho + cNomePasta)
    endif
  endif
Return
