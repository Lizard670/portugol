programa
{
	// Retorna numero bonito em troca de uma mensagem de aviso 👍
	funcao real nb(real numeroFeio) {inteiro numeroInteiro = (numeroFeio*100+4/9) retorne (numeroInteiro/100.0)}
	
	funcao inicio()
	{
		inteiro quantidadeCompras, quantidadeParcelas, compras10k=0
		real valorCompra, valorMedio=0.0, totalFatura=0.0

		escreva("Total de compras: ")
		leia(quantidadeCompras)

		para (inteiro i=0; i<quantidadeCompras; i++)
		{
			escreva("\nValor da ", i+1,"° compra: ")
			leia(valorCompra)
			escreva("Quantidade de parcelas: ")
			leia(quantidadeParcelas)

			valorMedio += valorCompra
			se (valorCompra > 10000) {compras10k++}
			totalFatura += (valorCompra / quantidadeParcelas)
		}
		valorMedio /= quantidadeCompras

		escreva("\n\n", "Valor médio das compras: R$", nb(valorMedio),
		        "\n",   "Quantidade de compras acima de R$10 mil: ", compras10k,
		        "\n",   "Fatura total: R$", nb(totalFatura),
		        "\n\n", "Caso queira parcelar a fatura em 12 parcelas de R$", nb(totalFatura*1.5/12), ", procure o gerente.",
		        "\n\n", "AVISO: Se a fatura for paga após o vencimento será cobrado R$", nb(totalFatura*0.15), " de juros no valor.",
		        "\n",   "Total com juros: R$", nb(totalFatura*1.15))
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 325; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */