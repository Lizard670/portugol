programa
{
	
	funcao inicio()
	{
		real precoConcorrente
		
		escreva("Valor do orçamento do concorrente: ")
		leia(precoConcorrente)

		escreva("\nPagamento a vista: R$", (precoConcorrente*0.82),
		        "\nValor da parcela para pagamento em 48x: R$", (precoConcorrente*1.035),
		        "\nCredito para futuras revisões: R$", (precoConcorrente*0.085))
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 367; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */