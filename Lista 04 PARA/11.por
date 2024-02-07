programa
{
	
	funcao inicio()
	{
		inteiro numeroInicial, quantidade, variacao
		
		escreva("Numero inicial: ")
		leia(numeroInicial)

		escreva("Quantidade de vezes: ")
		leia(quantidade)

		escreva("Variação: ")
		leia(variacao)

		para (inteiro i=0; i<quantidade; i++) 
		{
			escreva("\n", i+1, "º termo - ", (numeroInicial * i*variacao), " - de um total de ", quantidade, " termos.")
		}
		
		escreva("\n\nImpressão dos ", quantidade, " primeiros termos de uma PG cujo 1° termo é ", numeroInicial, " e a razão é ", variacao, ".\n")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 189; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */