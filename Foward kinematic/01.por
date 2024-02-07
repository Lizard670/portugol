programa
{
	inclua biblioteca Util       --> u
	inclua biblioteca Tipos      --> tp
	inclua biblioteca Matematica --> m
	inclua biblioteca Graficos   --> g
	inclua biblioteca Teclado    --> t

	const inteiro TAM_TELA[2] = {800, 600}, QTD_SEGMENTOS = 50

	/*
	 * 0 = AX
	 * 1 = AY
	 * 2 = BX
	 * 3 = BY
	 * 4 = Angulo
	 * 5 = Comprimento
	 * 6 = Angulo próprio
	 */
	real segmentos[QTD_SEGMENTOS][7]
	
	funcao inicio(){
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(TAM_TELA[0], TAM_TELA[1])

		iniciarSegmento(-m.PI/4, 10.0, 0)
		para (inteiro i=1; i<QTD_SEGMENTOS; i++) {iniciarSegmento(m.PI*i/QTD_SEGMENTOS/8, 10.0, i)}

		desenhar()

		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			segmentos[0][6] += 0.01
			//segmentos[u.sorteia(0,QTD_SEGMENTOS-1)][6] += (u.sorteia(-1,1) / 10000)
			atualizarSegmentos(0)
			desenhar()
			u.aguarde(25)
		}
	}
	
	funcao desenhar(){
		g.definir_cor(g.COR_PRETO)
		g.limpar()
		
		g.definir_cor(g.COR_BRANCO)
		para (inteiro i=0; i<QTD_SEGMENTOS; i++)
		{
			inteiro A[2] = {tp.real_para_inteiro(segmentos[i][0]), tp.real_para_inteiro(segmentos[i][1])},
				   B[2] = {tp.real_para_inteiro(segmentos[i][2]), tp.real_para_inteiro(segmentos[i][3])}

			desenhar_linha(A, B)
			inteiro angulo = tp.real_para_inteiro(segmentos[i][6]*180/m.PI)
			g.desenhar_texto(0, i*10, "["+A[0]+"] ["+A[1]+"] ["+angulo+"]")
		}
		
		
		g.renderizar()
	}
	funcao desenhar_linha(inteiro pontoA[], inteiro pontoB[]) {g.desenhar_linha(correcaoX(pontoA[0]), correcaoY(pontoA[1]), 
																 correcaoX(pontoB[0]), correcaoY(pontoB[1]))}

	funcao iniciarSegmento(real angulo, real comprimento, inteiro index)
	{
		segmentos[index][6] = angulo 
		segmentos[index][5] = comprimento

		atualizarSegmento(index)
	}
	
	funcao atualizarSegmento(inteiro index)
	{
		segmentos[index][4] = segmentos[index][6]
		
		// Herda coisas do segmento anterior
		se (index>0) 
		{
			// Ponto inicial no final do anterior
			segmentos[index][0] = segmentos[index-1][2]
			segmentos[index][1] = segmentos[index-1][3]
			
			segmentos[index][4] += segmentos[index-1][4]
		}

		segmentos[index][2] = segmentos[index][0] + (segmentos[index][5] * m.cosseno(segmentos[index][4]))
		segmentos[index][3] = segmentos[index][1] + (segmentos[index][5] *    m.seno(segmentos[index][4]))
	}
	
	// Atualiza todos os segmentos do inicial pra frente
	funcao atualizarSegmentos(inteiro inicial) {para (inteiro i=inicial; i<QTD_SEGMENTOS; i++) {atualizarSegmento(i)}}
	funcao inteiro correcaoX(inteiro X) {retorne X + (TAM_TELA[0]/2)}
	funcao inteiro correcaoY(inteiro Y) {retorne Y + (TAM_TELA[1]/2)}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 244; 
 * @DOBRAMENTO-CODIGO = [68];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {segmentos, 20, 6, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */