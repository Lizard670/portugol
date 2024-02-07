programa
{
	
	funcao inicio()
	{
		real circulo1, circulo2
		escreva("Insira o raio de dois círculos: \n")
		leia(circulo1, circulo2)
		maiorCirculo(circulo1, circulo2)
	}

	funcao maiorCirculo(real r1, real r2)
	{
		real a1 = area(r1),
			a2 = area(r2)
		se       (a1>a2) {escreva("O círculo 1 é maior")}
		senao se (a1<a2) {escreva("O círculo 2 é maior")}
		senao            {escreva("Ambos são do mesmo tamanho")}
	}
	funcao real area(real raio) {retorne 3.14*raio*raio}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 174; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */