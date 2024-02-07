programa
{
	
	funcao inicio()
	{
		inteiro nota=0, cont=0, cont500=0, maiorNota=-2147483647
		real media=0.0

		enquanto (nota>=0 e nota<=1000)
		{
			media += nota
			se (maiorNota<nota) {maiorNota = nota}
			se (nota > 500) {cont500++}
			
			cont++
			escreva(cont, "° nota: ")
			leia(nota)
		}
		cont--
		media /= cont
		escreva("\nMedia das notas: ", media,
		        "\nQuantidade de alunos com nota maior que 500: ", cont500,
		        "\nMaior nota: ", maiorNota)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 307; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */