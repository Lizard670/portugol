programa
{
	
	funcao inicio()
	{
		inteiro n1, n2
		escreva("Insira dois números: \n")
		leia(n1, n2)
		inteiro menor = menorNum(n1, n2)
		escreva("O menor número é: ", menor)
	}

	funcao inteiro menorNum(inteiro n1, inteiro n2) 
	{
		se(n1<n2) {retorne n1} 
		senao     {retorne n2} // se n1==n2 ele vai entrar no senao, como ambos são iguais tanto faz qual você retorna, vai ser o menor valor
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 32; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */