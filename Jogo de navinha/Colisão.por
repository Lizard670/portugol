programa
{
	inclua biblioteca Graficos --> g

	inteiro quantidadePontos=0, imagem = g.carregar_imagem("/nave/colisão.png"),  largura = g.largura_imagem(imagem), altura = g.altura_imagem(imagem)
	cadeia texto=""
	
	funcao inicio()
	{

		para (inteiro y=0; y<altura; y++) {para (inteiro x=0; x<largura; x++) {se (g.obter_cor_pixel(imagem, x, y) != 0) 
		{
			se (quantidadePontos > 0) {texto+= ", "}
			texto += "{"+x+","+y+"}"
			quantidadePontos++
		}}}

		escreva("pontos[", quantidadePontos, "] = {", texto, "}")
		g.liberar_imagem(imagem)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 447; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */