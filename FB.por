programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
		
	const inteiro ALTURA_TELA = 400, LARGURA_TELA = 600, GRAVIDADE = 5, DURACAO_TICK = 50, CANOS_POR_JOGO = 3, FORCA_ASA = 25

	real t=0.0, y0 = -200.0, v0 = FORCA_ASA*1.0, yPersonagem
	
	inteiro canos[CANOS_POR_JOGO][2] = {{600,100}, {800,100}, {1000,100}}, // X, Y

	distanciaPorTick = 5, tamanhoPersonagem = (ALTURA_TELA/10)
	
	funcao inicio()
	{
		
		
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LARGURA_TELA, ALTURA_TELA)

		inteiro intervaloPulo = 0
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
		{
			se (intervaloPulo <= 0 e t.tecla_pressionada(t.TECLA_ESPACO)) {baterAsa() intervaloPulo=5}
			intervaloPulo--
			para (inteiro i=0; i<CANOS_POR_JOGO; i++) {canos[i][0] -= distanciaPorTick}
			yPersonagem = (y0 + (v0*t) - (GRAVIDADE*t*t/2))
			se (yPersonagem > -275) {t++}

			
			desenhar()
			u.aguarde(DURACAO_TICK)
		}
	}
	
	funcao desenhar()
	{
		g.definir_cor(g.criar_cor(5, 200, 255))
		g.limpar()
		
		g.definir_cor(g.criar_cor(0, 207, 38))
		g.desenhar_retangulo(0, (ALTURA_TELA - ALTURA_TELA/4), LARGURA_TELA, (ALTURA_TELA/4), falso, verdadeiro)

		// Passaro
		g.definir_cor(g.COR_AMARELO)
		g.desenhar_retangulo(50, -yPersonagem, tamanhoPersonagem, tamanhoPersonagem, verdadeiro, verdadeiro)

		// Canos
		g.definir_cor(g.COR_VERDE)
		para (inteiro i=0; i<CANOS_POR_JOGO; i++)
		{
			g.desenhar_retangulo(canos[i][0], 0, 60, canos[i][1], falso, verdadeiro)
			g.desenhar_retangulo(canos[i][0], 100+canos[i][1], 60, 400, falso, verdadeiro)
		}
		
		g.renderizar()
	}

	funcao baterAsa()
	{
		t = 0.0
		y0 = yPersonagem*1.0
		v0 = (v0*t) - (GRAVIDADE*t) + FORCA_ASA
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1551; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {t, 9, 6, 1}-{canos, 11, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */