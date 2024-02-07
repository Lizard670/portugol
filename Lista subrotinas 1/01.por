programa
{
	
	funcao inicio()
	{
		inteiro n1, n2
		escreva("Insira dois números: \n")
		leia(n1, n2)
		
		escreva("\n", n1, " + ", n2, " = ", soma(n1, n2),
			   "\n", n1, " - ", n2, " = ", sub (n1, n2),
			   "\n", n1, " * ", n2, " = ", mult(n1, n2),
			   "\n", n1, " / ", n2, " = ", div (n1, n2))
	}

	funcao inteiro soma(inteiro num1, inteiro num2) {retorne num1+num2}
	funcao inteiro sub (inteiro num1, inteiro num2) {retorne num1-num2}
	funcao inteiro mult(inteiro num1, inteiro num2) {retorne num1*num2}
	funcao inteiro div (inteiro num1, inteiro num2) {retorne num1/num2}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 363; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */