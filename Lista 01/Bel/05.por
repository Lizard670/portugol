programa
{//*Novamente, refaça a questão anterior. Alem do valor de venda da pulseira voce dve ler tambem quantas smentes são utilizadas*//
	
	funcao inicio()
	{ 
		
	//entrada de dados
	inteiro sementes, quantidadesPulseira, umaPulseira
	real valorArrecadado, valorPulseira

     escreva ("Quantas sementes tem:")
     leia(sementes)
     escreva ("Qual o valor da pulseira:")
     leia(valorPulseira)
     escreva ("Quantas sementes tem em uma pulseira:")
     leia(umaPulseira)
     
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
 * @POSICAO-CURSOR = 141; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */