programa
{
	inclua biblioteca Util        --> u
	inclua biblioteca Tipos		--> tp
	inclua biblioteca Matematica	--> m
	inclua biblioteca Teclado	--> t
	inclua biblioteca Graficos	--> g

	const cadeia NOME_PROGRAMA = "Engine 3D", OS_PATH = ""
	const inteiro TAM_TELA[2] = {480, 320}


	// Matriz de projeção
	real fps=1.0,
		fLonge = 1000.0,
		fPerto =    0.1,
		fFov = 90.0,
		fProporcao = 1.0*TAM_TELA[1] / TAM_TELA[0],
		fFovRad = 1/m.tangente(grau_para_rad(fFov/2)),
		q = (fLonge / (fLonge - fPerto)),
		
		matrizProjecao[4][4] = {{fProporcao*fFovRad,	    0.0,       0.0, 0.0},
						    {			0.0,	fFovRad,       0.0, 0.0},
						    {			0.0,	    0.0,         q, 1.0},
						    {			0.0,	    0.0, -fLonge*q, 0.0}},

		fTheta = 0.0,
		matrizRotacaoZ[4][4],
		matrizRotacaoX[4][4]
	
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(falso)
		g.definir_dimensoes_janela(TAM_TELA[0]*2, 
							  TAM_TELA[1]*2)
		inteiro frame=0, ultimos10Frames=u.tempo_decorrido(), tempoAtual
		enquanto (nao falso)
		{
			desenhar()
			//u.aguarde(100)
			fTheta = 0.01*frame
			frame++

			matrizRotacaoZ[0][0] =  m.cosseno(fTheta)
			matrizRotacaoZ[0][1] =     m.seno(fTheta)
			matrizRotacaoZ[1][0] =    -m.seno(fTheta)
			matrizRotacaoZ[1][1] =  m.cosseno(fTheta)
			matrizRotacaoZ[2][2] =  1.0
			matrizRotacaoZ[3][3] =  1.0
			
			matrizRotacaoX[0][0] =  1.0
			matrizRotacaoX[1][1] =  m.cosseno(fTheta)
			matrizRotacaoX[1][2] =     m.seno(fTheta)
			matrizRotacaoX[2][1] =    -m.seno(fTheta)
			matrizRotacaoX[2][2] =  m.cosseno(fTheta)
			matrizRotacaoX[3][3] =  1.0

			se (frame % 10 == 0)
			{
				tempoAtual      = u.tempo_decorrido()
				fps = 10000.0 / (tempoAtual - ultimos10Frames)
				ultimos10Frames = tempoAtual
			}
		}
	}

	funcao desenhar()
	{
		g.definir_cor(g.COR_PRETO)
		g.limpar()
		g.definir_cor(g.COR_BRANCO)
		real triangulo[3][3] = {{0.0,0.0,1.0},
						    {0.0,1.0,1.0},
						    {1.0,0.0,1.0}}
		//desenharTriangulo(triangulo)
		real cubo1[3] = {0.0,0.0,0.0}
		real cubo2[3] = {1.0,1.0,1.0}
		real tamanho[] = {1.0,1.0,1.0}
		desenharCubo(cubo1, tamanho)
		//desenharCubo(cubo2, tamanho)
		g.renderizar()
		//escreva("renderizou")
	}

	funcao desenharTriangulo(real pontos[][])
	{
		inteiro trianguloProjetado[3][2]
		real origem[3], normal[3], tamanhoNormal, linhas[2][3]
		para (inteiro i=0; i<3; i++)
		{
			real pontoRotacionadoZ[3], pontoRotacionadoZX[3], pontoTransladado[3], pontoProjetado[3]

			mult_linha_matriz(pontos, i,         matrizRotacaoZ, pontoRotacionadoZ)
			mult_vetor_matriz(pontoRotacionadoZ,  matrizRotacaoX, pontoRotacionadoZX)

			pontoTransladado[0] = pontoRotacionadoZX[0] //- 0.5
			pontoTransladado[1] = pontoRotacionadoZX[1] //- 0.5
			pontoTransladado[2] = pontoRotacionadoZX[2] + 6

			se (i==0) {origem[0] = pontoTransladado[0]
					 origem[1] = pontoTransladado[1]
					 origem[2] = pontoTransladado[2]}
			senao {linhas[i-1][0] = pontoTransladado[0] - origem[0]
				  linhas[i-1][1] = pontoTransladado[0] - origem[1]
				  linhas[i-1][2] = pontoTransladado[0] - origem[2]}

			
			mult_vetor_matriz(pontoTransladado, matrizProjecao, pontoProjetado)
			
			trianguloProjetado[i][0] = converterParaPxX(pontoProjetado[0])
			trianguloProjetado[i][1] = converterParaPxY(pontoProjetado[1])
		}

				normal[0] = linhas[0][1]*linhas[1][2] - linhas[0][2]*linhas[1][1]
				normal[1] = linhas[0][2]*linhas[1][0] - linhas[0][0]*linhas[1][2]
				normal[2] = linhas[0][0]*linhas[1][1] - linhas[0][1]*linhas[1][0]
				
				tamanhoNormal = m.raiz((normal[0]*normal[0] + normal[1]*normal[1] + normal[2]*normal[2]), 2.0)
				normal[0] /= tamanhoNormal
				normal[1] /= tamanhoNormal
				normal[2] /= tamanhoNormal

				//se (normal[2] > 0) {retorne}
		
		g.desenhar_poligono(trianguloProjetado, falso)
	}

	funcao desenharCubo(real cord[], real tam[])
	{
		real vertices[8][3] = {{cord[0]       , cord[1]       , cord[2]},
						   {cord[0]+tam[0], cord[1]       , cord[2]},
						   {cord[0]+tam[0], cord[1]+tam[1], cord[2]}, 
						   {cord[0]       , cord[1]+tam[1], cord[2]},
						   {cord[0]       , cord[1]       , cord[2]+tam[2]},
						   {cord[0]+tam[0], cord[1]       , cord[2]+tam[2]},
						   {cord[0]+tam[0], cord[1]+tam[1], cord[2]+tam[2]}, 
						   {cord[0]       , cord[1]+tam[1], cord[2]+tam[2]}}
		inteiro triangulos[12][3] = {{0,1,3}, {1,2,3}, // rosto
							    {5,4,6}, {7,6,4}, // costas
							    {5,2,1}, {5,6,2}, // direita
							    {7,4,0}, {7,0,3}, // esquerda
							    {0,4,5}, {5,1,0}, // cima
							    {2,6,7}, {7,3,2}} // baixo

		real triangulo[3][3]
		para (inteiro i=0; i<12; i++)
		{
			formar_triangulo(vertices, triangulos, i, triangulo)
			desenharTriangulo(triangulo)
		}
		
	}
	
	funcao formar_triangulo(real &vertices[][], inteiro &indexes[][], inteiro triAtual, real &resultado[][])
	{
		para (inteiro i=0; i<3; i++) {
			para (inteiro j=0; j<3; j++) {
				resultado[i][j] = vertices[indexes[triAtual][i]][j]}}
	}

	funcao real grau_para_rad(real grau) {retorne grau*m.PI/180}
	funcao inteiro RparaI(real n) {retorne tp.real_para_inteiro(n)}
	funcao inteiro converterParaPxX(real cordenada) {retorne RparaI((cordenada+1)*TAM_TELA[0])}
	funcao inteiro converterParaPxY(real cordenada) {retorne RparaI((cordenada+1)*TAM_TELA[1])}
	funcao copiarMatriz(real &matriz[][], real &resultado[][])
	{
		inteiro TAM[2] = {u.numero_linhas(matriz), u.numero_colunas(matriz)}
		para (inteiro i=0; i<TAM[1]; i++) {para (inteiro j=0; j<TAM[0]; j++) {resultado[i][j] = matriz[i][j]}}
	}
	funcao mult_linha_matriz(real &mA[][], inteiro i, real &mB[][], real &resultado[])
	{
		resultado[0] = mA[i][0]*mB[0][0] + mA[i][1]*mB[1][0] + mA[i][2]*mB[2][0] + mB[3][0]
		resultado[1] = mA[i][0]*mB[0][1] + mA[i][1]*mB[1][1] + mA[i][2]*mB[2][1] + mB[3][1]
		resultado[2] = mA[i][0]*mB[0][2] + mA[i][1]*mB[1][2] + mA[i][2]*mB[2][2] + mB[3][2]
		real    w    = mA[i][0]*mB[0][3] + mA[i][1]*mB[1][3] + mA[i][2]*mB[2][3] + mB[3][3]
	
		se (w != 0) {resultado[0]/=w  resultado[1]/=w  resultado[2]/=w}
	}
	funcao mult_vetor_matriz(real &v[], real &m[][], real &resultado[])
	{
		resultado[0] = v[0]*m[0][0] + v[1]*m[1][0] + v[2]*m[2][0] + m[3][0]
		resultado[1] = v[0]*m[0][1] + v[1]*m[1][1] + v[2]*m[2][1] + m[3][1]
		resultado[2] = v[0]*m[0][2] + v[1]*m[1][2] + v[2]*m[2][2] + m[3][2]
		real    w    = v[0]*m[0][3] + v[1]*m[1][3] + v[2]*m[2][3] + m[3][3]
	
		se (w != 0) {resultado[0]/=w  resultado[1]/=w  resultado[2]/=w}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3371; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {fps, 14, 6, 3}-{fTheta, 27, 2, 6}-{triangulo, 73, 7, 9}-{trianguloProjetado, 88, 10, 18};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */