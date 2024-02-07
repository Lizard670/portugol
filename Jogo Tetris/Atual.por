programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t

	const inteiro TICKS_POR_SEGUNDO = 60
	inteiro duracaoTick = 1000 / TICKS_POR_SEGUNDO

	inteiro corestipos[7] = {g.criar_cor(54, 200, 255), g.COR_AZUL, g.criar_cor(255, 140, 39), g.COR_AMARELO, g.COR_VERDE, g.criar_cor(144, 4, 191), g.COR_VERMELHO}
	const inteiro pecas[7][17] = {{4,  0, 0, 0, 0, 1, 1, 1, 1,          0, 0, 0, 0, 0, 0, 0, 0},          // |
					    {3,  1, 0, 0,      1, 1, 1,   0, 0, 0,      0, 0, 0, 0, 0, 0, 0},                // J
					    {3,  0, 0, 1,      1, 1, 1,   0, 0, 0,      0, 0, 0, 0, 0, 0, 0},                // L
					    {2,  1, 1,         1, 1,                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, // O
					    {3,  0, 1, 1,      1, 1, 0,   0, 0, 0,      0, 0, 0, 0, 0, 0, 0},                // S
					    {3,  0, 1, 0,      1, 1, 1,   0, 0, 0,      0, 0, 0, 0, 0, 0, 0},                // T
					    {3,  1, 1, 0,      0, 1, 1,   0, 0, 0,      0, 0, 0, 0, 0, 0, 0}}                // Z

	const inteiro TAMANHO_BLOCO = 30, LARGURA = 10, ALTURA = 20
	const inteiro pontos[4] = {40, 100, 300, 1200}
	inteiro totalPontos = 0
	logico jogoAcontecendo = verdadeiro
	inteiro matriz[ALTURA][LARGURA], corAtual = 0, posicaoPeca[2], pecaAtual[17], tipoGuardado = -1, proximasPecas[4] = {u.sorteia(0, 6), u.sorteia(0, 6), u.sorteia(0, 6), u.sorteia(0, 6)},
	background = g.carregar_imagem("/Simples.png")
	
	funcao inicio()
	{
		para (inteiro i = 0; i < ALTURA; i++) {para (inteiro j = 0; j < LARGURA; j++) {matriz[i][j] = 0}} // Popula a matriz com 0
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(575, 690)
		g.definir_titulo_janela("Tetris")
		

		inteiro inicioDoJogo = u.tempo_decorrido(),
		tickAtual            = 0,
		duracaoPausa         = 0,
		intervaloMovimento   = 0,
		intervaloQueda       = 0,
		intervaloGiro        = 0,
		intervaloDrop        = 0,
		intervaloGuardar     = 0,
		tempoParado          = 0

		
		novaPeca()
		
		enquanto (jogoAcontecendo)
		{
			
			tickAtual++
			intervaloGiro--
			intervaloMovimento--
			intervaloDrop--
			// Corrige o tempo do jogo pra cada segundo ter 20 ticks
			inteiro tempoEsperado = u.tempo_decorrido() - inicioDoJogo - duracaoPausa
			tempoEsperado -= (tempoEsperado % duracaoTick)
			inteiro correcao = tempoEsperado - tickAtual*duracaoTick
			
			inteiro duracaoAtual = duracaoTick - correcao
			se (duracaoAtual < 0) {duracaoAtual = 0}
			u.aguarde(duracaoAtual)

			

			// Pega input do jogador e faz mudanças se necessessárias
			se (t.alguma_tecla_pressionada())
			{
				// Sair do jogo
				se       (t.tecla_pressionada(t.TECLA_ESC)                           ) {pare}
				// Pausar jogo
				senao se (t.tecla_pressionada(t.TECLA_P)                             ) {duracaoPausa += pause()}
				// Desce peça imediatamente
				senao se (t.tecla_pressionada(t.TECLA_ESPACO) e intervaloDrop    <= 0) {enquanto (movaBloco( 0, 1)){} pararBloco() intervaloDrop = 15 intervaloQueda = 0 intervaloGuardar = 0}
				// Gurda a peça
				senao se (t.tecla_pressionada(t.TECLA_C     ) e intervaloGuardar <= 0) {guardarPeca() intervaloGuardar = 1}
				
				senao
				{
				// Girar peça
					se (t.tecla_pressionada(t.TECLA_SETA_ACIMA) e intervaloGiro <= 0)
					{
						// Gira a peça em 90º
						inteiro pecaAntiga[17] = {pecaAtual[0], pecaAtual[1], pecaAtual[2], pecaAtual[3], pecaAtual[4], pecaAtual[5], pecaAtual[6], pecaAtual[7], pecaAtual[8], pecaAtual[9], pecaAtual[10], pecaAtual[11], pecaAtual[12], pecaAtual[13], pecaAtual[14], pecaAtual[15], pecaAtual[16]}
						
						se (t.tecla_pressionada(t.TECLA_SHIFT)) 
						{ // horario
							se       (pecaAtual[0] == 4) {para (inteiro i=0; i<16; i++) {pecaAtual[i*4+3 - (i/4*17)+1] = pecaAntiga[i+1]}}
							senao se (pecaAtual[0] == 3) {para (inteiro i=0; i< 9; i++) {pecaAtual[i*3+2 - (i/3*10)+1] = pecaAntiga[i+1]}}
						}
						senao 
						{ // anti-horario
							se       (pecaAtual[0] == 4) {para (inteiro i=0; i<16; i++) {pecaAtual[i+1] = pecaAntiga[i*4+3 - (i/4*17)+1]}}
							senao se (pecaAtual[0] == 3) {para (inteiro i=0; i< 9; i++) {pecaAtual[i+1] = pecaAntiga[i*3+2 - (i/3*10)+1]}}
						}

						se (nao(posicaoValida())) 
						{
							se (movaBloco(-1, 0)) {} senao se (movaBloco(1, 0)) {} senao se (movaBloco(0, 1)) {} senao se (movaBloco(0, -1)) {}
							senao {para (inteiro i=0; i<17; i++) {pecaAtual[i] = pecaAntiga[i]}}
						}
						intervaloGiro = 15
					}
				// Desce a peça em uma posição
					se (t.tecla_pressionada(t.TECLA_SETA_ABAIXO))
					se (movaBloco(0, 1)) {intervaloQueda = 0}
				// Move a peça pra esquerda
					se (t.tecla_pressionada(t.TECLA_SETA_ESQUERDA) e (intervaloMovimento <= 0)) 
					{intervaloMovimento = 6
					 movaBloco(-1, 0)}
				// Move a peça pra direita
					se (t.tecla_pressionada(t.TECLA_SETA_DIREITA)  e (intervaloMovimento <= 0)) 
					{intervaloMovimento = 6
					 movaBloco( 1, 0)}
				}
			}

			// Move a peça pra baixo a cada certo intervalo de ticks
			se (intervaloQueda == 40) 
			{
				intervaloQueda = 0
				// Se não foi possível mover mais pra baixo, para o bloco no lugar e checa se alguma linha foi completada
				se (nao(movaBloco(0, 1))) {pararBloco() intervaloGuardar = 0}
			}
			intervaloQueda++
			
			
			// Desenha na tela oq está acontecendo
			se ((correcao < duracaoTick) ou
			    (correcao > duracaoTick e correcao < duracaoTick*10 e (tickAtual%10  == 0)) ou
			    (correcao > duracaoTick                             e (tickAtual%100 == 0))) {desenhe()}
		}

		// Tela de game over
		g.definir_cor(g.criar_cor(19, 25, 25))
		g.limpar()
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(56.0)
		g.desenhar_texto((g.largura_janela() - g.largura_texto("FIM DE JOGO") )/2, 180, "FIM DE JOGO")
		g.definir_tamanho_texto(48.0)
		g.desenhar_texto((g.largura_janela() - g.largura_texto(totalPontos+""))/2, 250, totalPontos+"")
		g.renderizar()

		u.aguarde(1000)

		enquanto (verdadeiro) {se (t.ler_tecla() == t.TECLA_ESC) {pare}}
	}

	funcao inteiro pause()
	{
		inteiro horarioDaPausa  = u.tempo_decorrido()
		
		g.definir_cor(g.criar_cor(19, 25, 25))
		g.limpar()
		g.definir_cor(g.criar_cor(38, 50, 50))
		g.desenhar_retangulo(190, 300, 30, 90, verdadeiro, verdadeiro)
		g.desenhar_retangulo(235, 300, 30, 90, verdadeiro, verdadeiro)
		g.renderizar()
		
		t.ler_tecla()
		enquanto (verdadeiro) {se (t.ler_tecla() == t.TECLA_P) {pare}}
		retorne (u.tempo_decorrido() - horarioDaPausa)
	}

	funcao desenhe()
	{
		g.definir_cor(g.criar_cor(38, 50, 50))
		g.limpar()

		g.desenhar_imagem(0, 0, background)

		// Peca em movimento
		inteiro tamanho = pecaAtual[0]
		  //Sombra da peca
		inteiro alturaVerdadeira = posicaoPeca[0],
		corSombra = g.criar_cor(g.obter_RGB(corAtual, 0)/2+15, g.obter_RGB(corAtual, 1)/2+15, g.obter_RGB(corAtual, 2)/2+15)
		enquanto (movaBloco( 0, 1)) {}
		para (inteiro i = 0; i < tamanho; i++)
		{
			para (inteiro j = 0; j < tamanho; j++)
			{
				inteiro xAtual = posicaoPeca[1]+j, yAtual = posicaoPeca[0]+i
				se (pecaAtual[i*tamanho+j+1] == 1 e (yAtual >= 0)) {construaBloco(xAtual, yAtual, corSombra)}
			}
		}
		posicaoPeca[0] = alturaVerdadeira
		
		
		  //Peca verdadeira
		para (inteiro i = 0; i < tamanho; i++)
		{
			para (inteiro j = 0; j < tamanho; j++)
			{
				inteiro xAtual = posicaoPeca[1]+j, yAtual = posicaoPeca[0]+i
				se (pecaAtual[i*tamanho+j+1] == 1 e (yAtual >= 0)) {construaBloco(xAtual, yAtual, corAtual)}
			}
		}

		// Blocos parados
		para (inteiro i = (ALTURA-1); i >= 0; i--)
		{
			se (checarLinhaVazia(i)) {pare}
			para(inteiro j = 0; j < LARGURA; j++) {construaBloco(j, i, matriz[i][j])}
		}

		// Proximas peças
		construaBlocoFalso(488, 116, proximasPecas[0], 30)
		para (inteiro i=0; i<3; i++) {construaBlocoFalso(503, 252+(68*i), proximasPecas[i+1], 15)}

		// Peça guardada
		se (tipoGuardado != -1) {construaBlocoFalso(39, 116, tipoGuardado, 30)}

		// Pontuação
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(140, 8, ("Pontuação: " + totalPontos))
		

		g.renderizar()
	}

	funcao logico construaBloco(inteiro x, inteiro y, inteiro cor)
	{
		se (cor == 0) {retorne falso}

		g.definir_cor(cor)
		g.desenhar_retangulo(x*TAMANHO_BLOCO+140, 
		                     y*TAMANHO_BLOCO+51, 
		                       TAMANHO_BLOCO-2, 
		                       TAMANHO_BLOCO-2, verdadeiro, verdadeiro)
		
		retorne verdadeiro
	}

	funcao construaBlocoFalso(inteiro x, inteiro y, inteiro tipo, inteiro tamanho)
	{
		inteiro tipos[7][8] = {{1, 0,   1, 0,   1, 0,   1, 0}, // |
						   {0, 0,   1, 1,   1, 0,   1, 0}, // J
						   {0, 0,   1, 0,   1, 0,   1, 1}, // L
						   {0, 0,   1, 1,   1, 1,   0, 0}, // O
						   {0, 0,   1, 0,   1, 1,   0, 1}, // S
						   {0, 0,   1, 0,   1, 1,   1, 0}, // T
						   {0, 0,   0, 1,   1, 1,   1, 0}} // Z
		inteiro correcaoX = 0, correcaoY = -tamanho/2
						   
		g.definir_cor(corestipos[tipo])

		se       (tipo == 0) {correcaoX = tamanho/2 correcaoY = 0}
		senao se (tipo == 3) {                      correcaoY = 0}
		
		para (inteiro i=0; i<4; i++)
		{
			para (inteiro j=0; j<2; j++)
			{
				se (tipos[tipo][i*2+j] != 0)
				{
					g.desenhar_retangulo(j*tamanho+x+1+correcaoX, 
					                     i*tamanho+y+1+correcaoY, 
					                       tamanho  -2, 
					                       tamanho  -2, verdadeiro, verdadeiro)
				}
			}
		}
		
	}

	funcao logico movaBloco(inteiro x, inteiro y)
	{
		inteiro posicaoAntiga[2] = {posicaoPeca[0], posicaoPeca[1]}
		posicaoPeca[0] += y
		posicaoPeca[1] += x

		se (nao(posicaoValida()))
		{
			posicaoPeca[0] = posicaoAntiga[0]
			posicaoPeca[1] = posicaoAntiga[1]
			retorne falso
		}

		retorne verdadeiro
	}

	funcao logico posicaoValida()
	{
		inteiro tamanho = pecaAtual[0]
		para (inteiro i = 0; i < tamanho; i++)
		{
			inteiro yAtual = posicaoPeca[0]+i
			para (inteiro j = 0; j < tamanho; j++)
			{
				inteiro xAtual = posicaoPeca[1]+j
				se ((xAtual < 0 ou xAtual >= LARGURA) ou (yAtual >= ALTURA)) {se (pecaAtual[i*tamanho+j+1] == 1) {retorne falso}}
				senao se (yAtual >= 0)
				{
					logico mudancaPossivel = (matriz[yAtual][xAtual] == 0                          ) ou 
									     (matriz[yAtual][xAtual] != 0 e (pecaAtual[i*tamanho+j+1] == 0))
					se (nao(mudancaPossivel)) {retorne falso}
				}
			}
		}
		retorne verdadeiro
	}

	funcao pararBloco()
	{
		inteiro tamanho = pecaAtual[0]
		para (inteiro i = 0; i < tamanho; i++)
		{
			inteiro yAtual = posicaoPeca[0]+i
			para (inteiro j = 0; j < tamanho; j++)
			{
				inteiro xAtual = posicaoPeca[1]+j
				se (xAtual >= 0 e xAtual < LARGURA e yAtual < ALTURA) 
				{
					// Jogador perdeu
					se (yAtual < 0) {se (pecaAtual[i*tamanho+j+1] != 0) {jogoAcontecendo = falso}}
					senao se            (pecaAtual[i*tamanho+j+1] != 0) {matriz[yAtual][xAtual] = corAtual}
				}
			}
		}
		
		// Contabilizar pontos e deletar linhas
		inteiro ultimoY = posicaoPeca[0]+pecaAtual[0]
		inteiro linhasCompletadas = 0
		para (inteiro i=posicaoPeca[0]; i<=ultimoY; i++) {se (checarLinhaCheia(i)) 
		{
			linhasCompletadas++
			para (inteiro j=0; j<LARGURA;j++) {matriz[i][j] = 0}
		}}

		se (linhasCompletadas > 0)
		{
			totalPontos += pontos[linhasCompletadas -1]
				
		// Arruma as linhas limpas se houver
			inteiro linhaAtual = ultimoY
			para (inteiro i=ultimoY; i>=0; i--)
			{
				enquanto (checarLinhaVazia(linhaAtual) e linhaAtual < ALTURA e linhaAtual >= -1) {linhaAtual--}
				se (linhaAtual < 0 e i<ALTURA) {para (inteiro j=0; j<LARGURA;j++) {matriz[i][j] = 0}}
				senao se            (i<ALTURA) {para (inteiro j=0; j<LARGURA;j++) {matriz[i][j] = matriz[linhaAtual][j]}}
				linhaAtual--
			}
				
		}
		
		novaPeca()
	}

	funcao novaPeca()
	{
		inteiro tipo     = proximasPecas[0]
		proximasPecas[0] = proximasPecas[1]
		proximasPecas[1] = proximasPecas[2]
		proximasPecas[2] = proximasPecas[3]
		proximasPecas[3] = u.sorteia(0, 6)
		
		corAtual = corestipos[tipo]
		para (inteiro i=0; i<17; i++) {pecaAtual[i] = pecas[tipo][i]} 
		posicaoPeca[0] = -2 // Y
		posicaoPeca[1] =  4 // X
	}

	funcao guardarPeca()
	{
		inteiro tipoAntigo = -1
		para (inteiro i=0; i<7; i++) {se (corAtual == corestipos[i]) {tipoAntigo = i pare}}
		
		se (tipoGuardado == -1) {novaPeca()}
		senao 
		{	
			corAtual = corestipos[tipoGuardado]
			para (inteiro i=0; i<17; i++) {pecaAtual[i] = pecas[tipoGuardado][i]} 
		}
		posicaoPeca[0] = -2 // Y
		posicaoPeca[1] =  4 // X
		tipoGuardado = tipoAntigo	
	}
	
	funcao logico checarLinhaCheia(inteiro y)
	{
		se (y<0 ou y>=ALTURA)                                          {retorne falso}
		para (inteiro j = 0; j < LARGURA; j++) {se (matriz[y][j] == 0) {retorne falso}}
		                                                                retorne verdadeiro
	}
	
	funcao logico checarLinhaVazia(inteiro y)
	{
		se (y<0 ou y>=ALTURA)                                          {retorne verdadeiro}
		para (inteiro j = 0; j < LARGURA; j++) {se (matriz[y][j] != 0) {retorne falso}}
		                                                                retorne verdadeiro
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8793; 
 * @DOBRAMENTO-CODIGO = [147, 163, 220, 265, 281, 302, 348, 362, 378, 385];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {tipoGuardado, 23, 79, 12}-{intervaloGuardar, 41, 2, 16};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */