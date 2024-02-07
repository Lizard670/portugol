programa
{
	inclua biblioteca Matematica --> m
	// Retorna numero bonito 👍
	funcao real nb(real numeroFeio) {retorne m.arredondar(numeroFeio*100, 2) / 100}
	
	funcao inicio()
	{
		// Declaração de variáveis
		real valorCompra

		// Entrada de dados
		escreva("Valor da compra: ")
		leia(valorCompra)
		
		// Saída de dados
		escreva("\nCom o cartão do mercado seu cashback é de R$", nb(valorCompra * 0.045))
		escreva("\n       Com outro cartão seu cashback é de R$0")
		escreva("\nCom o cartão do mercado são 3 parcelas de R$", nb(valorCompra * 0.972 / 3))
		escreva("\n       Com outro cartão são 3 parcelas de R$", nb(valorCompra * 1.050 / 3), "\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 230; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */