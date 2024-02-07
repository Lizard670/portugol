programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> m
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t


	const inteiro TICKS_POR_SEGUNDO = 60, TAM_TELA[2] = {800,550},
		QUANT_ESTRELAS = 20,
		QUANT_METEOROS =  5,
		TIPOS_METEOROS = 20,
		QUANT_PONTOS   = 17

	
	cadeia teclas=""
	logico atirando = falso
	inteiro duracaoTick = 1000 / TICKS_POR_SEGUNDO,
		tickAtual = 0,
		contFrames = 0,
		fps = 0,
		meioTela[2] = {TAM_TELA[0]/2, TAM_TELA[1]/2},
		corBackground  =  g.criar_cor(94, 63, 107),
		velocidadeFase = 10,

			       vidas    = 3,
		    aceleracaoPer    = 3,
		    velocidadePer    = 0,
		    posPersonagem[2] = {meioTela[0], TAM_TELA[1]-100},
		spritesPersonagem[6] = {g.carregar_imagem("/nave/esquerda.png"),
						    g.carregar_imagem("/nave/parado.png"  ),
						    g.carregar_imagem("/nave/direita.png" ),
						    g.carregar_imagem("/nave/quebrado.png"),
						    g.carregar_imagem("vida.png"),
						    g.carregar_imagem("tiro.png")},
		pontosColisao[QUANT_PONTOS][2] = {{49,0}, {42,1}, {56,1}, {41,15}, {57,15}, {39,28}, {59,28}, {1,32}, {97,32}, {26,34}, {72,34}, {13,40}, {85,40}, {2,47}, {96,47}, {3,61}, {95,61}},
	 
		/* [0] = posição x
		 * [1] = posicao y
		 * [2] = meteoro -> imagem | estrelas -> tipo
		 * [3] = largura
		 * [4] = altura
		 * [5] = estado */
		     meteoros[QUANT_METEOROS][6],
		tiposMeteoros[TIPOS_METEOROS][3],
		     estrelas[QUANT_ESTRELAS][3],
		   imagemEstrelas[2] = {g.carregar_imagem("/estrela/grande.png"),
						    g.carregar_imagem("/estrela/pequena.png")}
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(TAM_TELA[0], TAM_TELA[1])
		g.definir_titulo_janela("Jogo")

		inteiro inicioDoJogo = u.tempo_decorrido(), ultimoSegundo = inicioDoJogo, duracaoPausa = 0
			
		
		// Inicia Estrelas do background
		para (inteiro i=0; i<QUANT_ESTRELAS; i++)
		{
			estrelas[i][0] = u.sorteia(10, TAM_TELA[0]-10) // Posição x
			estrelas[i][1] = u.sorteia(-10, TAM_TELA[1])   // Posição y
			estrelas[i][2] = u.sorteia(0, 1)			  // Tamanho da estrela
		}

		// Inicia meteoros
		para (inteiro i=0; i<TIPOS_METEOROS; i++)
		{
			tiposMeteoros[i][2] = g.carregar_imagem("/meteoro/("+i+").png")
			tiposMeteoros[i][0] = g.largura_imagem(tiposMeteoros[i][2])
			tiposMeteoros[i][1] = g.altura_imagem (tiposMeteoros[i][2])
		}
		para (inteiro i=0; i<QUANT_METEOROS; i++) {novo_meteoro(i)}

		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			tickAtual++
			inteiro instanteAtual = u.tempo_decorrido()
			// Corrige o tempo do jogo pra cada segundo ter 20 ticks
			inteiro tempoEsperado = instanteAtual - inicioDoJogo - duracaoPausa
			tempoEsperado -= (tempoEsperado % duracaoTick)
			inteiro correcao = tempoEsperado - tickAtual*duracaoTick
			
			inteiro duracaoAtual = duracaoTick - correcao
			se (duracaoAtual < 0) {duracaoAtual = 0}
			u.aguarde(duracaoAtual)

			// Pega input do jogador e faz mudanças se necessessárias
			teclas = "" // Teclas que estão sendo detectadas
				// Sair do jogo
			se       (t.tecla_pressionada(t.TECLA_ESC)) {pare}
				// Pausar jogo
			senao se (t.tecla_pressionada(t.TECLA_P)  ) {duracaoPausa += pause()}
				
			senao
			{
				// Move a peça pra esquerda
				se (t.tecla_pressionada(t.TECLA_SETA_ESQUERDA)) 
				{velocidadePer -= aceleracaoPer teclas+="< "}
				// Move a peça pra direita
				se (t.tecla_pressionada(t.TECLA_SETA_DIREITA)) 
				{velocidadePer += aceleracaoPer teclas+="> "}

				// Atira
				atirando = (t.tecla_pressionada(t.TECLA_SETA_ACIMA)) 
				
			}
			
			atualizar_personagem()
			atualizar_estrelas()
			atualizar_meteoros()

			se (ultimoSegundo + 1000 <= instanteAtual)
			{
				ultimoSegundo = instanteAtual
				fps = contFrames
				contFrames = 0
			}
			
			// Desenha na tela oq está acontecendo
			se ((correcao < duracaoTick) ou
			    (correcao > duracaoTick e correcao < duracaoTick*10 e (tickAtual%10  == 0)) ou
			    (correcao > duracaoTick                             e (tickAtual%100 == 0))) {desenhe()}
		}

		para (inteiro i=0; i<5; i++) {g.liberar_imagem(spritesPersonagem[i])}
		para (inteiro i=0; i<2; i++) {g.liberar_imagem(imagemEstrelas[i])
								g.liberar_imagem( tiposMeteoros[i][2])}
	}

	// Valor absoluto de um número inteiro
	funcao inteiro mod (inteiro numero) {retorne tp.real_para_inteiro(m.valor_absoluto(1.0*numero))}
	// Responde se o valor está entre um número mínimo e um número máximo
	funcao logico entre    (inteiro num, inteiro min, inteiro max) {retorne ((num >= min) e (num <= max))}
	funcao logico entreZero(inteiro num,              inteiro max) {retorne entre(num, 0, max)}

	funcao atualizar_personagem()
	{
		velocidadePer = velocidadePer * 3/4

		posPersonagem[0] += velocidadePer

		se       (posPersonagem[0] <  0)           {posPersonagem[0] = 0}
		senao se (posPersonagem[0] >= TAM_TELA[0]) {posPersonagem[0] = TAM_TELA[0]-1}
	}
	funcao atualizar_estrelas()
	{
		para (inteiro i=0; i<QUANT_ESTRELAS; i++)
		{
			se (estrelas[i][1] > TAM_TELA[1])
			{
				estrelas[i][0] = u.sorteia(10, TAM_TELA[0]-10) // Posição x
				estrelas[i][1] = u.sorteia(-200, -25)          // Posição y
				estrelas[i][2] = u.sorteia(0, 1)			  // Tamanho da estrela
			}
			senao {estrelas[i][1] += velocidadeFase}
		}
	}
	funcao atualizar_meteoros()
	{
		para (inteiro i=0; i<QUANT_METEOROS; i++)
		{
			se (meteoros[i][1] >= TAM_TELA[1]) {novo_meteoro(i)} // Saiu pra fora da tela
			senao {meteoros[i][1] += velocidadeFase}

			se (meteoros[i][5] > 0) {
				se (atirando
				    e (entre(posPersonagem[0]-5, meteoros[i][0],  meteoros[i][0]+meteoros[i][3])
				    ou entre(posPersonagem[0]+5, meteoros[i][0],  meteoros[i][0]+meteoros[i][3])))
				{
					meteoros[i][5] = 0
				}
	
				// Meteoro não destruído na faixa Y da nave
				se (entre(meteoros[i][1], posPersonagem[1]-meteoros[i][4], posPersonagem[1]+75)) 
				{
					inteiro posRelativa[2] = {posPersonagem[0]-(meteoros[i][0]-(meteoros[i][3]/2))-49,
										 posPersonagem[1]-(meteoros[i][1])}
					para (inteiro j=0; j<QUANT_PONTOS; j++) {se (colisao_com_meteoro(i, posRelativa[0]+pontosColisao[j][0], posRelativa[1]+pontosColisao[j][1]))
					{
						vidas--
						meteoros[i][5] = 0
						pare
					}}
				}
			}
		}
	}
	funcao novo_meteoro(inteiro index)
	{
		inteiro tipo = u.sorteia(0, TIPOS_METEOROS-1)
		
		meteoros[index][0] = u.sorteia(0, TAM_TELA[0]-1)	// Posição x
		meteoros[index][1] = u.sorteia(-800, -115)		// Posição y
		meteoros[index][2] = tiposMeteoros[tipo][2]		// Tipo do meteoro
		meteoros[index][3] = tiposMeteoros[tipo][0]		// Largura do meteooro
		meteoros[index][4] = tiposMeteoros[tipo][1]		// Altura  do meteoro
												// Vida do meteoro
		meteoros[index][5] = (meteoros[index][3]+meteoros[index][4])/20	
	}
	funcao logico colisao_com_meteoro(inteiro index, inteiro x, inteiro y)
	{
		se (nao (entreZero(x, meteoros[index][3]-1) e entreZero(y, meteoros[index][4]-1))) {retorne falso}
		retorne (g.obter_cor_pixel(meteoros[index][2], x, y) == 0)
	}
	
	funcao desenhe()
	{
		contFrames++
		g.definir_cor(corBackground)
		g.limpar()

		// Desenhar estrelas
		para (inteiro i=0; i<QUANT_ESTRELAS; i++)
		{
			g.desenhar_imagem(estrelas[i][0] -10 +(estrelas[i][2]*5),
						   estrelas[i][1], 
						   imagemEstrelas[estrelas[i][2]])
		}

		// Desenhar tiro
		se (atirando)
		{
			g.desenhar_imagem(posPersonagem[0]-5, 
						   posPersonagem[1]-500, 
						   spritesPersonagem[5])
		}

		// Desenhar personagem
		inteiro frame = 1
		se (velocidadePer != 0) {frame = (velocidadePer / mod(velocidadePer))+1}
		
		g.desenhar_imagem(posPersonagem[0]-49, 
					   posPersonagem[1], 
					   spritesPersonagem[frame])

		// Desenhar meteoros
		para (inteiro i=0; i<QUANT_METEOROS; i++)
		{
			se (meteoros[i][5] > 0)
			{
				g.desenhar_imagem(meteoros[i][0] -(meteoros[i][3]/2),
							   meteoros[i][1], 
							   meteoros[i][2])
			}
		}

		// Desenhar vidas
		para (inteiro i=0; i<vidas; i++)
		{
			g.desenhar_imagem(33*i,
						   0, 
						   spritesPersonagem[4])
		}

		/* Tempo  /
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 0, ("Tempo: " + tickAtual*duracaoTick/1000.0))
		/**/
		/* Teclas /
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 0, ("Teclas: " + teclas))
		/**/
		/* FPS    */
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 35, ("FPS: " + fps))
		/**/
		
		g.renderizar()
	}

	funcao inteiro pause()
	{
		inteiro horarioDaPausa  = u.tempo_decorrido(),
		largura = TAM_TELA[0]/20, altura = largura*3,
		
		pos[2] = {TAM_TELA[0]/2-(largura/2), 
				TAM_TELA[1]/2-(altura /2)}
		
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
 * @POSICAO-CURSOR = 621; 
 * @DOBRAMENTO-CODIGO = [139, 148, 191, 203, 277];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */