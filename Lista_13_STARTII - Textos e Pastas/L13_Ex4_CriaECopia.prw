#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Fun��o para exemplificar a cria��o de pastas atrav�s do ADVPL.
  @type  Function
  @author Natan Jorge
  @since 24/04/2023
  /*/
User Function CriaCopi()
  Local cCaminho   := 'C:\TOTVS\Protheus\protheus_data'
  Local cNomePasta := '\Lista 13\'
  Local cPastaOrig := GetTempPath()+'Lista 13 � Ex1\'
  Local cPastaDest := cCaminho+cNomePasta
  Local aArquivos  := Directory(cPastaOrig + '*.*' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordena��o dos arquivos*/)
  Local nI         := 0

  //? Cria��o da pasta
  if !ExistDir(cPastaDest)
    MakeDir(cPastaDest)
    FwAlertSuccess('Pasta criada com sucesso!', 'Conclu�do!')
  else
    FwAlertInfo('Uma pasta j� foi criada com o mesmo nome!', 'Aten��o!')
  endif
  //? C�pia dos arquivos
  if LEN(aArquivos) > 0
      for nI := 3 to LEN(aArquivos)
        if !CpyT2S(cPastaOrig + aArquivos[nI][1], cNomePasta)      
          MsgStop('Houve um erro ao copiar o arquivo ' + aArquivos[nI][1])
        endif
      next
      FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Conclu�do!')
  else
    FwAlertInfo('A pasta n�o contem nenhum arquivo!', 'Aten��o!')
  endif
Return
