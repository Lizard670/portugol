programa
{
	// Professora tinh comentado na sala de fazer com que o programa, não aceitasse números iguais, 
	// e continuasse repetindo até dois valores diferentes serem colocados
	funcao inicio()
	{
		inteiro n1, n2
		escreva("Insira dois números: \n")
		leia(n1, n2)
		
		enquanto (n1==n2)
		{
			escreva("\nOs números não podem ser iguais",
				   "\nInsira dois números: \n")
			leia(n1, n2)
		} 

		inteiro menor = menorNum(n1, n2)
		escreva("O menor número é: ", menor)
	}

	funcao inteiro menorNum(inteiro n1, inteiro n2) 
	{
		se(n1<n2) {retorne n1} 
		senao     {retorne n2}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 396; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */