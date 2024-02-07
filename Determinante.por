programa
{
	
	funcao inicio()
	{
		inteiro m[3][3], tamanho, determinante = 0, diagonalPrincipal, diagonalSecundaria

		escreva("Ordem da matriz: ")
		leia(tamanho)

		para (inteiro i=0; i<tamanho; i++)
		{
			para (inteiro j=0; j<tamanho; j++)
			{
				escreva("a", i+1, ",", j+1, "=")
				leia(m[i][j])
			}
		}

		para (inteiro j=0; j<tamanho; j++)
		{
			diagonalPrincipal  = 1
			diagonalSecundaria = 1
			
			para (inteiro i=0; i<tamanho; i++)
			{
				inteiro k = i+j,
				        l = i-j
				se (k>=tamanho) {k-=tamanho}
				se (l< 0      ) {l+=tamanho}
				
				diagonalPrincipal  *= m[i][k]
				diagonalSecundaria *= m[i][l]
			}

			determinante += diagonalPrincipal - diagonalSecundaria
		}

		escreva("\n\ndet(A) = ", determinante)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 475; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {m, 6, 10, 1}-{j, 20, 16, 1}-{i, 11, 16, 1}-{k, 27, 12, 1}-{l, 28, 12, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */