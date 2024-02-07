programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		// Inicialização
		inteiro matriz[99][99],  altura, largura

		escreva("Qtas linhas?  ")
		leia(altura)
		escreva("Qtas colunas? ")
		leia(largura)

		para (inteiro i=0; i<altura; i++)
		{
			para (inteiro j=0; j<largura; j++)
			{
				matriz[i][j] = u.sorteia(0, 5000)
			}
		}

		
		// Saída
		para (inteiro i=0; i<altura; i++)
		{
			para (inteiro j=0; j<largura; j++)
			{
				escreva(matriz[i][j] + " ")
			}
			escreva("\n")
		}

		escreva("\nDiagonal principal\n")
		se (altura == largura e altura%2 == 0)
		{
			para (inteiro i=0; i<altura; i++)
			{
				para (inteiro j=0; j<largura; j++)
				{
					se (i == j) {escreva(matriz[i][j] + " ")}
					senao {escreva("     ")}
				}
				escreva("\n")
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 514; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */