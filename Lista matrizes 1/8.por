programa
{
	inclua biblioteca Texto --> t
	inclua biblioteca Util  --> u
	
	funcao inicio()
	{
		// Inicialização
		const inteiro QUANT_NOTAS = 3
		real notas[99][QUANT_NOTAS],  media[99]
		inteiro quantAlunos
		cadeia nomes[99]

		// Entrada de dados
		escreva("Quantidade de alunos: ")
		leia(quantAlunos)
		
		para (inteiro i=0; i<quantAlunos; i++)
		{
			escreva("\nNome: ")
			leia(nomes[i])
			para (inteiro j=0; j<QUANT_NOTAS; j++)
			{
				escreva("Nota ", (i+1), ": ")
				leia(notas[i][j])
			}
		}

		// Processamento da média
		para (inteiro i=0; i<quantAlunos; i++)
		{
			media[i] = 0.0
			para (inteiro j=0; j<QUANT_NOTAS; j++)
			{
				media[i] += notas[i][j] 
			}
			media[i] /= QUANT_NOTAS
		}

		
		// Saída
		  // Legenda
		escreva("\nNome         	Nota1	Nota2	Nota3	Media	")
		para (inteiro i=0; i<quantAlunos; i++)
		{
			escreva("\n", nomes[i], t.preencher_a_esquerda(' ', 14 - t.numero_caracteres(nomes[i]), "	"))
			para (inteiro j=0; j<QUANT_NOTAS; j++)
			{
				escreva(notas[i][j], "	")
			}
			escreva(media[i])
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 537; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */