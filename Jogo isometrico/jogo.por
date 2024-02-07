programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> m
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t


	const inteiro TICKS_POR_SEGUNDO = 60, TAM_TILE = 32, TAM_TELA[2] = {20,15}, GRAVIDADE = 1

	
	cadeia faseAtual = "01", teclas=""

	inteiro duracaoTick = 1000 / TICKS_POR_SEGUNDO,
		tickAtual = 0,
		contFrames = 0,
		fps = 0,
		meioTela[2] = {TAM_TILE*TAM_TELA[0]/2, TAM_TILE*TAM_TELA[1]/2},

		       alturaPulo    = 4*TAM_TILE,
		    aceleracaoPer[2] = {7, tp.real_para_inteiro(m.raiz((2.0*alturaPulo*GRAVIDADE), 2.0))+1},
		    velocidadePer[2] = {0,0},
		    posPersonagem[2] = {TAM_TILE*3,TAM_TILE*10},
		spritesPersonagem[3][3], 
		    tamPersonagem[2] = {32, 48}, // Esse tamanho é temporário e não reflete o tamanho real
		
		        posCamera[2] = {0,0},
		        mapaAtual[2] = {g.carregar_imagem("/Mapas/"+faseAtual+".png"), 
					    g.carregar_imagem("/Mapas/"+faseAtual+".bmp")},
		     tamMapaAtual[2] = {g.largura_imagem(mapaAtual[1]), g.altura_imagem(mapaAtual[1])}

	logico perParado = falso
	logico perNoChao = falso
	logico perSubindo = falso
	logico perIndoEsquerda = falso

	
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(TAM_TELA[0]*TAM_TILE, 
							  TAM_TELA[1]*TAM_TILE)
		g.definir_titulo_janela("Jogo")

		// Carrega sprites do personagem e o tamanho real
		para(inteiro i=0; i<3; i++) {para(inteiro j=0; j<3; j++) {spritesPersonagem[i][j] = g.carregar_imagem("/Texturas/Personagem/"+i+j+".png")}}
		tamPersonagem[0] = g.largura_imagem(spritesPersonagem[1][1])
		tamPersonagem[1] = g.altura_imagem(spritesPersonagem[1][1])

		inteiro inicioDoJogo = u.tempo_decorrido(), ultimoSegundo = inicioDoJogo, duracaoPausa = 0

		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			tickAtual++
			// Corrige o tempo do jogo pra cada segundo ter 20 ticks
			inteiro tempoEsperado = u.tempo_decorrido() - inicioDoJogo - duracaoPausa
			tempoEsperado -= (tempoEsperado % duracaoTick)
			inteiro correcao = tempoEsperado - tickAtual*duracaoTick
			
			inteiro duracaoAtual = duracaoTick - correcao
			se (duracaoAtual < 0) {duracaoAtual = 0}
			u.aguarde(duracaoAtual)

			// Pega input do jogador e faz mudanças se necessessárias
			teclas = ""
			// Sair do jogo
			se       (t.tecla_pressionada(t.TECLA_ESC)                           ) {pare}
			// Pausar jogo
			senao se (t.tecla_pressionada(t.TECLA_P)                             ) {duracaoPausa += pause()}
				
			senao
			{
			// Pular
				se (t.tecla_pressionada(t.TECLA_SETA_ACIMA   ) e perNoChao)
				{velocidadePer[1] -= aceleracaoPer[1] teclas+="^ "}
			// Move a peça pra esquerda
				se (t.tecla_pressionada(t.TECLA_SETA_ESQUERDA)) 
				{velocidadePer[0] -= aceleracaoPer[0] teclas+="< "}
			// Move a peça pra direita
				se (t.tecla_pressionada(t.TECLA_SETA_DIREITA)) 
				{velocidadePer[0] += aceleracaoPer[0] teclas+="> "}
			}
			
			atualizar_personagem()
			atualizar_camera()

			se (ultimoSegundo + 1000 < u.tempo_decorrido())
			{
				ultimoSegundo = u.tempo_decorrido()
				fps = contFrames
				contFrames = 0
			}
			// Desenha na tela oq está acontecendo
			se ((correcao < duracaoTick) ou
			    (correcao > duracaoTick e correcao < duracaoTick*10 e (tickAtual%10  == 0)) ou
			    (correcao > duracaoTick                             e (tickAtual%100 == 0))) {desenhe()}
		}

		g.liberar_imagem(mapaAtual[0])
		g.liberar_imagem(mapaAtual[1])
	}

	// Converte uma medida em pixel para tiles
	funcao inteiro pixelParaTile (inteiro pixel) {retorne tp.real_para_inteiro(1.0*pixel/TAM_TILE)}
	// Valor absoluto de um número real
	funcao inteiro mod (inteiro numero) {retorne tp.real_para_inteiro(m.valor_absoluto(1.0*numero))}
	// Responde se o valor está entre um número mínimo e um número máximo
	funcao logico entre    (inteiro num, inteiro min, inteiro max) {retorne ((num >= min) e (num <= max))}
	funcao logico entreZero(inteiro num,              inteiro max) {retorne entre(num, 0, max)}
	// Responde se existe um bloco de colisão na posição em tiles do mapa atual
	funcao logico tem_bloco(inteiro x, inteiro y) {se (nao entreZero(x-1, tamMapaAtual[0]-2) ou nao entreZero(y, tamMapaAtual[1]-1)) {retorne verdadeiro}
										  retorne g.obter_cor_pixel(mapaAtual[1], x, y) == g.COR_BRANCO}
	// Responde se a posição em pixels é valída para o tamanho dado para o mapa atual
	funcao logico posicao_valida_personagem(inteiro x, inteiro y) {retorne posicao_valida(x, y, tamPersonagem[0], tamPersonagem[1])}
	funcao logico posicao_valida(inteiro x, inteiro y, inteiro largura, inteiro altura)
	{
		inteiro cantos[4][2] = {{x          ,y},
						    {x          ,y+altura-1},
						    {x+largura-1,y},
						    {x+largura-1,y+altura-1}}
		para (inteiro i=0; i<4; i++) 
		{se (tem_bloco(pixelParaTile(cantos[i][0]), pixelParaTile(cantos[i][1]))) {retorne falso}}

		// Eu tenho que refazer essa parte do código, mas fica para um momento futuro
		se (altura > TAM_TILE) {para(inteiro yRelativo=TAM_TILE; yRelativo<altura; yRelativo += TAM_TILE)
		{
			se (tem_bloco(pixelParaTile(x           ), pixelParaTile(y+yRelativo))) {retorne falso}
			se (tem_bloco(pixelParaTile(x +largura-1), pixelParaTile(y+yRelativo))) {retorne falso}
		}}
		se (largura > TAM_TILE) {para(inteiro xRelativo=TAM_TILE; xRelativo<largura; xRelativo += TAM_TILE)
		{
			se (tem_bloco(pixelParaTile(x+xRelativo), pixelParaTile(y           ))) {retorne falso}
			se (tem_bloco(pixelParaTile(x+xRelativo), pixelParaTile(y +largura-1))) {retorne falso}
		}}
		
		retorne verdadeiro
	}
	funcao inteiro proxima_posicao_valida(inteiro eixo)
	{
		inteiro posicao[2] = {posPersonagem[0], posPersonagem[1]}

		// Checa se já não está na posição mais próxima possível
		posicao[eixo] += (posicao[eixo] / mod(posicao[eixo]))
		se (nao posicao_valida_personagem(posicao[0], posicao[1])) {retorne posicao[eixo] - (posicao[eixo] / mod(posicao[eixo]))}
		posicao[eixo] -= (posicao[eixo] / mod(posicao[eixo]))
		
		
		inteiro direcao = 1
		para (inteiro i= velocidadePer[eixo]/2; i>0; i/=2)
		{
			posicao[eixo] += i*direcao
														 direcao = -1
			se (posicao_valida_personagem(posicao[0], posicao[1])) {direcao =  1}
		}
		enquanto (nao posicao_valida_personagem(posicao[0], posicao[1])) {posicao[eixo] -= (posicao[eixo] / mod(posicao[eixo]))}
		retorne posicao[eixo]
	}
	
	funcao atualizar_camera()
	{
		para(inteiro i=0; i<2; i++) 
		{
			posCamera[i] = posPersonagem[i]  -(meioTela[i])
			se (posPersonagem[i] <                              meioTela[i]) {posCamera[i] = 0}
			se (posPersonagem[i] > (tamMapaAtual[i]*TAM_TILE) - meioTela[i]) {posCamera[i] = (tamMapaAtual[i]  - TAM_TELA[i])*TAM_TILE}
		}
	}
	funcao atualizar_personagem()
	{
		// Eixo horizontal
		velocidadePer[0] /= 2
		se (mod(velocidadePer[0]) < 1) {velocidadePer[0] = 0 
								  perParado        = verdadeiro}
		senao se (nao posicao_valida_personagem(posPersonagem[0] + velocidadePer[0], posPersonagem[1])) 
		{
			posPersonagem[0]  = proxima_posicao_valida(0)
			velocidadePer[0]  = 0
		}
		senao {posPersonagem[0] += velocidadePer[0]}
		perIndoEsquerda = velocidadePer[0] < 0
		perParado = (velocidadePer[0] == 0)

		// Eixo vertical
		velocidadePer[1] += GRAVIDADE
		//se (velocidadePer[1] == 0) {limpa() escreva(posPersonagem[0], ", ", posPersonagem[1])}

		se (nao posicao_valida_personagem(posPersonagem[0], posPersonagem[1] + velocidadePer[1])) 
		{
			posPersonagem[1]  = proxima_posicao_valida(1)
			velocidadePer[1]  = 0
		}
		senao {posPersonagem[1] += velocidadePer[1]}
		
		perSubindo = velocidadePer[1] < 0
		perNoChao  = nao posicao_valida_personagem(posPersonagem[0], posPersonagem[1]+1)
		
	}

	funcao novoMapa(cadeia id)
	{
		g.liberar_imagem(mapaAtual[0])
		g.liberar_imagem(mapaAtual[1])
		
		mapaAtual[0] = g.carregar_imagem("/Mapas/"+faseAtual+".png")
		mapaAtual[1] = g.carregar_imagem("/Mapas/"+faseAtual+".bmp")
						    
		tamMapaAtual[0] = g.largura_imagem(mapaAtual[1])
		tamMapaAtual[1] = g.altura_imagem(mapaAtual[1])
	}
	
	funcao desenhe()
	{
		contFrames++
		g.definir_cor(g.COR_BRANCO)
		g.limpar()

		g.desenhar_imagem(-posCamera[0],
					   -posCamera[1], 
					   mapaAtual[0])
		//limpa() escreva(posPersonagem[0], ", ", posPersonagem[1])
		inteiro			 horizontal = 2 
		se (perIndoEsquerda) horizontal = 0
		se (perParado)		 horizontal = 1
		inteiro 		 vertical = 2
		se (perSubindo) vertical = 0
		se (perNoChao)	 vertical = 1
		g.desenhar_imagem(posPersonagem[0] - posCamera[0], 
					   posPersonagem[1] - posCamera[1], 
					   spritesPersonagem[vertical][horizontal])

		/* Tempo  /
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 0, ("Tempo: " + tickAtual*duracaoTick/1000.0))
		/**/
		/* Teclas */
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 0, ("Teclas: " + teclas))
		/**/
		/* FPS    */
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 35, ("FPS: " + fps))
		/**/
		
		g.renderizar()
	}

	funcao inteiro pause()
	{
		inteiro horarioDaPausa  = u.tempo_decorrido(),
		largura = TAM_TELA[0]*TAM_TILE/20, altura = largura*3,
		
		pos[2] = {TAM_TELA[0]*TAM_TILE/2-(largura/2), 
				TAM_TELA[1]*TAM_TILE/2-(altura /2)}
		
		g.definir_cor(g.criar_cor(19, 25, 25))
		g.limpar()
		g.definir_cor(g.criar_cor(38, 50, 50))
		g.desenhar_retangulo(pos[0]-largura, pos[1], largura, altura, verdadeiro, verdadeiro)
		g.desenhar_retangulo(pos[0]+largura, pos[1], largura, altura, verdadeiro, verdadeiro)
		g.renderizar()
		
		t.ler_tecla()
		enquanto (verdadeiro) {se (t.ler_tecla() == t.TECLA_P) {pare}}
		retorne (u.tempo_decorrido() - horarioDaPausa)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1383; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */