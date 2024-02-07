programa
{
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g

	const inteiro TAMANHO_PIXEL = 5, LARGURA = 160, ALTURA = 100, ALTURA_BARRA = 80
	cadeia path = ""
	//path = ""
	inteiro posMouse[2], canva[ALTURA][LARGURA], corAtual = g.COR_PRETO, raio=0, background = g.carregar_imagem(path+"paintBG.png"), cooldown=0
	caracter ferramentaAtual = 'Q'
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(LARGURA*TAMANHO_PIXEL, ALTURA*TAMANHO_PIXEL + ALTURA_BARRA)
		g.definir_tamanho_texto(20.0)

		para(inteiro x=0; x<LARGURA; x++) {para(inteiro y=0; y<ALTURA; y++) {canva[y][x] = g.COR_BRANCO}}
		desenhe()

		enquanto(verdadeiro)
		{
			logico houveAlteracao = falso
			se (m.botao_pressionado(m.BOTAO_ESQUERDO))
			{
				se (m.posicao_y() < ALTURA_BARRA) // Seleção de ferramenta
				{	
					se(cooldown < 0)
					{
						inteiro pos[2] = {m.posicao_x(), m.posicao_y()}
						se       (entre(pos[0], 10, 47+10) e entre(pos[1], 11, 61))            {raio++ houveAlteracao = verdadeiro}
						senao se (entre(pos[0], 63, 47+63) e entre(pos[1], 11, 61) e raio > 0) {raio-- houveAlteracao = verdadeiro}

						senao se (entre(pos[0], 213, 55+213) e entre(pos[1], 9, 64)) {ferramentaAtual = 'Q'}
						senao se (entre(pos[0], 293, 55+293) e entre(pos[1], 9, 64)) {ferramentaAtual = 'C'}

						cooldown = 250
					}
				}
				senao
				{
					posMouse[0] = (m.posicao_x()             ) / TAMANHO_PIXEL
					posMouse[1] = (m.posicao_y()-ALTURA_BARRA) / TAMANHO_PIXEL

					se (m.botao_pressionado(m.BOTAO_DIREITO)) {corAtual = g.COR_BRANCO}
					senao {corAtual = g.COR_PRETO}
					aplicarFerramenta(posMouse[0], posMouse[1], ferramentaAtual)
					houveAlteracao = verdadeiro
				}
			}

			se(houveAlteracao) {desenhe()}
			u.aguarde(1)
			se (cooldown >= 0) {cooldown--}
		}
	}

	funcao desenhe()
	{
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_imagem(0,0, background)
		g.definir_cor(g.COR_PRETO)

		g.desenhar_texto((55-g.largura_texto((raio*2+1)+""))/2+133,
					  (55-g.altura_texto ((raio*2+1)+""))/2+  9, 
					  (raio*2+1)+"")

		para(inteiro x=0; x<LARGURA; x++) {para(inteiro y=0; y<ALTURA; y++) 
		{
			g.definir_cor(canva[y][x])
			g.desenhar_retangulo(x*TAMANHO_PIXEL, 
							 y*TAMANHO_PIXEL + ALTURA_BARRA, 
							 TAMANHO_PIXEL, TAMANHO_PIXEL, 
							 falso, verdadeiro)
		}}

		g.renderizar()
	}

	funcao aplicarFerramenta(inteiro x, inteiro y, caracter ferramenta)
	{
		escolha(ferramenta)
		{
			caso 'Q':
			para(inteiro i=-raio; i<=raio; i++) {para(inteiro j=-raio; j<=raio; j++)
			{
				se(entreZero(x+j, LARGURA-1) e entreZero(y+i, ALTURA-1)) {canva[y+i][x+j] = corAtual}
			}}
			pare

			caso 'C':
			para(inteiro i=-raio; i<=raio; i++) {para(inteiro j=-raio; j<=raio; j++)
			{
				se ((modI(j) < raio*0.7 ou modI(i) < raio*0.7) ou entreZero(pitagoras(j, i), raio)) 
				{
					//escreva("\n", j, ", ", i)
					se(entreZero(x+j, LARGURA-1) e entreZero(y+i, ALTURA-1) e entreZero(pitagoras(j, i), raio)) {canva[y+i][x+j] = corAtual}
				}
			}}
			pare
			
		}
	}

	funcao logico entre(inteiro num, inteiro min, inteiro max) {retorne ((num >= min) e (num <= max))}
	funcao logico entreZero(inteiro num, inteiro max){retorne entre(num, 0, max)}
	funcao inteiro modI(inteiro num) {se(num<0) {retorne -num} retorne num}
	funcao inteiro pitagoras(inteiro a, inteiro b) {retorne t.real_para_inteiro(mat.raiz((1.0* a*a+b*b), 2.0))}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1627; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {raio, 12, 70, 4}-{cooldown, 12, 130, 8}-{ferramentaAtual, 13, 10, 15}-{pos, 33, 14, 3};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */