programa
{
	inclua biblioteca Matematica --> m
	
	funcao inicio()
	{
		real x1, y1, x2, y2
		x1 = escrever_e_ler_real("Insira x1: ")
		y1 = escrever_e_ler_real("Insira y1: ")
		x2 = escrever_e_ler_real("Insira x2: ")
		y2 = escrever_e_ler_real("Insira y2: ")

		real d = distancia(x1, y1, x2, y2)
		
		escreva("\nA distância é: ", d)
	}

	
	funcao real distancia(real x1, real y1, real x2, real y2) 
	{
		retorne m.raiz(((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)), 2.0)
	}

	// a vontade de chamar isso de alfabetização foi forte
	// Essa função vai escrever o texto que você colocar e retornar um valor real que o usuário colocar
	funcao real escrever_e_ler_real(cadeia texto) 
	{
		escreva(texto) 
		real numero
		leia(numero)
		retorne numero
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 339; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */