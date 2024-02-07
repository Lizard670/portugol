programa
{
	inclua biblioteca Graficos   --> g
	inclua biblioteca Util       --> u
	inclua biblioteca Mouse      --> m
	inclua biblioteca Matematica --> mat
	
	const inteiro  altura = 20,// { 9, 16, 20},
			    largura = 24,// { 9, 16, 24},
		quantidadeBombas = 99,// {10, 40 ,99}
		   tamanhoCelula = 20,
	    TICKS_POR_SEGUNDO = 500,

	                    // 0~8  - Quantidade de bombas
	       oculto = -1, // Celula não descoberto
	bomba         = -2, // Bomba
	bombaDetonada = -3, // Bomba que foi explodida
	semBadeira = 0, // Celula sem bandeira
	   certeza = 1, // Celula com badeira
	 incerteza = 2  // Celula com bandeira de possibilidade 
	inteiro celulas[altura][largura],
	      bandeiras[altura][largura],
	      mouseX=-1, mouseY=-1, botao=3,
	imgCerteza       = g.carregar_imagem(  "/certeza.png"),
	imgBomba         = g.carregar_imagem("/bomba.png"),
	imgBombaDetonada = g.carregar_imagem("/bombaDetonada.png"),
	cores[8] = {g.criar_cor( 64,  80, 191),
			  g.criar_cor(  0, 127,  14),
			  g.criar_cor(194,   0,   0),
			  g.criar_cor( 23,  39, 145),
			  g.criar_cor(127,   0,   0),
			  g.criar_cor(255, 106,   0),
			  g.criar_cor( 33,   0, 127),
			  g.criar_cor(255,   0, 220)},

	        duracaoTick = 1000 / TICKS_POR_SEGUNDO,
	quantidadeBandeiras = 0,
	quantidadeOcultos   = largura*altura,
		  inicioDoJogo
	logico jogoAcabou = falso
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela((largura+4)*tamanhoCelula, (altura+4)*tamanhoCelula)
		g.definir_titulo_janela("Campo minado")
		g.definir_fonte_texto("Arial Black")
		/*
		 * ------------- *
		 * INICIALIZAÇÃO *
		 * ------------- *
		*/
		// Coloca todos os quadrados como ocultos e sem bandeira
		para (inteiro i=0; i<altura; i++) {para (inteiro j=0; j<largura; j++) {celulas[i][j] = oculto bandeiras[i][j] = semBadeira}}
		inicioDoJogo = u.tempo_decorrido()
		desenhe()
		g.renderizar()

		enquanto (verdadeiro)
		{
			m.ler_botao()
			mouseX = pixelParaCord(m.posicao_x())
			mouseY = pixelParaCord(m.posicao_y())
			se (entre(mouseX, 0, largura-1) e entre(mouseY, 0, altura-1)) {pare}
		}

		// Coloca as minas no grid
		para (inteiro i=0; i<quantidadeBombas; i++)
		{
			inteiro y = u.sorteia(0,  altura-1),
			        x = u.sorteia(0, largura-1)
			// re-sorteia enquanto a posição for invalida
			enquanto ((celulas[y][x] == bomba) ou (entre(x, mouseX-1, mouseX+1) e entre(y, mouseY-1, mouseY+1)))
			{y = u.sorteia(0, altura-1) x = u.sorteia(0, largura-1)}
			
			celulas[y][x] = bomba
		}
		revelarCelula(mouseX,mouseY, verdadeiro)

		inicioDoJogo = u.tempo_decorrido()
		enquanto(nao(jogoAcabou) e quantidadeOcultos != quantidadeBombas) 
		{
			para (inteiro r=0; r<100; r++)
			{
				// Input do jogador
				se (m.algum_botao_pressionado())
				{
					mouseX = pixelParaCord(m.posicao_x())
					mouseY = pixelParaCord(m.posicao_y())
					botao  = m.BOTAO_DIREITO
					se (m.botao_pressionado(m.BOTAO_ESQUERDO)) {botao  = m.BOTAO_ESQUERDO}
					// Segura o processamento do jogo para que não tenha clique duplo
					enquanto (m.algum_botao_pressionado()) {}
					
					se (nao(entre(mouseX, 0, largura-1) e entre(mouseY, 0, altura-1))) {pare}
					senao se (botao == m.BOTAO_DIREITO) {alterarBandeira(mouseX,mouseY)}
					senao
					{
						inteiro resultado = revelarCelula(mouseX,mouseY, verdadeiro)
						// Usuário clicou em uma bomba
						se       (resultado == -1)
						{
							
						}
						// Usuario clicou em um quadrado já liberado
						senao se (resultado ==  1)
						{
							inteiro bandeirasEmVolta = 0
							para (inteiro i=-1; i<2; i++) {para (inteiro j=-1; j<2; j++) {se (dentroDoGrid(j+mouseX, i+mouseY)) {se(bandeiras[i+mouseY][j+mouseX] == certeza e entre(celulas[i+mouseY][j+mouseX], bomba, oculto)) {bandeirasEmVolta++}}}}
							se (bandeirasEmVolta == tipoCelula(mouseX,mouseY))
							{
								para (inteiro i=-1; i<2; i++) {para (inteiro j=-1; j<2; j++) {se (dentroDoGrid(j+mouseX, i+mouseY)) {se(bandeiras[i+mouseY][j+mouseX] != certeza) {revelarCelula(j+mouseX, i+mouseY, verdadeiro)}}}}
							}
						}
					}
					pare
				}
				u.aguarde(1)
			}
			desenhe() 
			g.renderizar()
		}

		enquanto (verdadeiro) {}
	}

	funcao desenhe()
	{
		g.definir_cor(g.criar_cor(194, 205, 229))
		g.limpar()

		// Contador de tempo
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(cordParaPixel(1), tamanhoCelula/4, tamanhoCelula*4, tamanhoCelula/2*3, verdadeiro, falso)
		g.definir_tamanho_texto(tamanhoCelula/2*3.0)
		cadeia segundos = ((u.tempo_decorrido() - inicioDoJogo)/1000)+""
		inteiro espaco = tamanhoCelula*4 - g.largura_texto(segundos)-1
		g.desenhar_texto(cordParaPixel(1)+espaco, tamanhoCelula/4+3, segundos)
		
		// Celulas do grid
		se (nao(jogoAcabou)) {quantidadeBandeiras = 0}
		quantidadeOcultos = 0
		g.definir_tamanho_texto(tamanhoCelula*1.0)
		para (inteiro i=0; i<altura; i++) {para (inteiro j=0; j<largura; j++) 
		{
			inteiro espacamento = (tamanhoCelula - g.largura_texto(celulas[i][j] + ""))/2,
			espacamentoInt = (tamanhoCelula - g.largura_texto("?"))/2
			// Borda
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(cordParaPixel(j), cordParaPixel(i), tamanhoCelula, tamanhoCelula, verdadeiro, falso)
			// Meio da célula
			g.definir_cor(g.criar_cor(83, 123, 225))
			se       (entre(celulas[i][j], bomba, oculto)) 
			{
				quantidadeOcultos++
				g.desenhar_retangulo(cordParaPixel(j)+1, cordParaPixel(i)+1, tamanhoCelula-2, tamanhoCelula-2, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				se (jogoAcabou e celulas[i][j] == bomba) {g.desenhar_imagem(cordParaPixel(j), cordParaPixel(i), imgBomba  )}
				senao se (bandeiras[i][j] ==   certeza)  {g.desenhar_imagem(cordParaPixel(j), cordParaPixel(i), imgCerteza) quantidadeBandeiras++}
				senao se (bandeiras[i][j] == incerteza)  {g.desenhar_texto(cordParaPixel(j)+1+espacamentoInt, cordParaPixel(i)+2, "?")}
			}
			senao se (celulas[i][j] == bombaDetonada) {g.desenhar_imagem(cordParaPixel(j), cordParaPixel(i), imgBombaDetonada)}
			senao se (celulas[i][j] != 0) {g.definir_cor(cores[celulas[i][j]-1]) g.desenhar_texto(cordParaPixel(j)+1+espacamento, cordParaPixel(i)+2, celulas[i][j]+"")}
		}}

		// Contador de minas
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(cordParaPixel(largura-4), tamanhoCelula/4, tamanhoCelula*3, tamanhoCelula/2*3, verdadeiro, falso)
		g.definir_tamanho_texto(tamanhoCelula/2*3.0)
		espaco = tamanhoCelula*3 - g.largura_texto((quantidadeBombas - quantidadeBandeiras)+"")-1
		g.desenhar_texto(cordParaPixel(largura-4)+espaco, tamanhoCelula/4+3, (quantidadeBombas - quantidadeBandeiras)+"")
		
	}

	funcao inteiro revelarCelula(inteiro x, inteiro y, logico recursiva)
	{
		se       (celulas[y][x] ==  bomba) {celulas[y][x] = bombaDetonada jogoAcabou = verdadeiro retorne -1}
		senao se (celulas[y][x] != oculto) {retorne  1}

		celulas[y][x] = tipoCelula(x, y)
		// Quando 0, revela todas as células em volta
		se (celulas[y][x] == 0 e recursiva) {para (inteiro i=-1; i<2; i++) {para (inteiro j=-1; j<2; j++) {se (dentroDoGrid(j+x, i+y)) {revelarCelula(j+x, i+y, verdadeiro)}}}}
		retorne 0
	}

	funcao inteiro tipoCelula(inteiro x, inteiro y)
	{
		se (celulas[y][x] == bomba) {retorne bomba}
		inteiro minasEmVolta = 0
		para (inteiro i=-1; i<2; i++) {para (inteiro j=-1; j<2; j++) {se (dentroDoGrid(j+x, i+y)) {se(celulas[i+y][j+x] == bomba) {minasEmVolta++}}}}
		retorne minasEmVolta
	}

	funcao alterarBandeira(inteiro x, inteiro y) {bandeiras[y][x] = (bandeiras[y][x]+1) % 3}
	funcao inteiro pixelParaCord(inteiro pixel) {retorne ((pixel/tamanhoCelula)-2)}
	funcao inteiro cordParaPixel(inteiro cordenada) {retorne (cordenada+2)*tamanhoCelula}
	funcao logico dentroDoGrid(inteiro x, inteiro y) {retorne (entre(x, 0, largura-1) e entre(y, 0, altura-1))}
	funcao logico entre(inteiro numero, inteiro min, inteiro max) {retorne (numero >= min e numero <= max)}
	funcao logico entreR(real   numero,    real min,    real max) {retorne (numero >= min e numero <= max)}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6503; 
 * @DOBRAMENTO-CODIGO = [174, 185];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {quantidadeOcultos, 38, 1, 17};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */