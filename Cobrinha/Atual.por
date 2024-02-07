programa
{
	inclua biblioteca Teclado --> t
	inclua biblioteca Tipos --> tp
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Graficos --> g
	
	cadeia path = ""
	//path = ""

	const inteiro TAMANHO_PIXEL = 20, LARGURA = 40, ALTURA = 25, ALTURA_BARRA = 80,
		ESQUERDA = -1,
		DIREITA  =  1,
		CIMA     = -2,
		BAIXO    =  2

	inteiro cabecas[5] = {g.carregar_imagem(path+"-2.png"),
					  g.carregar_imagem(path+"-1.png"),
					  0,
					  g.carregar_imagem(path+"1.png"),
					  g.carregar_imagem(path+"2.png")}
		
	logico temCobra[ALTURA][LARGURA], jogoAcabou = falso
	inteiro posFruta[2], posCabeca[2], direcaoCabeca = CIMA, caminhos[ALTURA][LARGURA],
		   background = g.carregar_imagem(path+"bg.png"), tamanhoInicial = 3, tempoInicial = u.tempo_decorrido(),
		   cooldown=0, tick=0, tamanho=tamanhoInicial, intervaloMovimento = 25
		   
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(LARGURA*TAMANHO_PIXEL, ALTURA*TAMANHO_PIXEL + ALTURA_BARRA)
		g.definir_tamanho_texto(40.0)

		para(inteiro x=0; x<LARGURA; x++) {para(inteiro y=0; y<ALTURA; y++) {temCobra[y][x] = falso}}
		posCabeca[1] =  ALTURA/2 
		posCabeca[0] = LARGURA/2
		posFruta[0] = u.sorteia(0, LARGURA-1) 
		posFruta[1] = u.sorteia(0,  ALTURA-1)
		
		colocarCobra(LARGURA/2, ALTURA/2, BAIXO)
		desenhe()

		tempoInicial = u.tempo_decorrido()
		enquanto(nao jogoAcabou)
		{
			logico houveAlteracao = falso
			
			se (t.alguma_tecla_pressionada() e cooldown <= 0)
			{
				se       (t.tecla_pressionada(t.TECLA_SETA_ACIMA)    e direcaoCabeca != BAIXO)     {direcaoCabeca = CIMA}
				senao se (t.tecla_pressionada(t.TECLA_SETA_ESQUERDA) e direcaoCabeca != DIREITA)   {direcaoCabeca = ESQUERDA}
				senao se (t.tecla_pressionada(t.TECLA_SETA_DIREITA)  e direcaoCabeca != ESQUERDA)  {direcaoCabeca = DIREITA}
				senao se (t.tecla_pressionada(t.TECLA_SETA_ABAIXO)   e direcaoCabeca != CIMA)      {direcaoCabeca = BAIXO}

				cooldown = intervaloMovimento
				//houveAlteracao = verdadeiro
			}

			se(tick%intervaloMovimento == 0) {moverCobra()   houveAlteracao = verdadeiro   cooldown = 1}

			se(houveAlteracao) {desenhe()}
			tick++
			cooldown--
			u.aguarde(10)
		}

		enquanto(nao falso) {}
	}

	funcao desenhe()
	{
		g.limpar()
		g.desenhar_imagem(0,0, background)
		g.definir_cor(g.COR_PRETO)
		
		// Pontuação
		cadeia texto = (tamanho-tamanhoInicial)+""
		g.desenhar_texto((TAMANHO_PIXEL*LARGURA/2 - g.largura_texto(texto))/2,
					  (ALTURA_BARRA            -  g.altura_texto(texto))/2, 
					  texto)
		// Tempo
		inteiro ms = (u.tempo_decorrido() - tempoInicial),
			   minutos  = ms / (60*1000),
			   segundos = (ms - minutos*60*1000) / 1000
		texto = minutos+":"+segundos
		g.desenhar_texto((TAMANHO_PIXEL*LARGURA/2 - g.largura_texto(texto))/2 + TAMANHO_PIXEL*LARGURA/2,
					  (ALTURA_BARRA            -  g.altura_texto(texto))/2, 
					  texto)
		
		
		// Fruta
		g.definir_cor(g.COR_VERMELHO)
		g.desenhar_retangulo(posFruta[0]*TAMANHO_PIXEL, 
						 posFruta[1]*TAMANHO_PIXEL + ALTURA_BARRA, 
						 TAMANHO_PIXEL, TAMANHO_PIXEL, 
						 falso, verdadeiro)

		// Cobra
		para(inteiro i=0, x=posCabeca[0], y=posCabeca[1]; i<tamanho; i++) 
		{
			se (i<32) {g.definir_cor(g.criar_cor(i*8, i*8, i*8))}
			
			g.desenhar_retangulo(x*TAMANHO_PIXEL, 
							 y*TAMANHO_PIXEL + ALTURA_BARRA, 
							 TAMANHO_PIXEL, TAMANHO_PIXEL, 
							 falso, verdadeiro)
			inteiro antigoX = x
			x += direcaoX(caminhos[y][x])
			y += direcaoY(caminhos[y][antigoX])
		}

		// Cabeça
		g.desenhar_imagem(posCabeca[0]*TAMANHO_PIXEL, 
					   posCabeca[1]*TAMANHO_PIXEL + ALTURA_BARRA,
					   cabecas[direcaoCabeca+2])

		g.renderizar()
	}
	
	funcao inteiro direcaoX(inteiro direcao) {retorne direcao%2} // -1 = esquerda   1 = direita
	funcao inteiro direcaoY(inteiro direcao) {retorne direcao/2} // -2 = cima       2 = baixo
	
	funcao colocarCobra(inteiro x, inteiro y, inteiro caminho) {temCobra[y][x]=verdadeiro   caminhos[y][x]=caminho}
	funcao   moverCobra()
	{
		inteiro novaPos[2] = {posCabeca[0] + direcaoX(direcaoCabeca), 
						  posCabeca[1] + direcaoY(direcaoCabeca)}

		// Acaba o jogo se bater em um segmentou ou tentar sair do mapa
		se (nao entreZero(novaPos[0], LARGURA-1) ou 
		    nao entreZero(novaPos[1],  ALTURA-1) ou
		        temCobra[novaPos[1]][novaPos[0]])
		{
			jogoAcabou = verdadeiro
			retorne
		}

		// Adiciona novo segmento
		colocarCobra(novaPos[0], novaPos[1], direcaoCabeca*-1) 

		// Come fruta se tiver em cima de uma
		se (temCobra[posFruta[1]][posFruta[0]]) 
		{
			enquanto(temCobra[posFruta[1]][novaPos[0]]) {posFruta[0] = u.sorteia(0, LARGURA-1) 
											     posFruta[1] = u.sorteia(0,  ALTURA-1)}

			se (intervaloMovimento>1) {intervaloMovimento--}
			tamanho++
		}
		
		// Apaga o segmento excedente
		senao 
		{
			para(inteiro i=0, x=posCabeca[0], y=posCabeca[1]; i<=tamanho; i++) 
			{
				se (i == tamanho) {temCobra[y][x] = falso}
				
				inteiro antigoX = x
				x += direcaoX(caminhos[y][x])
				y += direcaoY(caminhos[y][antigoX])
			}
		}

		// Seta a novaPos como posição atual
		posCabeca[0] = novaPos[0]
		posCabeca[1] = novaPos[1]
	}

	funcao logico entre(inteiro num, inteiro min, inteiro max) {retorne ((num >= min) e (num <= max))}
	funcao logico entreZero(inteiro num, inteiro max){retorne entre(num, 0, max)}
	funcao inteiro modI(inteiro num) {se(num<0) {retorne -num} retorne num}
	funcao inteiro pitagoras(inteiro a, inteiro b) {retorne tp.real_para_inteiro(mat.raiz((1.0* a*a+b*b), 2.0))}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4715; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */