programa
{
	
	funcao inicio()
	{
		inteiro quantidadeBrancos, quantidadeVermelhos, quantidadeCartelasBrancas, quantidadeCartelasVermelhas, quantidadeOmeletes, quantidadePaes
		real total
		
		escreva("Quantidade de ovos brancos: ")
		leia(quantidadeBrancos)

		escreva("Quantidade de ovos vermelhos: ")
		leia(quantidadeVermelhos)


		quantidadeCartelasBrancas   = (quantidadeBrancos   / 30)
		quantidadeCartelasVermelhas = (quantidadeVermelhos / 12)
		quantidadeOmeletes = (quantidadeBrancos   % 30) / 3
		quantidadePaes     = (quantidadeVermelhos % 12) / 2
		total = (quantidadeCartelasBrancas*42.5 + quantidadeCartelasVermelhas*17.5 + quantidadeOmeletes*6.5 + quantidadePaes*8)

		escreva("\n     Quantidade de cartelas vendidas de ovos branco: ", quantidadeCartelasBrancas,
		        "\n  Quantidade de bandejas vendidas de ovos vermelhos: ", quantidadeCartelasVermelhas,
		        "\n                    Quantidade de omeletes vendidos: ", quantidadeOmeletes,
		        "\n          Quantidade de pão com ovo mexido vendidos: ", quantidadePaes,
		        "\n\n      Total arrecadado com todas as vendas do dia: R$", total,
		        "\n\n Sobraram ", (quantidadeBrancos  %30%3), " ovos brancos",
		          "\n Sobraram ", (quantidadeVermelhos%12%2), " ovos vermelhos")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 334; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */