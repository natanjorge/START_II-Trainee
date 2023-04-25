#Include "TOTVS.ch"

/*/{Protheus.doc} User Function CopiaPDF
Função que copia arquivos PDF para outra pasta
@type  Function
@author Natan Jorge
@since 24/04/2023
/*/
User Function MA410MNU()

    Local aArea := GetArea()
     
    aadd(aRotina, {"Copia PDF", "U_CopiaPDF", 0 , 4, 0 , Nil})
     
    RestArea(aArea)
Return

User Function CopiaPDF()

    Local cPastOri := "\pedidos de venda\"   //! pasta com os PDFs
    Local cPastDest := "C:\Vendas Protheus\" //! pasta destino
    Local aArquivos := {}
    Local nCont     := 0
 
    If !ExistDir(cPastDest) //! criação da pasta, caso não exita
        MakeDir(cPastDest)
    EndIf
 
    aDir(cPastOri + "*.pdf", aArquivos) //! buscando os PDFs
 
    For nCont := 1 To Len(aArquivos)
        __CopyFile(cPastOri + aArquivos[nCont], cPastDest + aArquivos[nCont]) //! copiando os PDFs  para a pasta de destino
    Next 
 
Return
