#INCLUDE 'TOTVS.CH'


/*/ {Protheus.doc} User Function MT120PCOL
    Ponto de entrada que valida os pedidos de compra, não é possível adicionar uma linha no grid caso não seja preenchido.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param lRet, nOper, nCont
    @return lRet
    @example
    (examples)
    @see (links_or_references)
    /*/
#INCLUDE "PROTHEUS.CH"
 
User Function MT120PCOL()
     
    Local lRet  := .T.
    Local nOper := PARAMIXB[1]
    Local nCont := 0
     

    If nOper == 1  //-- 1 = Chamada via A120LINOK, 2 = Chamada via A120TUDOK
        for nCont := 1 to LEN(ACOLS)
            if EMPTY( ACOLS[nCont][33] )
                lRet := .F.
                Help("",1,"MT120PCOL",,"Insira o tipo de entrada!",1)
            endif
        next
    EndIf
 
Return lRet
