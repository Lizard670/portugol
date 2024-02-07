programa
{
	
	funcao inicio()
	{
		logico poltronasOcupadas[9999] // Aqui vamos guardar se cada uma das poltronas está vazia(falso), ou ocupada(verdadeiro)
		inteiro quantidadePoltronas, quantidadePassageiros, contVendasEfetuadas=0
		real percentual
	
		// Entrada	
		escreva("Quantidade de poltronas: ")
		leia(quantidadePoltronas)
		
		escreva("Quantidade de passageiros: ")
		leia(quantidadePassageiros)

		
		// Processamento das vendas
		para (inteiro i=0; i<quantidadePassageiros; i++)
		{
			inteiro poltronaDesejada
			escreva("\nQual poltrona você deseja comprar: ")
			leia(poltronaDesejada)

			// Se estiver ocupada, for um número negativo ou maior do que a quantidae de poltronas, não é possível vender
			// Como as começam em 0, elas só vão até quantidadePoltronas -1
			se (poltronaDesejada < 0 ou poltronaDesejada > (quantidadePoltronas-1) ou poltronasOcupadas[poltronaDesejada]) 
			{
				escreva("\nDesculpe essa poltrona não está disponível")
			}
			senao // Senão, faz a venda
			{
				escreva("\nVenda efetivada")
				contVendasEfetuadas++
				poltronasOcupadas[poltronaDesejada] = verdadeiro
			}
		}
		percentual = 100.0* contVendasEfetuadas / quantidadePoltronas


		// Saída
		para (inteiro i=0; i<quantidadePoltronas; i++)
		{
			se (poltronasOcupadas[i]) {escreva("\n", i, ":ocupado")}
			senao                     {escreva("\n", i, ":vago")}
		}
		escreva("\nPercentual de ocupação: ", percentual, "%")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 523; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */