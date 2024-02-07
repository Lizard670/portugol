programa
{
	
	funcao inicio()
	{
		inteiro numeroAtual, quantidade, quantia1=0, quantia2=0, quantiaResto=0
		
		escreva("Informe a quantidade de números a serem lidos: ")
		leia(quantidade)

		para (inteiro i=0; i<quantidade; i++) 
		{
			escreva("Informe o ", i+1, "° número: ")
			leia(numeroAtual)

			se       (numeroAtual == 1) {quantia1++    }
			senao se (numeroAtual == 2) {quantia2++    }
			senao                       {quantiaResto++}
		}

		escreva("\nQuantidade de vezes que o valor 1 foi informado: ", quantia1,
		        "\nQuantidade de vezes que o valor 2 foi informado: ", quantia2,
		        "\nQuantidade de vezes que um valor diferente de 1 e 2 foi informado: : ", quantiaResto)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 455; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */