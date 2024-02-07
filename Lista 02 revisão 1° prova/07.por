programa
{
	inclua biblioteca Matematica --> m
	// Retorna numero bonito 👍
	funcao real nb(real numeroFeio) {retorne m.arredondar(numeroFeio*100, 2) / 100}
	
	funcao inicio()
	{
		real valorCompra, valorFinal
		inteiro quantiaParcelas

		escreva("Valor da compra: ")
		leia(valorCompra)

		escreva("Em quantas vezes quer parcelar? ")
		leia(quantiaParcelas)
		
		se (quantiaParcelas > 1 e quantiaParcelas <= 3) {valorFinal = valorCompra * 0.972}
		senao se                 (quantiaParcelas == 1) {valorFinal = valorCompra * 0.955}
		senao                                           {valorFinal = valorCompra}
		

		escreva("\nHouve uma economia de R$", nb(valorCompra - valorFinal), ", Sua compra vai ficar por R$", nb(valorFinal), "\n")
		se (quantiaParcelas > 1) {escreva("E vai ser dividida em parcelas de R$", nb(valorFinal/quantiaParcelas), "\n")}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 47; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */