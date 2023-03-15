#Include "PROTHEUS.ch"
 
#Define CLR_VERDE     RGB(000,128,000)    //Cor Vermelha em RGB
#Define CLR_PRETO     RGB(000,000,000)    //Cor Preta em RGB

/*/ {Protheus.doc} User Function MBlkColor
    Programa para alterar a cor de fundo e texto dos produtos bloqueados.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aRet, CLR_VERDE, CLR_PRETO
    @return aRet
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function MBlkColor()

    Local aRet := {}
 
    aAdd(aRet, (CLR_PRETO)) //Cor do texto
    aAdd(aRet, (CLR_VERDE)) //Cor de fundo
 
Return aRet
