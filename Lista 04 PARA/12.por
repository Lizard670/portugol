programa
{
	
	funcao inicio()
	{
		inteiro numero
		cadeia texto = " "
		
		escreva("Informe um número inteiro: ")
		leia(numero)

		se (numero < 0) {texto = " -"   numero*=-1}

		para (inteiro i=numero; i>0; i--) {escreva(texto, i)}
		escreva(" 0\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 263; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */