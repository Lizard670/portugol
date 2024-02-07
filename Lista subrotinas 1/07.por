programa
{
	const inteiro TAM=5 
		// Com a definição de uma variável do lado de fora, é possível usar ela em qualquer função
		// seja inicio, ou uma criada, como nesse caso a função somaVetor
	
	funcao inicio()
	{
		inteiro numeros[TAM], soma
		escreva("Insira 5 números: \n")
		leia(numeros[0], numeros[1], numeros[2], numeros[3], numeros[4])
		soma = soma_vetor(numeros)
		escreva("\nA soma é: ", soma)
	}

	funcao inteiro soma_vetor(inteiro vetor[]) 
	{
		inteiro soma=0
		para (inteiro i=0; i<TAM; i++)
		{
			soma += vetor[i]
		}
		retorne soma
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 215; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */