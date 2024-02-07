programa
{
	inclua biblioteca Arquivos --> a
	inclua biblioteca Graficos --> g

	const inteiro LARGURA=600, ALTURA=425, quantX=2, quantY=4

	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LARGURA*quantX, ALTURA*quantY)
		g.minimizar_janela()

		inteiro cartaoAtual=0, imagemAtual=0, borda = g.carregar_imagem("borda.png")
		enquanto(cartaoAtual<22)
		{
			imagemAtual++
			para(inteiro i=0; i<quantY; i++) {para(inteiro j=0; j<quantX; j++)
			{
				cartaoAtual++ 
				se (cartaoAtual > 22) {pare}
				cadeia id = cartaoAtual+".png"
				se (cartaoAtual<10) {id = 0+id}
				inteiro imagem = g.carregar_imagem("resultado/cartão"+id)
				g.desenhar_imagem(LARGURA*j, ALTURA*i, imagem)
				g.desenhar_imagem(LARGURA*j, ALTURA*i, borda)
				g.liberar_imagem(imagem)
			}}
			
			inteiro imagem = g.renderizar_imagem(LARGURA*quantX, ALTURA*quantY)
			delArq("img"+imagemAtual+".png")
			g.salvar_imagem(imagem, ("img"+imagemAtual+".png"))
			g.liberar_imagem(imagem)
		}
		g.liberar_imagem(borda)
	}

	funcao inteiro cnv(inteiro valor) {retorne valor*45}
	funcao delArq(cadeia caminho) {se (a.arquivo_existe(caminho)) {a.apagar_arquivo(caminho)}}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 159; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {cartaoAtual, 14, 10, 11}-{imagemAtual, 14, 25, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */