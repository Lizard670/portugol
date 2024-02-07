programa
{
	inclua biblioteca Graficos --> g
	
	funcao inicio()
	{
		inteiro imagem = g.carregar_imagem("/Mapas/01.png")
		cadeia texto = ""
		para (inteiro i=0; i<6; i++)
		{
			texto += ("\n"+i+": "+(16777216+g.obter_cor_pixel(imagem, i, i)))
		}
		escreva(texto)
		g.liberar_imagem(imagem)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 298; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */