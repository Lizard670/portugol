programa
{
	inclua biblioteca Texto --> txt
	
	caracter posicoes[3][3]
	caracter tipos[2] = {'X', 'O'}
	
	funcao inicio()
	{
		// Popular a matriz com " "
		para (inteiro i = 0; i < 3; i++)
		{
			para (inteiro j = 0; j < 3; j++)
			{
				posicoes[i][j] = ' '	
			}
		}

		
		para (inteiro i = 0; i < 9; i++)
		{
			desenhar()
			
			logico vitoria = jogar(tipos[0])

			se (vitoria)
			{
				desenhar()
				escreva("Vitoria de ", tipos[i%2], "!")
				pare
			}
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
			cadeia colunaCadeia = ""
			escreva("\nColuna: ")
			enquanto (txt.numero_caracteres(colunaCadeia) < 1)
			{
				leia(colunaCadeia)
			}
			caracter coluna = txt.obter_caracter(txt.caixa_baixa(colunaCadeia), 0)
			
			escolha(coluna)
			{
				caso 'a': x=0 pare
				caso 'b': x=1 pare
				caso 'c': x=2 pare
			}

			// Posição Y
			escreva("Linha: ")
			leia(y)
			y--
			
			// Checa se está dentro dos limites
			se ((x >= 0 e x < 3) e (y >= 0 e y < 3))
			{
				// Checa se a posição está ocupada
				posicaoInvalida = (posicoes[x][y] != ' ')
			}
			senao {escreva("Posição invalida\n")}
			
		} enquanto (posicaoInvalida)

		
		// Posiciona no tabuleiro
		posicoes[x][y] = tipo

		retorne checarVitoria(tipo, x, y)
	}


	// Checa se um dos jogadores venceu
	funcao logico checarVitoria(caracter tipo, inteiro x, inteiro y)
	{
		// Checa na vertical e horizontal
		logico ganhouVertical   = verdadeiro,
			  ganhouHorizontal = verdadeiro
		para (inteiro i = 0; i < 3; i++)
		{
			se (posicoes[x][i] != tipo) {ganhouVertical   = falso}
			se (posicoes[i][y] != tipo) {ganhouHorizontal = falso}

			se (nao(ganhouVertical ou ganhouHorizontal)) {pare}
		}
		se (ganhouVertical ou ganhouHorizontal) {retorne verdadeiro}
		// Só continua se houve alteração em uma das diagonais
		senao se ((x==0 e y==1) ou (x==1 e y==0) ou (x==0 e y==2) ou (x==2 e y==1)) {retorne falso}

		// Checa as duas horizontais
		logico ganhouDiagonal[2] = {verdadeiro, verdadeiro}
		para (inteiro i = 0, j = 3; i < 3; i++)
		{
			j--
			se (posicoes[i][i] != tipo) {ganhouDiagonal[0] = falso}
			se (posicoes[i][j] != tipo) {ganhouDiagonal[1] = falso}

			se (nao(ganhouDiagonal[0] ou ganhouDiagonal[1])) {pare}
		}
		se (ganhouDiagonal[0] ou ganhouDiagonal[1]) {retorne verdadeiro}

		// Nenhum jogador ganhou
		retorne falso
	}


	// Escreve na tela o "tabuleiro"
	funcao desenhar()
	{
		limpa()
		escreva("\n   | A | B | C |\n---+---+---+---+\n ")
		// Linhas
		para (inteiro i = 0; i < 3; i++)
		{
			escreva(i+1, " | ")
			
			// Colunas
			para (inteiro j = 0; j < 3; j++)
			{
				escreva(posicoes[j][i], " | ")
			}

			escreva("\n---+---+---+---+\n ")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2198; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */