programa
{
	
	funcao inicio()
	{
		// Definição de variáveis
		inteiro quantidadeSementes, quantidadeFeita, quantidadeNecessaria = 30
		real ganho, preco = 12.50

		// Entrada de dados
		escreva("Insira a quantidade de sementes: ")
		leia(quantidadeSementes)

		// Processamento de dados
		quantidadeFeita = quantidadeSementes / quantidadeNecessaria
		ganho = quantidadeFeita * preco

		// Saída de dados
		escreva("Fora feitas ", quantidadeFeita, " pulseiras, que podem ser vendidadas por ", ganho)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 459; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */