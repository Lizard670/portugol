programa
{
	inclua biblioteca Arquivos --> a
	inclua biblioteca Graficos --> g

	const inteiro LARGURA=600, ALTURA=425, BORDA=10

	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(LARGURA, ALTURA)

		const inteiro tamanho = 19
		cadeia cartoes[tamanho][2] = {{"01", "1:1"}, //
		                              {"02", "1:2"}, 
		                              {"03", "1:3"}, 
		                              {"04", "1:2"}, //
		                              {"05", "1:4"}, 
		                              {"06", "1:5"}, 
		                              {"07", "1:3"}, //
		                              {"08", "2:1"}, 
		                              {"09", "2:4"}, 
		                              {"10", "2:5"}, 
		                              {"11", "2:1"}, //
		                              {"13", "2:2"}, 
		                              {"15", "3:3"}, 
		                              {"16", "2:3"}, 
		                              {"18", "3:1"}, 
		                              {"19", "3:2"}, //
		                              {"20", "3:1"}, 
		                              {"21", "3:2"}, 
		                              {"22", "3:2"}}
		                              
		cadeia cartoesDuplos[3][2] = {{"12", "2:2"}, //
		                              {"14", "2:3"}, //
		                              {"17", "3:1"}} //
		para (inteiro i=0; i<tamanho; i++)
		{
			se (i<3) {desenhar(cartoesDuplos[i][0], cartoesDuplos[i][1], verdadeiro)}
			desenhar(cartoes[i][0], cartoes[i][1], falso)
		}
	}

	funcao inteiro cnv(inteiro valor) {retorne valor*45}
	funcao delArq(cadeia caminho) {se (a.arquivo_existe(caminho)) {a.apagar_arquivo(caminho)}}
	funcao desenhar_texto(inteiro posicao, inteiro y, cadeia texto, inteiro altura, inteiro largura)
	{
		g.definir_tamanho_texto(30.0*altura)

		inteiro xCorrigido, yCorrigido = cnv(y) + ((cnv(altura) - g.altura_texto(texto))/2) + BORDA

		se       (posicao == 0) {xCorrigido = (LARGURA-(BORDA*2) - (g.largura_texto(texto)))/2+BORDA}
		senao se (posicao == 1) {xCorrigido = (LARGURA-(BORDA*2) - (g.largura_texto(texto)))  +BORDA}
		senao                   {xCorrigido = BORDA}

		inteiro xMoldura = xCorrigido - ((cnv(largura) - g.largura_texto(texto))/2)
		se(largura > 0) 
		{
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(xMoldura, cnv(y), cnv(largura), cnv(altura), verdadeiro, verdadeiro)
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_retangulo(xMoldura+5, cnv(y)+5, cnv(largura)-10, cnv(altura)-10, verdadeiro, verdadeiro)
		}
			
		g.definir_cor(g.COR_PRETO)
		g.desenhar_texto(xCorrigido, yCorrigido, texto)
	}
	
	funcao desenhar(cadeia nome, cadeia cord, logico duplo)
	{
		g.definir_cor(g.COR_BRANCO)
		g.definir_opacidade(0)
		g.limpar()
		g.definir_opacidade(255)

		g.definir_fonte_texto("Lucida Fax")
		desenhar_texto(0, 2, nome, 3, 6)
		desenhar_texto(1, 8, "("+cord+")  ", 1, 0)

		inteiro yQR = cnv(6)+BORDA, tamanhoQR = cnv(3)
		se (duplo)
		{
			inteiro qr[2] = {g.carregar_imagem("qrs/"+nome+"a.png"), g.carregar_imagem("qrs/"+nome+"b.png")}
			inteiro qrPequeno[2] = {g.redimensionar_imagem(qr[0], tamanhoQR, tamanhoQR, verdadeiro), g.redimensionar_imagem(qr[1], tamanhoQR, tamanhoQR, verdadeiro)}
			g.desenhar_imagem((LARGURA-(BORDA*2)-tamanhoQR)/2+BORDA-cnv(2), yQR, qrPequeno[0])
			g.desenhar_imagem((LARGURA-(BORDA*2)-tamanhoQR)/2+BORDA+cnv(2), yQR, qrPequeno[1])
			g.liberar_imagem(qr[0])
			g.liberar_imagem(qr[1])
			g.liberar_imagem(qrPequeno[0])
			g.liberar_imagem(qrPequeno[1])
		}
		senao
		{
			inteiro qr = g.carregar_imagem("qrs/"+nome+".png")
			inteiro qrPequeno = g.redimensionar_imagem(qr, tamanhoQR, tamanhoQR, verdadeiro)
			g.desenhar_imagem((LARGURA-(BORDA*2)-tamanhoQR)/2+BORDA, yQR, qrPequeno)
			g.liberar_imagem(qr)
			g.liberar_imagem(qrPequeno)
		}
		
		
		inteiro imagem = g.renderizar_imagem(LARGURA, ALTURA)
		delArq("resultado/cartão"+nome+".png")
		g.salvar_imagem(imagem, ("resultado/cartão"+nome+".png"))
		g.liberar_imagem(imagem)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2114; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {i, 37, 16, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */