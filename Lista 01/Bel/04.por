programa
{//*Refaça a questão anterior considerando, que o valor de venda deve ser informado pelo usuario*//

	funcao inicio()
	{
 
	//entrada de dados
	inteiro sementes, quantidadesPulseira, umaPulseira
	real valorArrecadado, valorPulseira
	umaPulseira = 30

     escreva ("Quantas sementes tem:")
     leia(sementes)
     escreva ("Qual o valor da pulseira:")
     leia(valorPulseira)
     
	//processamento de dados 
	quantidadesPulseira =  sementes / umaPulseira
	valorArrecadado = quantidadesPulseira * valorPulseira

	//saida de dados
	escreva ("Quantidades de pulseira:", quantidadesPulseira, "\n")
	escreva ("Qual o valor arrecadado:", valorArrecadado, "\n")
	
	
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */