programa
{
	inclua biblioteca Util --> u

	funcao inicio()
	{
		inteiro tentativa, sorteado, limite, pontos=100
		
		escreva("Insira limite: ")
		leia(limite)
		
		sorteado = u.sorteia(0, limite)
		
		escreva("\nTente acertar o número: ")
		leia(tentativa)

		inteiro tempoInicial = u.tempo_decorrido()
		enquanto(sorteado != tentativa)
		{
			se (sorteado > tentativa) {pontos-=2 escreva("Muito baixo\n")}
			senao                     {pontos-=1 escreva("Muito alto\n")}
			escreva("Tente acertar o número: ")
			leia(tentativa)
		}

		escreva("\nPontuação final: ", pontos)
		escreva("\nTempo usado: ", u.tempo_decorrido()-tempoInicial)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 529; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */