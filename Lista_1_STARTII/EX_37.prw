#INCLUDE 'TOTVS.CH'
/*• 37 - Uma loja tem tem uma política de descontos de
acordo com o valor da compra do cliente. Os
descontos começam a partir dos R$500. A cada 100
reais acima dos R$500,00 o cliente ganha 1% de
desconto cumulativo até 25%.
o Por exemplo: R$500 = 1%
o R$600,00 = 2%
o R$700,00 = 3%
o ...
Faça um programa que exiba essa tabela de
descontos no seguinte formato:
Valor da compra – porcentagem de desconto – valor final           */

User Function DescontoCompra() 
 
  Local nValor_Compra := 0, nValor_Final := 0, nDesc := 0

  nValor_Compra := VAL(FWInputBox('Insira o valor da compra: '))

  if nValor_Compra >= 500 .and. nValor_Compra < 600
    nDesc := 1
    nValor_Final := nValor_Compra*(1-(nDesc/100))        //* 1% de desconto

  elseif nValor_Compra >= 500 .and. nValor_Compra < 2900 //* Descontos de 2% até 24%
    nDesc:= ((nValor_Compra-500) / 100) + 1              //* Subtraí por 500 e dividi o valor por 100 (a soma do 1 é devido o 500), assim saberemos quantos ciclos de desconto foram realizados com base no valor
    nDesc:=INT(nDesc)                                    //! Transformei em inteiro
    nValor_Final := nValor_Compra * (1-(nDesc/100))

  elseif nValor_Compra >= 2900                           //* Descontos de 25%
    nDesc := 25
    nValor_Final := nValor_Compra * (1-(nDesc/100))

  else
    FwAlertInfo('Valores a baixo de R$ 500 não tem descontos.')
    BREAK                                                //* Encerra o programa se não tem descontos
  endif

  FwAlertInfo('O valor da compra de R$' + ALLTRIM(StrZero(nValor_Compra,7,2)) + CRLF +;
              'O desconto é de '+ ALLTRIM(StrZero(nDesc,5,2)) + '%' + CRLF +;
              'O valor final é de R$' + ALLTRIM(StrZero(nValor_Final,7,2)))

Return
