#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

//! • 3 – Desenvolva um programa que executa uma
//! rotina automática para excluir um Fornecedor.
//! Obs: Se houver algum problema no processo,
//! deve ser apresentada uma mensagem que indica
//! onde está o problema.

/*/{Protheus.doc} User Function ExcAuto
  Excluir clientes por rotina automática 
  @type  Function
  @author Natan Jorge
  @since 05/05/2023
  /*/
User Function ExcAuto()

  Local aVetor := {}
  Local nOper  := 5
  Private lMsErroAuto := .F.
  
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

  Aadd(aVetor, {'A2_COD',  '333333',                       NIL})
  Aadd(aVetor, {'A2_NOME', 'EXCLUIDO - ROTINA AUTOMÁTICA', NIL})

  MSExecAuto({|x, y| MATA020(x, y)}, aVetor, nOper)

  if lMsErroAuto
    MostraErro()
  endif
Return
