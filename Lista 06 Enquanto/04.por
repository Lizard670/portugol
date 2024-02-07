programa
{
	
	funcao inicio()
	{
		inteiro preco=1, total=0, menorPreco=2147483647

		enquanto (preco>0)
		{
			escreva("Preço: R$")
			leia(preco)
			se (preco>0) {total += preco
			se (menorPreco>preco) {menorPreco = preco}}
		}
		escreva("\nTotal a ser Pago: R$", total,
		        "\nMenor valor: R$", menorPreco)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 322; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */