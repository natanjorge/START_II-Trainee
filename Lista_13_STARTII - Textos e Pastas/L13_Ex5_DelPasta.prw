#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function DelPasta
  Fun��o para exemplificar a exclus�o de pastas atrav�s do ADVPL.
  @type  Function
  @author Natan Jorge
  @since 24/04/2023
  /*/
User Function DelPasta()
  Local cPasta    := GetTempPath()+'Lista 13 � Ex1\' //! Pasta que ser� exclu�da
  Local aArquivos := Directory(cPasta + '*.*' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordena��o dos arquivos*/)
  Local nI        := 0

  if ExistDir(cPasta) //!Confere se a pasta existe
    if MsgYesNo('Confirma a exclus�o da pasta?', 'Aten��o')
      if LEN(aArquivos) > 0
        for nI := 3 to LEN(aArquivos)
          if FErase(cPasta + aArquivos[nI][1]) == -1 //!Erro na dele��o
            MsgStop('Houve um erro ao excluir o arquivo ' + aArquivos[nI][1])
          endif
        next
      endif

      if DirRemove(cPasta) //! Apagando a pasta
        FwAlertSuccess('Pasta removida com sucesso!', 'Conclu�do!')
      else
        FwAlertError('Houve um erro ao remover a pasta!', 'Aten��o!')
      endif
    endif
  endif
Return
