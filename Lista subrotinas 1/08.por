programa
{
	funcao inicio()
	{
		const inteiro TAM=5
		inteiro numeros[TAM], somas[TAM]
		
		para (inteiro i=0; i<TAM; i++)
		{
			escreva("Insira o ", (i+1), "° número: ")
			leia(numeros[i])
			somas[i] = soma_divisores(numeros[i]) 
		}

		para (inteiro i=0; i<TAM; i++)
		{
			escreva("\n", numeros[i], ": ", somas[i])
		}
	}

	// Calcula a soma dos divisores do número informado (exceto ele mesmo)
	funcao inteiro soma_divisores(inteiro numero) 
	{
		inteiro soma=0
		para (inteiro i=1; i<numero; i++)
		{
			se (numero % i == 0)
			{
				soma += i
			}
		}
		retorne soma
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 370; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */