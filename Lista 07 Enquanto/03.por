programa
{
	inclua biblioteca Util --> u

	3funcao inicio()
	{
		inteiro tentativa, sorteado, limite, pontos=100
		
		escreva("Insira limite: ")
		leia(limite)
		
		sorteado = u.sorteia(0, limite)
		
		escreva("\nTente acertar o número: ")
		leia(tentativa)

		enquanto(sorteado != tentativa)
		{
			pontos--
			
			escreva("Tente acertar o número: ")
			leia(tentativa)
		}

		escreva("\nPontuação final: ", pontos)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 374; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */