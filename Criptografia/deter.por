programa
{
	
	funcao inicio()
	{
		// matriz A 
		// [X  Y]
		// [Z  H]
		
		// Se det(A) = 1, é uma chave valida
		
		// inverso da matriz A
		// [H/det(A)   Y/det(A)]
		// [Z/det(A)   X/det(A)]
		
		const inteiro rangeMin = 0, rangeMax = 4
		
		inteiro cont=0
		caracter caracteres[31] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', ' ', '#', ',', ':', '.'}
		inteiro cripto[2][44] = {{-44, 15, -10, -77, -42, -54, -2, -51, -80, -33, 24, -49, 24, -80, -12, -62, 6, 10, -53, -54, -32, -80, -30, -44, -15, 4, -30, -89, -76, -24, 0, -17, -56, -18, -25, -60, -34, 24, -20, 3, -12, -31, 24, -68},
                                   {59, -11, 15, 104, 63, 73, 3, 69, 107, 49, -23, 67, -23, 107, 25, 83, -2, -9, 71, 81, 47, 107, 43, 65, 29, 0, 45, 120, 103, 38, 5, 29, 75, 33, 39, 87, 47, -23, 34, 1, 17, 43, -23, 96}}
                                 //{{ 21, -12, -13, 0,  8, -5, -14,  14,  8, -11, 14, -23, 1,  22, -14,  11,  4,   7, -4, -8,  0,  22,  1, -26, -12, -14,   9, -26,  8,  5, -18,  1,  2,  2, -8,  12,  10, -4, -14,  -6,  18,  15,   7, 3, -1, -16, 0, -6,   9,  9, -5, -11,  13,  18},
						   // {-62,  63,  55, 5, -5, 34,  57, -41, -5,  60, -41, 96, 1, -61,  61, -30,  3, -19, 30, 33, 18, -61, 10, 105,  52,  57,  -9, 105, -5, -6,  81, 10, -1, 13, 37, -35, -11, 43,  69,  25, -53, -33, -12, 3, 8, 69,  27, 25, -26, -15, 24, 45, -34, -45}}
		inteiro chavesValidas[5*5*5][4]
		chavesValidas[0][0]=1 chavesValidas[0][1]=0 chavesValidas[0][2]=0 chavesValidas[0][3]=1
		inteiro chave[4]
		
		para(inteiro x=rangeMin; x<=rangeMax; x++)
		{
			
			para(inteiro h=rangeMin; h<=rangeMax; h++)
			{
				
				para(inteiro z=rangeMin; z<=rangeMax; z++) 
				{
					
					para(inteiro y=rangeMin; y<=rangeMax; y++)
					{	
						chave[0] = x
						chave[3] = h
						chave[2] = z
						chave[1] = y
						se(det(chave) == 1){ // Matrizes de resolução válidas
							para (inteiro i=0; i<4; i++) {chavesValidas[cont][i] = chave[i]}
							cont++
						}
					}
				}
			}
		}

		para(inteiro i=0; i<cont; i++)
		{
			inteiro x=chavesValidas[i][0], h=chavesValidas[i][3], z=chavesValidas[i][2], y=chavesValidas[i][1]
			cadeia texto1="", texto2="", textoParte1="", textoParte2=""
			para(inteiro j=0;j<44;j++)
			{
				// Descriptografa usando o inverso da chave ()
				inteiro numero1 = ( x*cripto[0][j])+( y*cripto[1][j])
				inteiro numero2 = ( z*cripto[0][j])+( h*cripto[1][j]) 
				texto1 += (numero1) + " "
				texto2 += (numero2) + " "
	
				se (entre(numero1, 1, 32)) {textoParte1 += traduzirLetra(numero1, caracteres)} senao {pare}
				se (entre(numero2, 1, 32)) {textoParte1 += traduzirLetra(numero2, caracteres)} senao {pare}
			}
			escreva(i+1,":\n [",x," ", y, "]\n [",z, " ",h, "]\n", texto1, "\n", texto2, "\n", textoParte1, textoParte2, "\n\n")
		}
	}

	funcao caracter traduzirLetra(inteiro criptografado, caracter equivalencia[]) {retorne equivalencia[criptografado - 1]}

	funcao inteiro det(inteiro m[])                               {retorne (m[0]*m[3])-(m[1]*m[2])}

	funcao logico entre(inteiro numero, inteiro min, inteiro max) {retorne (numero >= min e numero <= max)}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2408; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */