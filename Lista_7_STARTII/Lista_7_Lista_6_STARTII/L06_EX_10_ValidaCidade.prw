#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'


/*/ {Protheus.doc} User Function ValidaCidade
    Realiza a busca no bando de dados e retorna a confirmação se já tem o município informado cadastrado.
    @type  User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param aArea, cAlias, cQuery, cMunic, lConfirma, cCidadeValida, cEstadoValida
    @return lConfirma
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function ValidaCidade(cCidadeValida, cEstadoValida) 

    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := '', cMunic := ''
    Local lConfirma := .F.

    cQuery := 'SELECT CC2_EST, CC2_MUN ' + CRLF + "FROM " + RetSqlName('CC2') + " CC2 " + "WHERE CC2_EST = '" + cEstadoValida + "'"
 
    TCQUERY cQuery ALIAS &(cAlias) NEW

    while &(cAlias)->(!EOF())

        cMunic := &(cAlias)->(CC2_MUN)

        if cCidadeValida == cMunic
            lConfirma := .T.
            exit
        endif

        &(cAlias)->(DbSkip())
    end

    &(cAlias)->(DBCLOSEAREA())
    RestArea(aArea)

Return lConfirma


