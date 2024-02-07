programa
{
	
	funcao inicio()
	{
		inteiro alturaTotal, alturaTronco, alturaFolhas, larguraTronco
		escreva("Qual o tamanho da arvore que você quer? ")
		leia(alturaTotal)

		alturaTronco  = (alturaTotal  / 3)
		alturaFolhas  =  alturaTotal  - alturaTronco
		larguraTronco = (alturaFolhas / 3) + 1 // largura tbm é (2/9)+1 da altura total

		// Folhas
		cadeia folhas = ""
		para (inteiro i = 0; i < alturaFolhas; i++) {folhas += m(" ", alturaFolhas - i) + m("#", i*2+1) + "\n"}
		escreva(folhas)

		// Tronco
		cadeia tronco
		se (larguraTronco < 3) {tronco = m(" ", alturaFolhas) + "|\n"}
		senao                  {tronco = m(" ", alturaFolhas - larguraTronco/2) + "|" + m(" ", larguraTronco - 2) + "|\n"}
		escreva(m(tronco, alturaTronco))
	}

	funcao cadeia m(cadeia texto, inteiro quantidade) 
	{
		cadeia textoFinal = ""
		para(inteiro i = 0; i < quantidade; i++) {textoFinal += texto}
		retorne textoFinal
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 356; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */