programa
{ //*3. Com 30 sementes de Maui fazemos 1 pulseira, uma pulseira é vendida por R$12.50.*//
//*Faça um programa que leia quantas sementes de Maui se tem e mostre quantas pulsueiras podem ser feitas e qual valor*//

	
	funcao inicio()
	{ //entrada de dados 
	inteiro sementes, quantidadesPulseira, umaPulseira 
	real valorArrecadado, valorPulseira
	valorPulseira = 12.50
	umaPulseira = 30

	escreva ("Quantidades de sementes:")
	leia(sementes)

	//processamento de dados 
	quantidadesPulseira = sementes / umaPulseira 
	valorArrecadado = quantidadesPulseira * valorPulseira 

	//saida de dados 
	escreva ("Quantidades de pulseira:", quantidadesPulseira, "\n")
	escreva ("É arrecadado:", valorPulseira, "\n")
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 322; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */