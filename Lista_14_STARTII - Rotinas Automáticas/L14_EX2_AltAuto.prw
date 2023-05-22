#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

//! • 2 – Desenvolva uma rotina para alterar
//! automaticamente o cadastro criado no exercício
//! anterior. Deve-se alterar o endereço e o
//! telefone do cliente.
//! Obs: Se houver algum problema no processo,
//! deve ser apresentada uma mensagem que indica
//! onde está o problema.

/*/{Protheus.doc} User Function AltAuto
  Alteração de clientes por rotina automática 
  @type  Function
  @author Natan Jorge
  @since 05/05/2023
  /*/
User Function AltAuto()

  Local aVetor := {}
  Local nOper  := 4
  Private lMsErroAuto := .F.
  
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

  Aadd(aVetor, {'A1_COD', 'AUT001', NIL})
  Aadd(aVetor, {'A1_END', 'RUA FAÇA TESTES', NIL})
  Aadd(aVetor, {'A1_TEL', '40028922',NIL})
  
  MSExecAuto({|x, y| MATA030(x, y)}, aVetor, nOper)

  if lMsErroAuto
    MostraErro()
  endif
Return
