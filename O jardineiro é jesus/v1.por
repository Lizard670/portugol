programa {
  inclua biblioteca Matematica --> mat
  funcao inicio() {
    inteiro tamanhoTotal, alturaFolhas, alturaTronco
    escreva("Tamanho da arvore: ")
    leia(tamanhoTotal)
    escreva("\n\n")

    alturaTronco = mat.arredondar(tamanhoTotal / 3, 3)
    alturaFolhas = tamanhoTotal - alturaTronco
    
    

    //Folhas
    para (inteiro i = 0; i < alturaFolhas; i++){
      // Espaçamento
      para (inteiro j = 0; j < alturaFolhas - i; j++){
        escreva(" ")
      }
      // Hashtags
      para (inteiro j = 0; j < (i*2+1); j++){
        escreva("#")
      }
      // Quebra de linhas
      escreva("\n")
    }

    // Definição do tronco
    cadeia tronco = ""
    para (inteiro i = 0; i < alturaFolhas ; i++){
      tronco += " "
    }
    tronco += "|"

    // Escrevendo o tronco
    para (inteiro i = 0; i < alturaTronco; i++) {
      escreva(tronco, "\n")
    }
  }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 21; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */