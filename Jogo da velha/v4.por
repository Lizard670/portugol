programa
{
	inclua biblioteca Mouse --> m
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g
	
	caracter posicoes[3][3]
	const caracter tipos[2] = {'X', 'O'}
	
	funcao inicio()
	{
		para (inteiro i = 0; i < 3; i++) {para (inteiro j = 0; j < 3; j++) {posicoes[i][j] = ' '}} // Popula a matriz com " "

		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(200, 250)
		g.definir_titulo_janela("Jogo da velha")

		logico vitoria = falso
		// Loop das 9 rodadas do jogo
		para (inteiro i = 0; i < 9; i++)
		{
			caracter tipo = tipos[i%2]

			desenhar("")
			vitoria = jogar(tipo)

			se (vitoria)
			{
				desenhar(tipo+" ganhou!")
				pare
			}
		}

		// Se nenhum jogador ganhar após 9 rodadas, declara empate
		se (nao vitoria) {desenhar("Empate...")}

		t.ler_tecla()
	}



	// Pega input do jogador e posiciona no tabuleiro
	funcao logico jogar(caracter tipo)
	{
		// Pega input valido de XY
		inteiro x, y
		logico posicaoInvalida = verdadeiro
		faca {
			m.ler_botao()
			x = (m.posicao_x()-10)/61
			y = (m.posicao_y()-10)/61
			
			// Checa se a posição é valida
			se ((x >= 0 e x < 3) e (y >= 0 e y < 3)) {posicaoInvalida = (posicoes[x][y] != ' ')}
		} enquanto (posicaoInvalida)
		posicoes[x][y] = tipo

		retorne checarVitoria(tipo, x, y)
	}


	// Checa se um dos jogadores venceu
	funcao logico checarVitoria(caracter tipo, inteiro x, inteiro y)
	{
		retorne (posicoes[x][0] == tipo e posicoes[x][1] == tipo e posicoes[x][2] == tipo) ou
			   (posicoes[0][y] == tipo e posicoes[1][y] == tipo e posicoes[2][y] == tipo) ou
			   (posicoes[0][0] == tipo e posicoes[1][1] == tipo e posicoes[2][2] == tipo) ou
			   (posicoes[0][2] == tipo e posicoes[1][1] == tipo e posicoes[2][0] == tipo)
	}


	// Escreve na tela o "tabuleiro"
	funcao desenhar(cadeia texto)
	{
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(59.0)
		g.desenhar_retangulo( 69,  10, 2, 181, falso, verdadeiro)
		g.desenhar_retangulo(130,  10, 2, 181, falso, verdadeiro)
		g.desenhar_retangulo( 10,  69, 181, 2, falso, verdadeiro)
		g.desenhar_retangulo( 10, 130, 181, 2, falso, verdadeiro)
		
		para (inteiro i = 0; i < 3; i++)
		{
			para (inteiro j = 0; j < 3; j++)
			{
				inteiro ajuste = 0
				se (posicoes[j][i] == 'X') {ajuste = 4}
				g.desenhar_texto(j*61+18+ajuste, i*61+14, (posicoes[j][i]+""))
			}
		}

		g.definir_tamanho_texto(39.0)
		g.desenhar_texto(10, 205, texto)
		
		g.renderizar()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 289; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */