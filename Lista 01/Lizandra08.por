programa
{
	
	funcao inicio()
	{
		// Definições de variáveis
		real cotacaoEuro, cotacaoDolar, custoEuro, custoDolar, quantidadeDolares, quantidadeEuros

		// Entrada de dados
		escreva("Cotação do euro: ")
		leia(cotacaoEuro)

		escreva("Cotação do dolar: ")
		leia(cotacaoDolar)
		

		escreva("Quantos euros você quer comprar? ")
		leia(quantidadeEuros)

		escreva("Quantos dolares você quer comprar? ")
		leia(quantidadeDolares)

		// Processamento de dados
		custoEuro  = quantidadeEuros   * cotacaoEuro
		custoDolar = quantidadeDolares * cotacaoDolar

		// Saída de dados
		escreva("\nSerá necessário ", custoEuro, " reais para comprar ", quantidadeEuros, " euros\n")
		escreva("Será necessário ", custoDolar, " reais para comprar ", quantidadeDolares, " dolares\n")
		escreva("E será necessário ", (custoEuro + custoDolar), " para comprar ambos")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 280; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */