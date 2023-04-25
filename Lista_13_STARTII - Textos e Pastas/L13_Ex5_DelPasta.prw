#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function DelPasta
  Função para exemplificar a exclusão de pastas através do ADVPL.
  @type  Function
  @author Natan Jorge
  @since 24/04/2023
  /*/
User Function DelPasta()
  Local cPasta    := GetTempPath()+'Lista 13 – Ex1\' //! Pasta que será excluída
  Local aArquivos := Directory(cPasta + '*.*' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordenação dos arquivos*/)
  Local nI        := 0

  if ExistDir(cPasta) //!Confere se a pasta existe
    if MsgYesNo('Confirma a exclusão da pasta?', 'Atenção')
      if LEN(aArquivos) > 0
        for nI := 3 to LEN(aArquivos)
          if FErase(cPasta + aArquivos[nI][1]) == -1 //!Erro na deleção
            MsgStop('Houve um erro ao excluir o arquivo ' + aArquivos[nI][1])
          endif
        next
      endif

      if DirRemove(cPasta) //! Apagando a pasta
        FwAlertSuccess('Pasta removida com sucesso!', 'Concluído!')
      else
        FwAlertError('Houve um erro ao remover a pasta!', 'Atenção!')
      endif
    endif
  endif
Return
