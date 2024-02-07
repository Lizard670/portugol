programa
{
	// Retorna numero bonito em troca de uma mensagem de aviso 👍
	funcao real nb(real numeroFeio) {inteiro numeroInteiro = (numeroFeio*100+4/9) retorne (numeroInteiro/100.0)}
	
	funcao inicio()
	{
		inteiro n, valorAtual, quantidadePar=0, maiorPar=-999999999, menorImpar=999999999, produto2e3=1
		real mediaPar=0.0, mediaImpar=0.0, mediaGeral=0.0, percentualPar

		escreva("Digite uma quantidade maior que 0: ")
		leia(n)

		se (n > 0)
		{
			para (inteiro i=0; i<n; i++)
			{
				escreva(i+1, "° número: ")
				leia(valorAtual)

				// Pares
				se (valorAtual%2 == 0)
				{
					quantidadePar++                                                    // Parte A
					se (valorAtual > maiorPar)   {maiorPar   = valorAtual}             // Parte B
					mediaPar   += valorAtual                                           // Parte D
				}
				// Impares
				senao
				{
					se (valorAtual < menorImpar) {menorImpar = valorAtual}             // Parte B
					mediaImpar += valorAtual                                           // Parte D
				}

				se (valorAtual%2 == 0 ou valorAtual%3 == 0) {produto2e3 *=  valorAtual} // Parte C
				mediaGeral += valorAtual                                                // Parte G
			}
			percentualPar = (1.0*quantidadePar/n)                                        // Parte E (e tecnicamente F)

			escreva("\n",   "a)Quantidade de números pares: ", quantidadePar,
			        "\n\n", "b)Maior número par:   ", maiorPar,
			        "\n",   "  Menor número impar: ", menorImpar,
			        "\n\n", "c)Produto dos multiplos de 2 e 3: ", produto2e3,
			        "\n\n", "d)Média dos números ímpares: ", nb(mediaImpar/(n-quantidadePar)),
			        "\n",   "  Média dos números pares:   ", nb(mediaPar  /(  quantidadePar)),
			        "\n\n", "e)Percentual de números pares:   ", nb(      percentualPar*100), "%",
			        "\n",   "f)Percentual de números ímpares: ", nb(100 - percentualPar*100), "%",
			        "\n\n", "g)Media geral: ", nb(mediaGeral/n), "\n")
		}
		senao {escreva("Quantidade invalida.")}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 147; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {numeroFeio, 4, 21, 10}-{mediaPar, 9, 7, 8}-{mediaImpar, 9, 21, 10}-{mediaGeral, 9, 37, 10}-{percentualPar, 9, 53, 13};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */