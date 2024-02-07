programa
{
	
	funcao inicio()
	{
		const inteiro TAM = 5
		inteiro v1[TAM], v2[TAM], vSoma[TAM], somaTotal=0, contPares=0
		real media

	
		// Entrada	
		escreva("\nValores do v1:\n")
		leia(v1[0], v1[1], v1[2], v1[3], v1[4])
		escreva("\nValores do v2:\n")
		leia(v2[0], v2[1], v2[2], v2[3], v2[4])

		
		// Processamento
		para (inteiro i=0; i<TAM; i++)
		{
			vSoma[i] = v1[i] + v2[i]

			somaTotal += vSoma[i]
			
			se (vSoma[i] % 2 == 0) 
			{
				contPares++
			}
		}
		media = 1.0* somaTotal / TAM


		// Saída
		escreva("\nvSoma:")
		para (inteiro i=0; i<TAM; i++)
		{
			escreva(" ", vSoma[i])
		}
		escreva("\nMédia: ", media,
			   "\nQuantidade pares:", contPares)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 507; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */