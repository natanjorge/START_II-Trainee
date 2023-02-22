#INCLUDE 'TOTVS.CH'

User Function LISTA3_20()

  Local cGat := "", cGrp := M->B1_TIPO

  Do Case
  Case cGrp == "MP"
    cGat := "MATERIA PRIMA PRODUCAO"

  Case cGrp == "PA"
    cGat := "PRODUTO PARA COMERCIALIZACAO"

  Otherwise
    cGat := "OUTROS PRODUTOS"

  EndCASE

Return cGat
