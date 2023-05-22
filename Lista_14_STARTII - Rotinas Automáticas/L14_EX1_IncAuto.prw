#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

//! � 1 � Desenvolva um programa que executa uma
//! rotina autom�tica para cadastrar um cliente.
//! Obs: Preencher apenas os campos obrigat�rios.


/*/{Protheus.doc} User Function IncAuto
  Inclus�o de clientes por rotina autom�tica 
  @type  Function
  @author Natan Jorge
  @since 05/05/2023
  /*/
User Function IncAuto()
  Local aVetor := {}
  Local nOper  := 3
  Private lMsErroAuto := .F.
  
  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
  
  Aadd(aVetor, {'A1_FILIAL', xFilial('SA1'),     NIL})
  Aadd(aVetor, {'A1_COD',    'AUT001',           NIL})
  Aadd(aVetor, {'A1_LOJA',   '01',               NIL})
  Aadd(aVetor, {'A1_NOME',   'MURIEL ZOUNAR',    NIL})
  Aadd(aVetor, {'A1_NREDUZ', 'MURIEL TECH SA',   NIL})
  Aadd(aVetor, {'A1_END',    'RUA MUMU DO MUMU', NIL})
  Aadd(aVetor, {'A1_TIPO',   'F',                NIL})
  Aadd(aVetor, {'A1_EST',    'SP',               NIL})
  Aadd(aVetor, {'A1_MUN',    'JUNDIA�',          NIL})
  
  MSExecAuto({|x, y| MATA030(x, y)}, aVetor, nOper)
  
  if lMsErroAuto
    MostraErro()
  endif
Return
