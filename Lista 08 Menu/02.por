programa
{
	
	funcao inicio()
	{
		inteiro opcao, quantidadeTotalVagas, vagasVendidas=0, precoIndividual, quantidadePassagens, menorQuantidade=9999999, quantidadeVendas=0
		real totalPagamento, totalArrecadado=0.0, maiorValor=-999999.9, percentual=0.0
		cadeia tipoPagamento, 
			menu = "\n1. Lançar venda"+
			"\n2. Alterar quantidade de vagas veículo"+
			"\n3. Finalizar vendas "+
			"\n4. Visualizar relatório final da viagem "+
			"\n0. Sair"+
			"\n\nInforme a opção: "
		logico vendasNaoFinalizadas = verdadeiro


		escreva("Informe a quantidade de vagas do veiculo: ")
		leia(quantidadeTotalVagas)
		escreva("Informe o valor da passagem individual: ")
		leia(precoIndividual)

		escreva (menu)
		leia(opcao) 

		enquanto(opcao!=0)
		{
			se(opcao==1 e vendasNaoFinalizadas)
			{
				escreva ("informe o numero de passagens desejadas: ")
				leia(quantidadePassagens)
				escreva ("Informe o tipo de pagamento: ")
				leia(tipoPagamento)

				se (quantidadeTotalVagas-vagasVendidas >= quantidadePassagens)
				{
					totalPagamento = precoIndividual * quantidadePassagens * 1.0
						
					se (quantidadePassagens > 5)     {totalPagamento *= 0.95}
					se (tipoPagamento == "PIX")      {totalPagamento *= 0.965}
					se (totalPagamento > maiorValor) {maiorValor = totalPagamento}
					se (tipoPagamento == "PIX" e quantidadePassagens < menorQuantidade) {menorQuantidade = quantidadePassagens}
						
					quantidadeVendas++
					vagasVendidas += quantidadePassagens
					percentual = (vagasVendidas * 100.0) / quantidadeTotalVagas
					totalArrecadado += totalPagamento
				}
			}
			senao se(opcao==2 e vendasNaoFinalizadas)
			{
				escreva("Informe a quantidade de vagas do veiculo: ")
				leia(quantidadeTotalVagas)
			}
			senao se(opcao==3) {vendasNaoFinalizadas = falso}
			senao se(opcao==4 e nao(vendasNaoFinalizadas))
			{
				escreva ("\nHouveram ", quantidadeVendas, " vendas efetivadas")
				escreva ("\nFoi arrecadado R$", totalArrecadado, " pelas venda ")
				escreva ("\nA maior venda foi no valor de R$", maiorValor)
				escreva ("\nA menor quantidade de pessoas por PIX foi ", menorQuantidade)
				escreva ("\nO veículo está ", percentual, "% lotado\n")
				
			}
			senao se(opcao==4) {escreva("Finalize as vendas para poder ver o relatório")}

			escreva (menu)
			leia(opcao) 
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2271; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */