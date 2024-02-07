programa
{
	
	funcao inicio()
	{
		// Inicialização
		const inteiro ALTURA=4, LARGURA=3
		inteiro matriz[ALTURA][LARGURA]

		para (inteiro i=0; i<ALTURA; i++)
		{
			para (inteiro j=0; j<LARGURA; j++)
			{
				matriz[i][j] = 10+j
			}
		}

		
		// Saída
		para (inteiro i=0; i<ALTURA; i++)
		{
			para (inteiro j=0; j<LARGURA; j++)
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
 * @POSICAO-CURSOR = 127; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */