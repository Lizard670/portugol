programa
{
	inclua biblioteca Util --> u

	funcao inteiro distancia(inteiro n1, inteiro n2) {se (n1>n2) {retorne n1-n2} retorne n2-n1}
	
	funcao inicio()
	{
		inteiro tentativa, sorteado, limite, quantidadeTentativas=0, menorTentativa=99999999, tentativaMaisLonge
		
		escreva("Insira limite: ")
		leia(limite)
		
		sorteado = u.sorteia(0, limite)
		
		escreva("\nTente acertar o número: ")
		leia(tentativa)
		tentativaMaisLonge=tentativa

		enquanto(sorteado != tentativa)
		{
			quantidadeTentativas++

			se (tentativa < menorTentativa) {menorTentativa = tentativa}
			se ((distancia(tentativaMaisLonge, sorteado) < distancia(tentativa, sorteado)) ou
			    (distancia(tentativaMaisLonge, sorteado) == distancia(tentativa, sorteado) e tentativa > tentativaMaisLonge))
			{tentativaMaisLonge = tentativa}
			
			escreva("Tente acertar o número: ")
			leia(tentativa)
		}

		escreva("\nVocê acertou!",
		        "\nTentativas erradas: ", quantidadeTentativas,
		        "\nO menor numero tentado foi: ", menorTentativa,
		        "\nO numero que passou mais longe:   ", tentativaMaisLonge)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 504; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */