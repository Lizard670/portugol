programa
{
	
	funcao inicio()
	{
		inteiro n, valorAtual, maiorNumero, menorNumero

		escreva("Digite uma quantidade maior que 0: ")
		leia(n)

		se (n > 0)
		{
			escreva("\n1° número: ")
			leia(valorAtual)
			maiorNumero = valorAtual
			menorNumero = valorAtual

			para (inteiro i=1; i<n; i++)
			{
				escreva(i+1, "° número: ")
				leia(valorAtual)

				se       (valorAtual > maiorNumero) {maiorNumero = valorAtual}
				senao se (valorAtual < menorNumero) {menorNumero = valorAtual}
			}

			escreva("\nMaior número: ", maiorNumero,
			        "\nMenor número: ", menorNumero)
		}
		senao {escreva("Quantidade invalida.")}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 338; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */