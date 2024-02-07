programa
{
	
	funcao inicio()
	{
		inteiro quantidadeAdultos, quantidadeCriancas
		real valorAdulto, valorCrianca

		escreva("Quantidade de adultos: ")
		leia(quantidadeAdultos)
		escreva("Preço por dose de adulto: ")
		leia(valorAdulto)

		escreva("Quantidade de criança: ")
		leia(quantidadeCriancas)
		escreva("Preço por dose de criança: ")
		leia(valorCrianca)


		escreva("\nValor total: R$", (quantidadeAdultos * valorAdulto * 4 + quantidadeCriancas * valorCrianca * 3))
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 307; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */