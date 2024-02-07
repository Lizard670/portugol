programa
{
	
	funcao inicio()
	{//entrada de dados
		real valorDolar, valorEuro, cpDolar, cpEuro, reaisD, reaisE, reaisT
		valorDolar = 5.2
		valorEuro = 5.85

		escreva ("Quantos dolares comprados:")
		leia(cpDolar)
		escreva ("Quantos euros comprados:")
		leia(cpEuro)

	//processamento de dados
	     reaisD = cpDolar * valorDolar
	     reaisE = cpEuro * valorEuro
	     reaisT = reaisD + reaisE

	//saida de dados
	     escreva ("Quantos reais são necessarios para comprar os doláres?:", reaisD, "\n")
	     escreva ("Quantos reais são necessarios para comprar os euros?:", reaisE, "\n")
	     escreva ("Quantos reais são necessarios para comprar os dois?:", reaisT, "\n")
		
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 665; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */