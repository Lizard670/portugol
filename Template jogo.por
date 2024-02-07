programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t

	const inteiro TICKS_POR_SEGUNDO = 60
	inteiro duracaoTick = 1000 / TICKS_POR_SEGUNDO,
		tickAtual = 0
	
	funcao inicio(){g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(500, 500)
		g.definir_titulo_janela("Jogo")
		

		inteiro inicioDoJogo = u.tempo_decorrido(),
			//duracaoPausa         = 0,
			//tempoParado          = 0,
			intervaloMovimento   = 0

		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			tickAtual++
			// Corrige o tempo do jogo pra cada segundo ter 20 ticks
			inteiro tempoEsperado = u.tempo_decorrido() - inicioDoJogo //- duracaoPausa
			tempoEsperado -= (tempoEsperado % duracaoTick)
			inteiro correcao = tempoEsperado - tickAtual*duracaoTick
			
			inteiro duracaoAtual = duracaoTick - correcao
			se (duracaoAtual < 0) {duracaoAtual = 0}
			u.aguarde(duracaoAtual)


			
			
			
			// Desenha na tela oq está acontecendo
			se ((correcao < duracaoTick) ou
			    (correcao > duracaoTick e correcao < duracaoTick*10 e (tickAtual%10  == 0)) ou
			    (correcao > duracaoTick                             e (tickAtual%100 == 0))) {desenhe()}
		}
	}
	
	funcao desenhe(){
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.definir_cor(g.COR_VERDE)
		g.desenhar_retangulo(100, 100, 600, 400, verdadeiro, verdadeiro)

		// Tempo
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 0, ("Tempo: " + tickAtual*duracaoTick/1000.0))
		
		g.renderizar()
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 927; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */