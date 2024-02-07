programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		// Inicialização
		const inteiro ORDEM = 5
		inteiro matriz1[ORDEM][ORDEM],  matriz2[ORDEM][ORDEM],  matrizDiferenca[ORDEM][ORDEM]

		// Entrada de dados
		para (inteiro i=0; i<ORDEM; i++)
		{
			para (inteiro j=0; j<ORDEM; j++)
			{
				escreva("Digite o número da matriz1: ")
				leia(matriz1[i][j])
			}
		}

		para (inteiro i=0; i<ORDEM; i++)
		{
			para (inteiro j=0; j<ORDEM; j++)
			{
				escreva("Digite o número da matriz2: ")
				leia(matriz2[i][j])
			}
		}

		// Inicialização da matriz diferença
		para (inteiro i=0; i<ORDEM; i++)
		{
			para (inteiro j=0; j<ORDEM; j++)
			{
				matrizDiferenca[i][j] = matriz1[i][j] - matriz2[i][j]
			}
		}

		
		// Saída
		escreva("\nMATRIZ DIFERENÇA\n")
		escrevaMatriz(matrizDiferenca, ORDEM) 
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
 * @POSICAO-CURSOR = 107; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */