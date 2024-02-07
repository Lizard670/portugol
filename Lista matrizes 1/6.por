programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		// Inicialização
		inteiro matriz1[99][99],  matriz2[99][99],  matrizSoma[99][99],  ordem

		escreva("Ordem?  ")
		leia(ordem)

		// Letra A
		para (inteiro i=0; i<ordem; i++)
		{
			para (inteiro j=0; j<ordem; j++)
			{
				matriz1[i][j] = u.sorteia( 0,  50)
			}
		}

		// Letra B
		para (inteiro i=0; i<ordem; i++)
		{
			para (inteiro j=0; j<ordem; j++)
			{
				matriz2[i][j] = u.sorteia(51, 100)
			}
		}

		// Letra C
		para (inteiro i=0; i<ordem; i++)
		{
			para (inteiro j=0; j<ordem; j++)
			{
				matrizSoma[i][j] = matriz1[i][j] + matriz2[i][j]
			}
		}

		
		// Saída
		
		// Letra D
		escreva("\nMATRIZ 1\n")
		escrevaMatriz(matriz1, ordem)  
		// Letra E  
		escreva("\nMATRIZ 2\n")
		escrevaMatriz(matriz2, ordem)
		// Letra F
		escreva("\nMATRIZ SOMA\n")
		escrevaMatriz(matrizSoma, ordem) 
	}

	funcao escrevaMatriz(inteiro matriz[][], inteiro ordem)
	{
		para (inteiro i=0; i<ordem; i++)
		{
			para (inteiro j=0; j<ordem; j++)
			{
				escreva(matriz[i][j] + " ")
			}
			escreva("\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 808; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */