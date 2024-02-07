programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		inteiro tentativa, quantidadeTentativas=0, soma=0, somaTotal, sorteado
		
		sorteado = u.sorteia(0, 10)
		
		escreva("Tente acertar o número de 0 a 10: ")
		leia(tentativa)

		enquanto(sorteado != tentativa)
		{
			quantidadeTentativas++
			soma += tentativa
			
			escreva("Tente acertar o número de 0 a 10: ")
			leia(tentativa)
		}
		somaTotal = soma + tentativa

		escreva("\nVocê acertou!",
		        "\nTentativas erradas:  ", quantidadeTentativas,
		        "\nTotal de tentativas: ", quantidadeTentativas+1,
		        "\nSoma das tentativas erradas: ", soma,
		        "\nSoma total das tentativas:   ", somaTotal)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 690; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */