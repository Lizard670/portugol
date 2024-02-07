programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> m
	inclua biblioteca Texto --> tx
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t

	inteiro terra = g.carregar_imagem("/Texturas/01.png")
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(200, 
							  200)
		g.definir_titulo_janela("Jogo")

		desenhe()
		leia(terra)
	}

	funcao desenhe()
	{
		g.definir_cor(g.COR_BRANCO)
		g.limpar()

		para (inteiro i=0; i<5; i++) {para (inteiro j=0; j<5; j++) 
		{
			g.desenhar_imagem(isoX(j, i),
						   isoY(j, i), 
						   terra)
		}}
		
		

		/* Tempo  /
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 0, ("Tempo: " + tickAtual*duracaoTick/1000.0))
		/**/
		/* Teclas /
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 0, ("Teclas: " + teclas))
		/**/
		/* FPS    /
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(33.0)
		g.desenhar_texto(0, 35, ("FPS: " + fps))
		/**/
		
		g.renderizar()
	}

	funcao inteiro isoY(inteiro x, inteiro y) {retorne (x* 7 + y* 7)}
	funcao inteiro isoX(inteiro x, inteiro y) {retorne (x*15 - y*15)}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 436; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */