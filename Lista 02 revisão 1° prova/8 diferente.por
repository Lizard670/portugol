programa
{
	inclua biblioteca Matematica --> m
	// Retorna numero bonito 👍
	funcao real nb(real numeroFeio) {retorne m.arredondar(numeroFeio*100, 2) / 100}
	
	funcao inicio()
	{
		// Declaração de variáveis
		caracter cartaoMercado
		real valorCompra, valorFinal, economia
		inteiro quantiaParcelas

		// Entrada de dados
		escreva("Valor da compra: ")
		leia(valorCompra)

		escreva("Em quantas vezes quer parcelar? ")
		leia(quantiaParcelas)

		escreva("Você possui cartão do mercado? (s/n) ")
		leia(cartaoMercado)

		// Processameto de dados
		valorFinal = valorCompra // Se certifica que as variaveis foram inicializadas
		se (cartaoMercado == 's')
		{
			se (quantiaParcelas > 1 e quantiaParcelas <= 3) {valorFinal = valorCompra * 0.972}
			senao se                 (quantiaParcelas == 1) {valorFinal = valorCompra * 0.955}
		}
		senao se                      (quantiaParcelas >= 3) {valorFinal = valorCompra * 1.050}
		
		economia = nb(valorCompra - valorFinal)
		se       (economia > 0) {escreva("\nHouve uma economia de R$", economia,  ", ")}
		senao se (economia < 0) {escreva("\nHouve um acrescimo de R$", -economia, ", ")}


		// Saída de dados
		escreva("Sua compra vai ficar por R$", nb(valorFinal), "\n")
		se (quantiaParcelas > 1) {escreva("E vai ser dividida em parcelas de R$", nb(valorFinal/quantiaParcelas), "\n")}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 378; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */