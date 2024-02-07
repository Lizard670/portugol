programa
{
	
	funcao inicio()
	{
		inteiro tempoParaEncher, quantidadeAdultos, quantidadeCriancas, litrosNecessarios

		escreva("Quantos segundos demora para encher o balde? ")
		leia(tempoParaEncher)

		escreva("Quantos adultos tem nas duas residências? ")
		leia(quantidadeAdultos)

		escreva("Quantas crianças tem nas duas residências? ")
		leia(quantidadeCriancas)

		litrosNecessarios = (quantidadeAdultos*200 + quantidadeCriancas*160 + 2000)

		se (litrosNecessarios > (18/tempoParaEncher * 24*60*60)) {escreva("\nAtende a demanda")}
		senao                                                    {escreva("\nNão atende a demanda")}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 248; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */