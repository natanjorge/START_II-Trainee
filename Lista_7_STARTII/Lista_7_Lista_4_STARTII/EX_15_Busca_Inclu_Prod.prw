#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'
 
/*
• 15 – Altere o programa do exercício 11. Agora, caso
o código informado não exista, o programa deve
perguntar se o usuário deseja cadastrar um novo
produto, se a resposta for sim, deve-se abrir a
tela de inclusão de produtos.
*/

/*/ {Protheus.doc} User Function EX_15_Busca_Inclu_Prod
    O programa solicita ao usuário o valor do Dólar e a quantidade de dólares que deseja converter.
    @type User Function
    @author Natan Jorge
    @since 13/03/2023
    @version version
    @param cTitle, cMsg_Cod, cCod, nOpcao, oDlg
    @return
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function EX_15_Busca_Inclu_Prod()

    Local cTitle := 'BUSCA PRODUTO', cMsg_Cod := 'Insira o código do produto: ', cCod := Space(15)
    Local nOpcao := 0
    Local oDlg   := nContL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL
    
    @ 014, 010 SAY    cMsg_Cod   SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cCod       SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Buscar'   SIZE 55, 11 OF oDlg PIXEL ACTION BuscaProduto(cCod)
    @ 035, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

/*/{Protheus.doc} Static Function BuscaProduto
    Receber os dois valores inseridos e apresentar o valor total convertido para reais.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param aArea, cAlias, cQuery, cMsg, cResposta, cQuery, cMsg, cResposta, nCont
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function BuscaProduto(cCod)

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := '', cMsg := '', cResposta := ''
	  Local nCont   := 0

    rpcsetenv('99', '01')

    cQuery := "SELECT "   + CRLF
    cQuery += "B1_COD "   + CRLF
    cQuery += ",B1_DESC " + CRLF
    cQuery += ",B1_PRV1 " + CRLF
    cQuery += "FROM "     + RetSqlName('SB1') + CRLF
    cQuery += " ORDER BY B1_DESC ASC "


    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cCod := ALLTRIM(cCod)

    While &(cAlias)->(!EOF())

      If cCod == ALLTRIM(&(cAlias)->(B1_COD))
        cMsg += 'Código: '    + &(cAlias)->(B1_COD) + CRLF +; 
                'Descrição: ' + &(cAlias)->(B1_DESC) + CRLF +;
                'Preço de venda: R$' + Alltrim(STR(&(cAlias)->(B1_PRV1))) + CRLF+;
                '_______________________' + CRLF + CRLF
        nCont++
      Endif

      &(cAlias)->(DbSkip())
    Enddo

    If nCont > 0
      FwAlertSuccess(cMsg, 'Dados do Produto')
    Else
		  FwAlertError('Código de produto inexistente no sistema')
      cResposta := UPPER(FwInputBox('Deseja inserir um novo produto no sistema? (S/N) '))
    
      if cResposta == 'N'
        FWAlertInfo('OKAY! Fim do programa', 'FIM DO PROGRAMA')
        BREAK
      elseif cResposta == 'S'
        InserirProduto()
      endif
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return


/*/{Protheus.doc} Static Function ValidaProd
    Receber os valores, realiza a validação e impressão.
    @type Static Function
    @author Natan Jorge
    @since 13/03/2023
    @param cCod, cDesc, cTip, cUnCont, cArm
    @return
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function ValidaProd(cCod, cDesc, cTip, cUnCont, cArm)

  if ALLTRIM(cCod) != ''.AND. ALLTRIM(cDesc) != '' .AND. ALLTRIM(cTip) != ''.AND. ALLTRIM(cUnCont) != '' .AND. ALLTRIM(cArm) != ''
    FWAlertSuccess('Produto cadastrado com sucesso!')
  else 
    FWAlertError('ERRO! Preencha todos os campos obrigatórios.')
  endif
Return
    