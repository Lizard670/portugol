programa
{
	// Aqui a gente ta incluindo a biblioteca Util e dando o apelido de u para ela
	// Ou seja, podemos escrever "u." que vai ser a mesma coisa que "Util." 
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		const inteiro TAM = 6
		// Como o vIntercalado vai precisar caber os valores de v1 e v2, ele tem o tamanho dos dois juntos, ou seja, o dobro
		inteiro v1[TAM], v2[TAM], vIntercalado[TAM*2], maior=-99999, menor=99999, contImpares=0

	
		// Sorteio e intercalação	
		para (inteiro i=0; i<TAM; i++)
		{
			v1[i] = u.sorteia(0,20)
			v2[i] = u.sorteia(0,20)
			
			vIntercalado[i*2   ] = v1[i] // Os valores de v1 vão ficar nas posições pares
			vIntercalado[i*2 +1] = v2[i] // Os valores de v2 vão ficar nas posições impares
		}

		// Processamento
		para (inteiro i=0; i<TAM*2; i++)
		{
			se (vIntercalado[i] > maior) {maior = vIntercalado[i]}
			se (vIntercalado[i] < menor) {menor = vIntercalado[i]}
			// Checa se i(a posição) é par E se o valor nessa posição é impar
			se (i % 2 == 0 e vIntercalado[i] % 2 != 0) {contImpares++}
		}


		// Saída
		escreva("\nvIntercalado:")
		para (inteiro i=0; i<TAM*2; i++) {escreva(" ", vIntercalado[i])} // Lembre se que temos que usar o tamanho do vetor intercalado, e não dos normais
		escreva("\nTerceira posiçao: ", vIntercalado[2], // A primeira posição é 0, a segunda é 1 e a terceira é 2
			   "\nMaior número: ", maior,
			   "\nMenor número: ", menor,
			   "\nQuantidade de impares em posições pares: ", contImpares)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1245; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */