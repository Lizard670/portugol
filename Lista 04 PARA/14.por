programa
{
	
	funcao inicio()
	{
		caracter letra
		cadeia   nome
		inteiro  quantidade

		escreva("Informe um nome: ")
		leia(nome)
		
		escreva("Informe uma quantidade inteira e positiva: ")
		leia(quantidade)
		se (quantidade < 0) {escreva("Quantidade invalida") retorne}

		escreva("Informe a letra (A/B): ")
		leia(letra)
		se       (letra == 'A') {quantidade *= 3}
		senao se (letra == 'B') {quantidade *= 2}
		senao                   {escreva("Letra invalida") retorne}


		para (inteiro i=0; i<quantidade; i++) {escreva(nome, "\n")}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 135; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */