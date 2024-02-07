programa
{
	inclua biblioteca Tipos
	inclua biblioteca Texto --> txt
	
	caracter posicoes[3][3]
	const caracter tipos[2] = {'X', 'O'}
	const cadeia   linha    = "\n---+---+---+---+\n "
	
	funcao inicio()
	{
		// Popular a matriz com " "
		para (inteiro i = 0; i < 3; i++) {para (inteiro j = 0; j < 3; j++) {posicoes[i][j] = ' '}}

		logico vitoria = falso
		// Loop das 9 rodadas do jogo
		para (inteiro i = 0; i < 9; i++)
		{
			caracter tipo = tipos[i%2]
			desenhar()

			escreva("Turno de ", tipo, "\n")
			vitoria = jogar(tipo)

			se (vitoria)
			{
				desenhar()
				escreva("Vitoria de ", tipo, "!")
				pare
			}
		}

		// Se nenhum jogador ganhar após 9 rodadas, declara empate
		se (nao vitoria)
		{
			desenhar()
			escreva("Empate")
		}
	}



	// Pega input do jogador e posiciona no tabuleiro
	funcao logico jogar(caracter tipo)
	{
		// Pega input valido de XY
		inteiro x, y
		logico posicaoInvalida = verdadeiro
		faca {
			x=3
			y=3
			
			// Posição X
			cadeia posicaoBruta = "D4"
			faca {
				escreva("Posição: ")
				leia(posicaoBruta)
			} enquanto (txt.numero_caracteres(posicaoBruta) == 3)
			posicaoBruta = txt.caixa_baixa(posicaoBruta)
			
			      se (possui('a', posicaoBruta)) {x=0}
			senao se (possui('b', posicaoBruta)) {x=1}
			senao se (possui('c', posicaoBruta)) {x=2}
			      se (possui('1', posicaoBruta)) {y=0}
			senao se (possui('2', posicaoBruta)) {y=1}
			senao se (possui('3', posicaoBruta)) {y=2}
			
			// Checa se a posição é valida
			se ((x >= 0 e x < 3) e (y >= 0 e y < 3)) {posicaoInvalida = (posicoes[x][y] != ' ')}
			senao {escreva("Posição invalida\n")}		
		} enquanto (posicaoInvalida)
		posicoes[x][y] = tipo

		retorne checarVitoria(tipo, x, y)
	}

	// Retorna se o texto possui ou não o caracter
	funcao logico possui(caracter char, cadeia texto) {retorne (txt.posicao_texto(Tipos.caracter_para_cadeia(char), texto, 0) != -1)}


	// Checa se um dos jogadores venceu
	funcao logico checarVitoria(caracter tipo, inteiro x, inteiro y)
	{
		retorne (posicoes[x][0] == tipo e posicoes[x][1] == tipo e posicoes[x][2] == tipo) ou
			   (posicoes[0][y] == tipo e posicoes[1][y] == tipo e posicoes[2][y] == tipo) ou
			   (posicoes[0][0] == tipo e posicoes[1][1] == tipo e posicoes[2][2] == tipo) ou
			   (posicoes[0][2] == tipo e posicoes[1][1] == tipo e posicoes[2][0] == tipo)
	}


	// Escreve na tela o "tabuleiro"
	funcao desenhar()
	{
		limpa()
		escreva("\n   | A | B | C |")
		// Linhas
		para (inteiro i = 0; i < 3; i++)
		{
			escreva(linha, i+1, " | ")
			para (inteiro j = 0; j < 3; j++) {escreva(posicoes[j][i], " | ")} // Colunas
		}
		escreva(linha)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1648; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */