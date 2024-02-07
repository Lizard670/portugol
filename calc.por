programa
{
	inclua biblioteca Tipos
	inclua biblioteca Mouse --> mo
	inclua biblioteca Graficos --> g
	inclua biblioteca Matematica --> m
	inclua biblioteca Texto --> t

	const inteiro T = 40 // Quantidade de pixel por lado do quadrado
	inteiro       fundo = g.criar_cor(217, 228, 241),
		   botaoNormal = g.criar_cor(239, 244, 248),
		  botaoClicado = g.criar_cor(215, 226, 239), 
		         borda = g.criar_cor(135, 151, 170)

	const inteiro QUANT_LINHAS  = 4,
			    QUANT_COLUNAS = 5
	cadeia botoes[QUANT_LINHAS][QUANT_COLUNAS] = 
		{{"<", "ce", "c", "/", "*"},
		{"7",  "8", "9", "-", "+"},
		{"4",  "5", "6", "0", "√"},
		{"1",  "2", "3", ".", "="}}
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(11*T/2, 6*T)
		g.definir_titulo_janela("Calculadora")
		g.definir_fonte_texto("Microsoft JhengHei UI")
		desenhe()
		desenhe()
	}

	funcao desenhe()
	{
		g.definir_cor(fundo)
		g.limpar()

		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(T/4, T/4, 5*T, 5*T/4, verdadeiro, verdadeiro)
		g.definir_cor(borda)
		g.desenhar_retangulo(T/4, T/4, 5*T, 5*T/4, verdadeiro, falso)

		para(inteiro i=0;i<QUANT_LINHAS;i++) {para(inteiro j=0;j<QUANT_COLUNAS;j++)
		{
			desenhar_botao(j, i, botoes[i][j], falso)
		}}

		g.renderizar()
	}

	funcao desenhar_botao(inteiro x, inteiro y, cadeia texto, logico clicado)
	{
		inteiro xCerto = arredondar(  T/4.0+(x*T)),
			   yCerto = arredondar(  T/4.0+(y*T)+(3*T/2)),
		       largura = arredondar(7*T/8.0),
			   altura = arredondar(3*T/4.0)
		
		se(clicado) {g.definir_cor(botaoClicado)}
		senao       {g.definir_cor(botaoNormal)}
		g.desenhar_retangulo(xCerto, yCerto, largura, altura, verdadeiro, verdadeiro)
		g.definir_cor(borda)
		g.desenhar_retangulo(xCerto, yCerto, largura, altura, verdadeiro, falso)

		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(16.0)
		xCerto += arredondar((largura - g.largura_texto(texto))/2.0)
		yCerto += arredondar((altura  - g.altura_texto(texto) )/2.0)+4
		g.desenhar_texto(xCerto, yCerto, texto)
	}

	funcao inteiro arredondar(real n) {retorne Tipos.real_para_inteiro(m.arredondar(n, 3))}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1980; 
 * @PONTOS-DE-PARADA = 30;
 * @SIMBOLOS-INSPECIONADOS = {x, 51, 31, 1}-{y, 51, 42, 1}-{texto, 51, 52, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */