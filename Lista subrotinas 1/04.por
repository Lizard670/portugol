programa
{
	
	funcao inicio()
	{
		inteiro numero
		escreva("Insira um número: ")
		leia(numero)
		se (testar_primo(numero)) {escreva("É primo")}
		senao			  {escreva("Não é primo")}
	}

	funcao logico testar_primo(inteiro numero)
	{
		se (numero == 1) {retorne falso} // O número 1 é uma exceção nesse algoritmo
		para (inteiro i=2; i<numero; i++)
		{
			// O para só ira testar de 2 a numero-1, se ele achar algum I que é divisor de numero, significa que numero não é primo 
			se (numero % i == 0) {retorne falso}
		}
		retorne verdadeiro
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 548; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {i, 16, 16, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */