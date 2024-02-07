programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> t
	
	funcao inicio()
	{
		
		cadeia menuLinhas[] = {"1| Comprar item", "2| Vender item", "0| Sair"}, menu = criar_caixa(menuLinhas, 0, falso)

		escreva(menu)
	}

	funcao cadeia criar_caixa(cadeia linhas[], inteiro largura, logico separar)
	{
		inteiro quantidadeLinhas = u.numero_elementos(linhas)
		// Pega a largura da maior linha
		para(inteiro i=0; i<quantidadeLinhas; i++) {substituir_maior(largura, t.numero_caracteres(linhas[i]))}

		cadeia separador="\n\"\\n+" para(inteiro i=0;i<largura;i++){separador+="-"} separador+="+\""
		cadeia texto = separador

		para(inteiro i=0; i<quantidadeLinhas;i++) 
		{
			texto += "\n\"\\n|" + preencher_a_direita(' ', largura, linhas[i]) + "|\""
			se(separar){texto+=separador}
		}
		se(nao(separar)){texto+=separador}

		retorne texto
	}
	funcao substituir_maior(inteiro &n1, inteiro n2) {se (n1 < n2) {n1 = n2}}
	funcao cadeia preencher_a_direita(caracter car, inteiro tamanho, cadeia cad) {cadeia preenchimento = "" para(inteiro i=t.numero_caracteres(cad);i<tamanho;i++){preenchimento+=car} retorne cad+preenchimento}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 700; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */