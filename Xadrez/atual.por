programa
{
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g
	inclua biblioteca Texto --> t

	const cadeia SO = ""
	const caracter
		  piao[2] = {'p', 'o'},
		 torre[2] = {'r', 't'},
		cavalo[2] = {'h', 'j'},
		 bispo[2] = {'b', 'n'},
		rainha[2] = {'q', 'w'},
		   rei[2] = {'k', 'l'},
		branco = '+'
	
	caracter tabuleiro[8][8]
	inteiro background = g.carregar_imagem(SO+"bg.png"), mousePos[2], turno=0
	logico jogoAcabou = falso, posValida = falso
	
	funcao inicio()
	{
		para(inteiro i=1;i<7; i++) {para(inteiro j=0;j<8;j++)
		{
			se      (i==1) {tabuleiro[i][j] = piao[0]}
			senao se(i==6) {tabuleiro[i][j] = piao[1]}
			
			senao {tabuleiro[i][j] = ' '}
		}}
		para(inteiro i=0;i<2;i++) 
		{
			tabuleiro[i*7][0] =  torre[i]
			tabuleiro[i*7][1] = cavalo[i]
			tabuleiro[i*7][2] =  bispo[i]
			tabuleiro[i*7][3] = rainha[i]
			tabuleiro[i*7][4] =    rei[i]
			tabuleiro[i*7][5] =  bispo[i]
			tabuleiro[i*7][6] = cavalo[i]
			tabuleiro[i*7][7] =  torre[i]
		}

		g.iniciar_modo_grafico(falso)
		g.definir_titulo_janela("Xadrez")
		g.definir_dimensoes_janela(400, 400)
		g.carregar_fonte("SO+CHEQ_TT.TTF")

		
		enquanto(nao jogoAcabou) 
		{
			
			desenhe()
		}
	}

	funcao desenhe()
	{
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.desenhar_imagem(0,0, background)
		g.definir_cor(g.COR_PRETO)
		
		g.definir_fonte_texto("Chess Regular")
		g.definir_tamanho_texto(36.0)
		cadeia textoExemplo = tabuleiroPraTexto(0)
		inteiro alturaLinha = g.altura_texto(textoExemplo)-6,
			posY = (400 - alturaLinha*8)/2,
			posX = (400 - g.largura_texto(textoExemplo) )/2
		para (inteiro i=0;i<8; i++) {g.desenhar_texto(posX, posY+(i*alturaLinha), tabuleiroPraTexto(i))}

		g.renderizar()
	}

	funcao cadeia tabuleiroPraTexto(inteiro linhaDesejada)
	{
		cadeia texto = ""
		para (inteiro i=0;i<8; i++) 
		{
			cadeia linha = ""
			para(inteiro j=0;j<8;j++) 
			{
				se((i+j)%2 == 1) {linha+=tabuleiro[i][j]}
				senao se(tabuleiro[i][j] == ' ') {linha+=branco}
				senao {linha+=t.caixa_alta(tabuleiro[i][j]+"")}
			}
			se(i==linhaDesejada) {retorne linha}
			texto+=linha+"\n"
		}
		retorne texto
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1167; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */