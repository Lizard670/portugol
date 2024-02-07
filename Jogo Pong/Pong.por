programa
{
	inclua biblioteca Util       --> u
	inclua biblioteca Tipos      --> tp
	inclua biblioteca Matematica --> m
	inclua biblioteca Sons
	inclua biblioteca Teclado    --> t
	inclua biblioteca Graficos   --> g

	const cadeia OS_PATH = ""
	const inteiro	RAIO_TAM_TELA[2] = {220, 165}, ALTURA_MENU=50, FPS_DESEJADO = 60,
				TAM_PLAYER = 75, VELOCIDADE_PLAYER = 200, 
				VELOCIDADE_BOLA_INICIAL = 150, RAIO_BOLA = 10, ACELERACAO_BOLA = 25
				// Aceleração em pixel por segundo²
				
	inteiro duracaoFrame = 1, duracaoFrameDesejada = 1000 / FPS_DESEJADO, espacoDoisPontos = 0
	real fps = 1.0,
	
			playersY[2] = {-TAM_PLAYER/2.0, -TAM_PLAYER/2.0}
	inteiro pontuacoes[2] = {0,0}
	
	real			  posBola[2] = {0.0,0.0},
			velocidadeBola    = VELOCIDADE_BOLA_INICIAL*1.0,
		// Velocidade em pixel por segundo
	 		   direcaoBola[3] = {0.71, 0.71, 1/4.0} 
		// seno da direcao, cosseno da direcao, direcao em radianos
		// A direção em radianos não está sendo atualizada durante o programa
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(2*RAIO_TAM_TELA[0], 
							  2*RAIO_TAM_TELA[1] + ALTURA_MENU)
		
		g.carregar_fonte(OS_PATH + "monogram-extended.ttf")
		g.definir_tamanho_texto(50.0)
		g.definir_fonte_texto("monogramextended")
		espacoDoisPontos = g.largura_texto(":")/2
		
		atualizarBola()
		inteiro tempoAtual = u.tempo_decorrido(), ultimoFrame=tempoAtual
		desenhe()
		
		enquanto(verdadeiro) 
		{
			tempoAtual = u.tempo_decorrido()
			duracaoFrame = (tempoAtual - ultimoFrame)
			fps = 1000.0 / duracaoFrame
			ultimoFrame = tempoAtual

			se (duracaoFrameDesejada - duracaoFrame > 0) {u.aguarde(duracaoFrame)}

			se (t.alguma_tecla_pressionada())
			{
				real proximaPosicao = VELOCIDADE_PLAYER/fps
				
				se (t.tecla_pressionada(t.TECLA_W)) 			{playersY[0]-=proximaPosicao}
				se (t.tecla_pressionada(t.TECLA_S)) 			{playersY[0]+=proximaPosicao}
				playersY[0] = clampR(-(RAIO_TAM_TELA[0]*1.0-TAM_PLAYER/2), 
								  playersY[0], 
								  (RAIO_TAM_TELA[0]*1.0-TAM_PLAYER/2)) 
				
				se (t.tecla_pressionada(t.TECLA_SETA_ACIMA ))	{playersY[1]-=proximaPosicao}
				se (t.tecla_pressionada(t.TECLA_SETA_ABAIXO))	{playersY[1]+=proximaPosicao}
				playersY[1] = clampR(-RAIO_TAM_TELA[0]*1.0-TAM_PLAYER/2, 
								  playersY[1], 
								  RAIO_TAM_TELA[0]*1.0-TAM_PLAYER/2) 
			}
			
			aumentarPontuacao(atualizarBola())
			desenhe()
		}
	}

	funcao desenhe()
	{
		g.definir_cor(g.COR_PRETO)
		g.limpar()
		g.definir_cor(g.COR_BRANCO)

		// MENU
		g.desenhar_retangulo(0,0, 2*RAIO_TAM_TELA[0], ALTURA_MENU, falso, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		inteiro posYTexto = (ALTURA_MENU - g.altura_texto("0"))/2
		g.desenhar_texto(converterX(-espacoDoisPontos*1.0), posYTexto, ":")
		g.desenhar_texto(converterX(-(espacoDoisPontos*1.0+g.largura_texto(""+pontuacoes[0]))), posYTexto, ""+pontuacoes[0]) // Player 1
		g.desenhar_texto(converterX(  espacoDoisPontos*1.0)							 , posYTexto, ""+pontuacoes[1]) // Player 2
		
		g.definir_cor(g.COR_BRANCO)

		// Jogadores
		para (inteiro i=0; i<2; i++)
		{
			g.desenhar_retangulo(converterX(1.0*RAIO_TAM_TELA[0] * pow(-1, 1+i)) - RAIO_BOLA, 
							 converterY(playersY[i]), 
							 2*RAIO_BOLA, 
							 TAM_PLAYER, 
							 falso, verdadeiro)
		}

		// BOLA
		/* Skin quadrado /
		g.desenhar_retangulo(converterX(posBola[0]-RAIO_BOLA), 
						 converterY(posBola[1]-RAIO_BOLA), 
						 RAIO_BOLA*2, RAIO_BOLA*2,
						 falso, verdadeiro)
		/**/
		/* Skin circulo */
		g.desenhar_elipse(converterX(posBola[0]-RAIO_BOLA), 
					   converterY(posBola[1]-RAIO_BOLA), 
					   RAIO_BOLA*2, RAIO_BOLA*2,
					   verdadeiro)
		/**/
		g.renderizar()
	}

	funcao inteiro atualizarBola()
	{
		para (inteiro i=0; i<2; i++)
		{       posBola[i] += velocidadeBola * direcaoBola[i] / fps}
		velocidadeBola += 1.0*ACELERACAO_BOLA / fps

		// Checa colisão com a parede
		se(modN(posBola[1])+RAIO_BOLA > RAIO_TAM_TELA[1]) {direcaoBola[1] *= -1}

		// Checa colisão com os 2 jogadores	
		para (inteiro i=0; i<2; i++)
		{
			inteiro distanciaQuadrada = distanciaQuadradaCirculoRetangulo(fToI(posBola[0]), fToI(posBola[1]), RAIO_TAM_TELA[0] * pow(-1, 1+i) - RAIO_BOLA, fToI(playersY[i]), 2*RAIO_BOLA, TAM_PLAYER)
			se (distanciaQuadrada <= pow(RAIO_BOLA, 2))
			{
				direcaoBola[0] *= -1
				posBola[0] += (RAIO_BOLA - m.raiz(distanciaQuadrada*1.0, 2.0)) //* pow(-1, 1+i)
				retorne 0
			}
		}

		// Retorna -1 se foi ponto para o player 2
		// Retorna  0 se nenhum ponto foi marcado
		// Retorna  1 se foi ponto para o player 1
		retorne fToI(posBola[0] / (RAIO_TAM_TELA[0] + (4*RAIO_BOLA)))
	}

	funcao aumentarPontuacao(inteiro jogador)
	{
		se (jogador == 0) {retorne}

		posBola[0] = 0.0 
		posBola[1] = 0.0
		velocidadeBola = VELOCIDADE_BOLA_INICIAL*1.0
		direcaoBola[0] *= -1

		jogador = clamp(0, jogador, 1)
		se (jogador == 0) {jogador+=2}
		pontuacoes[jogador-1]++
	}

	// Retorna a distancia² entre um circulo e o ponto mais próximo de um retangulo
	// Não tira a raiz quadrada aqui por motivos de otimização, já que nem em todo caso é necessário e raiz quadrada é uma operação mais custosa
	funcao inteiro distanciaQuadradaCirculoRetangulo(inteiro xCirculo,   inteiro yCirculo,
							   	    		    inteiro xRetangulo, inteiro yRetangulo, inteiro largura, inteiro altura)
	{
		// Ponto no retangulo mais próximo do circulo
		inteiro pontoMaisProximo[2] = {clamp(xRetangulo, xCirculo, xRetangulo+largura),
								 clamp(yRetangulo, yCirculo, yRetangulo+altura)}
		retorne pow(pontoMaisProximo[0] - xCirculo, 2) + pow(pontoMaisProximo[1] - yCirculo, 2)
	}

	funcao inteiro converterX(real pos) {retorne fToI(pos+RAIO_TAM_TELA[0])}
	funcao inteiro converterY(real pos) {retorne fToI(pos+RAIO_TAM_TELA[1]+ALTURA_MENU)}
	
	funcao inteiro pow(inteiro base, inteiro potencia) {retorne fToI(m.potencia(base*1.0, potencia*1.0))}
	funcao inteiro mod (inteiro n) {se(n<0){retorne -n} retorne n} // valor inteiro absoluto de N para N inteiro
	funcao real    modN(real    n) {se(n<0){retorne -n} retorne n} // valor real    absoluto de N para n real
	funcao inteiro fToI(real n) {retorne tp.real_para_inteiro(n)}
	
	// Retorna o valor entre min e max mais próximo de N
	funcao inteiro clamp(inteiro min, inteiro n, inteiro max) {se (n < min) {retorne min}
												    se (n > max) {retorne max}
												    			   retorne n}
	// Mesma coisa soq pra reais
	funcao real    clampR(real   min, real    n, real    max) {se (n < min) {retorne min}
												    se (n > max) {retorne max}
												    			   retorne n}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4389; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {playersY, 19, 3, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */