#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function CriaPasta
  Função para exemplificar a criação de pastas através do ADVPL.
  @type  Function
  @author Natan Jorge
  @since 24/04/2023
  /*/
User Function CriaCopi()
  Local cCaminho   := 'C:\TOTVS\Protheus\protheus_data'
  Local cNomePasta := '\Lista 13\'
  Local cPastaOrig := GetTempPath()+'Lista 13 – Ex1\'
  Local cPastaDest := cCaminho+cNomePasta
  Local aArquivos  := Directory(cPastaOrig + '*.*' /*Caminho + Tipos de Arquivos*/, 'D' /*Atribuos*/,/*Comp*/,/*Case Sensitive*/, 1 /*Ordenação dos arquivos*/)
  Local nI         := 0

  //? Criação da pasta
  if !ExistDir(cPastaDest)
    MakeDir(cPastaDest)
    FwAlertSuccess('Pasta criada com sucesso!', 'Concluído!')
  else
    FwAlertInfo('Uma pasta já foi criada com o mesmo nome!', 'Atenção!')
  endif
  //? Cópia dos arquivos
  if LEN(aArquivos) > 0
      for nI := 3 to LEN(aArquivos)
        if !CpyT2S(cPastaOrig + aArquivos[nI][1], cNomePasta)      
          MsgStop('Houve um erro ao copiar o arquivo ' + aArquivos[nI][1])
        endif
      next
      FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Concluído!')
  else
    FwAlertInfo('A pasta não contem nenhum arquivo!', 'Atenção!')
  endif
Return
