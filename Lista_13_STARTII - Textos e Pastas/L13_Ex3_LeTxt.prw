#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function LeTxt
  Função para ler arquivos de texto
  @type  Function
  @author Natan Jorge
  @since 24/04/2023
  /*/
User Function LeTxt()
  Local cPasta    := GetTempPath()+'Lista 13 – Ex1\'
  Local cArquivo  := 'Lista13_Ex2.txt'  
  Local oArq      := FWFileReader():New(cPasta + cArquivo)

  Local cTxtLinha := ''
 
  if oArq:Open()                      
    if !oArq:EoF()                     
      while (oArq:HasLine())           
        cTxtLinha += oArq:GetLine(.T.)
      enddo
    endif
    oArq:Close()
  endif
  FwALertInfo(cTxtLinha, 'Conteúdo do arquivo:') 
Return
