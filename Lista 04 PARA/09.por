programa
{
	
	funcao inicio()
	{
		inteiro numeroInicial, quantidade, variacao
		
		escreva("Numero inicial: ")
		leia(numeroInicial)

		escreva("Quantidade de vezes: ")
		leia(quantidade)

		escreva("Variação: ")
		leia(variacao)

		para (inteiro i=0; i<quantidade; i++) {escreva("\n", numeroInicial + i*variacao)}
		escreva("\n\nSaida considerando o valor inicial ", numeroInicial, " variação de ", variacao, " em ", variacao, " e impressão de 5 números")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 169; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */