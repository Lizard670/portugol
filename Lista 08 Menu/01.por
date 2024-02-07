programa
{
	inclua biblioteca Util --> u
	
	inteiro codigos[128], quantCompras=0
	real limite=-999999.9, fatura=0.0, maiorValor=-999999.9, valores[128]
	cadeia estabelecimentos[128]
		
	funcao inicio() 
	{
		menu()
	}

	funcao menu()
	{
		escreva("\n+--------------------------------------------------+"+
			   "\n|1| Registrar compra cartão"+
			   "\n|2| Mostrar fatura cartão"+
			   "\n|3| Mostrar compras por intervalo de valor"+
			   "\n|4| Alterar limite do cartão"+
			   "\n|5| Mostrar estabelecimentos maior valor da compra"+
			   "\n|6| Mostrar compras a partir do código"+
			   "\n|0| Sair"+
			   "\n+--------------------------------------------------+"+
			   "\n\nOpção: ")
		inteiro opcao 
		leia(opcao)
		limpa()

		escolha (opcao)	
		{
			caso 1: // Registrar compra cartão
		 		// -Soh eh possivel registrar uma compra se o limite tiver sido alterado pelo usuario
				se (limite == -999999.9) {escreva("\nColoque um limite no cartão primeiro.") pare}
				registrar_compra()
		 		pare
		 	caso 2: // Mostrar fatura cartão
				se (limite == -999999.9) {escreva("\nColoque um limite no cartão primeiro.") pare}
		 		mostrar_fatura()
		 		pare
		 	caso 3: // Mostrar compras por intervalo de valor
		 		mostrar_intervalo()
		 		pare
		 	caso 4: // Alterar limite do cartão
		 		real novoLimite
		 		escreva("\nInsira o novo limite: ")
		 		leia(novoLimite)

		 		se(novoLimite < fatura) {escreva("O novo limite não pode ser menor do que a fatura atual")}
		 		senao se(novoLimite > 2*limite e limite!=-999999.9) {escreva("O novo limite não pode exceder em 100% o limite atual")}
		 		senao {limite = novoLimite}
		 		pare
		 	caso 5: // Mostrar estabelecimentos maior valor da compra
		 		escreva("\n+---------------------------------"+
		 		        "\n|Valor da maior compra: R$"+ maiorValor+
		 		        "\n+---------------------------------"+
		 		        "\n|Estabelecimento(s) que ocorreu:")
		 		para(inteiro i=0;i<quantCompras;i++) {se(valores[i]==maiorValor) {escreva("\n|", estabelecimentos[i], "|código: ", codigos[i])}}
		 		escreva("\n+---------------------------------")
		 		pare
		 	caso 6: // Mostrar compras a partir do código
		 		mostrar_codigo()
		 		pare
		 	caso 0: // Sair
		 		retorne
		}
		menu()
	}

	// Registra a compra no sistema
	funcao registrar_compra()
	{
		
		inteiro codigo
		escreva("\nInsira o código da compra: ")
		leia(codigo)
		// Checa se o código já foi usado por outro produto
		logico codigoUsado = falso
		para(inteiro i=0;i<quantCompras+1;i++) {se(codigo == codigos[i]) {codigoUsado = verdadeiro}}
		se(codigoUsado) {escreva("\nCódigo já em uso") retorne}
		
		real valor
		escreva("Insira o valor da compra: ")
		leia(valor)
		// Checa se o limite é suficiente
		se(valor+fatura > limite) {escreva("A compra não pode ser efetuada pois extrapola o limite") retorne}
		se(valor>maiorValor) {maiorValor = valor}
		fatura+=valor

		escreva("Insira o nome do estabelecimento: ")
		// Coloca os valores lidos na ultima posição dos vetores
		leia(estabelecimentos[quantCompras])
		codigos[quantCompras] = codigo
		valores[quantCompras] = valor
		quantCompras++
	}

	// Mostra a fatura junto com todas as compras
	funcao mostrar_fatura()
	{
		escreva("\n+---------------------------------"+
		        "\n|Limite atual:         R$"+ limite)
		para(inteiro i=0;i<quantCompras;i++) {mostrar_compra(i, falso)}
		escreva("\n+---------------------------------"+
		        "\n|A fatura do cartão é: R$"+ fatura+
		        "\n|Limite restante:      R$"+(limite-fatura))
	}
	
	// Mostra uma compra em específico utilizando o código dela
	funcao mostrar_codigo()
	{
		inteiro codigoDesejado
		escreva("Insira o código da compra que deseja ver: ")
		leia(codigoDesejado)
		
		para(inteiro i=0; i<quantCompras; i++)
		{
			se(codigos[i] == codigoDesejado)
			{
				mostrar_compra(i, verdadeiro)
		 		retorne
			}
		}
		 
		escreva("\nNão foi possível achar nenhuma compra com esse código no sistema.")
	}

	// Mostra todas as compras que estão no intervalo informado
	funcao mostrar_intervalo()
	{
		real minimo, maximo
		escreva("\nInsira o valor minimo: ")
		leia(minimo)
		escreva("Insira o valor máximo: ")
		leia(maximo)

		para(inteiro i=0; i<quantCompras;i++) {se(valores[i] >= minimo e valores[i] <= maximo) {mostrar_compra(i, falso)}}
		escreva("\n+---------------------------------")
	}

	// Mostra uma compra específica baseada no index
	funcao mostrar_compra(inteiro index, logico separar)
	{
		escreva("\n+---------------------------------"+
		        "\n|Código: "+ codigos[index]+
		        "\n|Estabelecimento:"+ estabelecimentos[index]+
		        "\n|Valor: "+ valores[index])
		        
		se(separar) {escreva("\n+---------------------------------")}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3863; 
 * @DOBRAMENTO-CODIGO = [70];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */