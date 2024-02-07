programa
{
	inclua biblioteca Mouse      --> m
	inclua biblioteca Util       --> u
	inclua biblioteca Tipos      --> t
	inclua biblioteca Sons       --> s
	inclua biblioteca Graficos   --> g
	inclua biblioteca Matematica --> mat


	const inteiro RAIO_TELA[2] = {400, 300},
			    MAX_BOLAS=10,
			    FPS = 60, 
			    G = 10 // Gravidade
			
	inteiro tipos[2][2] = {{10, g.COR_BRANCO},
					   {15, g.COR_VERMELHO}}
	
	// [0] = x
	// [1] = y
	// [2] = velocidade x
	// [3] = velocidade y
	// [4] = tipo
	// [5] = rotacao
	// [6] = 1 se existe 
	inteiro bolas[100][7],
		qtdBolas = 0
	
	real realFPS   = 1.0,
		deltaTime = 0.0
	
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(RAIO_TELA[0]*2, RAIO_TELA[1]*2)

		add_bola(0,0,1)
		inteiro ultimoTick = 0,
			   tickAtual = u.tempo_decorrido(),
			   waitTime
		
		enquanto(verdadeiro)
		{
			desenhar()
			atualizarBola(0)

			
			ultimoTick = tickAtual
			tickAtual = u.tempo_decorrido()
			deltaTime = (tickAtual - ultimoTick) / 1000.0
			waitTime = rPi(1000/FPS + (1000/FPS - deltaTime*1000))
			se (waitTime >= 0) {u.aguarde(waitTime)}
			realFPS = 1.0/deltaTime
		}
	}
	
	funcao desenhar(){
		g.definir_cor(g.COR_PRETO)
		g.limpar()
		g.definir_cor(g.COR_BRANCO)

		g.desenhar_texto(0,0, ""+rPi(realFPS))

		// desenha bolas
		inteiro bolasDesenhadas = 0
		para (inteiro i=0; i<MAX_BOLAS;i++)
		{
			se (bolasDesenhadas >= qtdBolas) {pare}
			se (bolas[i][6] == 1)
			{
				bolasDesenhadas++
				desenhar_bola(i)
			}
		}
		
		g.renderizar()
	}

	funcao desenhar_bola(inteiro index)
	{
		inteiro r = tipos[bolas[index][4]][0],
			x = bolas[index][0] - r + RAIO_TELA[0],
			y = bolas[index][1] - r + RAIO_TELA[1]

		g.definir_cor(tipos[bolas[index][4]][1])
		g.desenhar_elipse(x, y, r*2, r*2, verdadeiro)
	}

	funcao atualizarBola(inteiro index)
	{
		bolas[index][3] += G // Aplicando gravidade
		inteiro r = tipos[bolas[index][4]][0] // Facilitador da vida
		
		inteiro posNova[2] = {bolas[index][0]+rPi(bolas[index][2]*deltaTime), 
						  bolas[index][1]+rPi(bolas[index][3]*deltaTime)}
		
		// Colisão com as paredes
		se (mod(posNova[0]) + r > RAIO_TELA[0]) 
		{
			bolas[index][2] = 0
			posNova[0] = (RAIO_TELA[1]-r)*(posNova[0]/mod(posNova[0]))
		}

		// Colisão com o chão
		se (    posNova[1]  + r > RAIO_TELA[1]) {bolas[index][3] = 0
										      posNova[1] = RAIO_TELA[1]-r}
		
		// Colisão com as outras bolas
		inteiro bolasChecadas = 0
		para (inteiro i=0; i<0;i++)
		{
			se (bolasChecadas >= qtdBolas-1) {pare}
			se (i != index e bolas[i][3] == 1)
			{
				bolasChecadas++
				se (dist_bolas2(index, i) < soma_r2(bolas[index][4], bolas[i][4])) 
				{
					efetuar_colisao(index, i)
				}
			}
		}

		bolas[index][0] = posNova[0]
		bolas[index][1] = posNova[1]
	}

	funcao efetuar_colisao(inteiro i1, inteiro i2)
	{
		
	}

	funcao add_bola(inteiro x, inteiro y, inteiro tipo)
	{
		para (inteiro i=0; i<MAX_BOLAS;i++)
		{
			se (bolas[i][6] != 1)
			{
				qtdBolas++
				
				bolas[i][0] = x
				bolas[i][1] = y
				bolas[i][2] = 0
				bolas[i][3] = 0
				bolas[i][4] = tipo
				bolas[i][5] = 0
				bolas[i][6] = 1

				retorne
			}
		}
	}
	
	funcao del_bola(inteiro index)
	{
		
	}

	funcao inteiro mod(inteiro n) {se (n<0){retorne -n} retorne n}
	funcao inteiro rPi(real n) {retorne t.real_para_inteiro(n)}
	funcao inteiro dist_bolas2(inteiro i1, inteiro i2) 
	{
		inteiro x = bolas[i1][0] - bolas[i2][0]  
		inteiro y = bolas[i1][1] - bolas[i2][1]  
		retorne (x*x) + (y*y)
	}
	funcao inteiro soma_r2(inteiro t1, inteiro t2) {retorne (tipos[t1][0]+tipos[t2][0])*(tipos[t1][0]+tipos[t2][0])}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 650; 
 * @DOBRAMENTO-CODIGO = [127, 160];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {bolas, 26, 9, 5}-{qtdBolas, 27, 2, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */