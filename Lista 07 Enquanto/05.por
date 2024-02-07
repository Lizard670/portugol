programa
{
	inclua biblioteca Util --> u

	funcao inicio()
	{
		inteiro tentativa, sorteado, opcao, limite=100, pontos=0, tempo=0
		cadeia barra = "\n+-+----------------------------+\n",
		menu = (barra+ "|1|Setar valor LIMITE          |"+
			   barra+ "|2|Jogar                       |"+
			   barra+ "|3|Ver última pontuação        |"+
			   barra+ "|4|Ver o último tempo decorrido|"+
			   barra+ "|0|Sair                        |"+
			   barra+ "Selecione uma opção: ")
		
		escreva(menu)
		leia(opcao)
		
		enquanto (opcao !=0)
		{
			limpa()
			se       (opcao == 1) {escreva("Insira limite: ") leia(limite)}
			senao se (opcao == 3) {escreva("Ultima pontuação: ", pontos)}
			senao se (opcao == 4) {escreva("último tempo decorrido: ", tempo, "ms")}
			senao se (opcao == 2)
			{
				pontos = 100
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

				tempo = u.tempo_decorrido()-tempoInicial
				escreva("\nPontuação final: ", pontos)
				escreva("\nTempo usado: ", tempo, "ms")
			}

			escreva("\n\n", menu)
			leia(opcao)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1283; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */