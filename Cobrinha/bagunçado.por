programa
{
inclua biblioteca Teclado --> t
inclua biblioteca Tipos --> tp
inclua biblioteca Util --> u
inclua biblioteca Matematica --> mat
inclua biblioteca Graficos --> g

cadeia AAAAAAAAAAAAAAAA = ""

const inteiro AAAAAAAA = 20, AAAAAAA = 40, A = 25, AA = 80,
AAAAAA = -1,
AAAAA  =  1,
AAAA     = -2,
AAA    =  2

inteiro AAAAAAAAAA[5] = {g.carregar_imagem(AAAAAAAAAAAAAAAA+"-2.png"),
  g.carregar_imagem(AAAAAAAAAAAAAAAA+"-1.png"),
  0,
  g.carregar_imagem(AAAAAAAAAAAAAAAA+"1.png"),
  g.carregar_imagem(AAAAAAAAAAAAAAAA+"2.png")}

logico AAAAAAAAAAAAAAAAAAAAA[A][AAAAAAA], AAAAAAAAAAAAAAA = falso
inteiro AAAAAAAAAAAAAAAAAA[2], AAAAAAAAAAAAAAAAA[2], AAAAAAAAAAAAA = AAAA, AAAAAAAAAAA[A][AAAAAAA],
   AAAAAAAAA = g.carregar_imagem(AAAAAAAAAAAAAAAA+"bg.png"), AAAAAAAAAAAAAAAAAAAA = 3, AAAAAAAAAAAAAAAAAAAAAA = u.tempo_decorrido(),
   AAAAAAAAAAAA=0, AAAAAAAAAAAAAAAAAAAAAAA=0, AAAAAAAAAAAAAAAAAAA=AAAAAAAAAAAAAAAAAAAA, AAAAAAAAAAAAAA = 25
   
funcao inicio()
{
g.iniciar_modo_grafico(falso)
g.definir_dimensoes_janela(AAAAAAA*AAAAAAAA, A*AAAAAAAA + AA)
g.definir_tamanho_texto(40.0)

para(inteiro x=0; x<AAAAAAA; x++) {para(inteiro y=0; y<A; y++) {AAAAAAAAAAAAAAAAAAAAA[y][x] = falso}}
AAAAAAAAAAAAAAAAA[1] =  A/2 
AAAAAAAAAAAAAAAAA[0] = AAAAAAA/2
AAAAAAAAAAAAAAAAAA[0] = u.sorteia(0, AAAAAAA-1) 
AAAAAAAAAAAAAAAAAA[1] = u.sorteia(0,  A-1)

AAAAAAAAAAAAAAAAAAAAAAAA(AAAAAAA/2, A/2, AAA)
AAAAAAAAAAAAAAAAAAAAAAAAA()

AAAAAAAAAAAAAAAAAAAAAA = u.tempo_decorrido()
enquanto(nao AAAAAAAAAAAAAAA)
{
logico houveAlteracao = falso

se (t.alguma_tecla_pressionada() e AAAAAAAAAAAA <= 0)
{
se       (t.tecla_pressionada(t.TECLA_SETA_ACIMA)    e AAAAAAAAAAAAA != AAA)     {AAAAAAAAAAAAA = AAAA}
senao se (t.tecla_pressionada(t.TECLA_SETA_ESQUERDA) e AAAAAAAAAAAAA != AAAAA)   {AAAAAAAAAAAAA = AAAAAA}
senao se (t.tecla_pressionada(t.TECLA_SETA_DIREITA)  e AAAAAAAAAAAAA != AAAAAA)  {AAAAAAAAAAAAA = AAAAA}
senao se (t.tecla_pressionada(t.TECLA_SETA_ABAIXO)   e AAAAAAAAAAAAA != AAAA)      {AAAAAAAAAAAAA = AAA}

AAAAAAAAAAAA = AAAAAAAAAAAAAA
//houveAlteracao = verdadeiro
}

se(AAAAAAAAAAAAAAAAAAAAAAA%AAAAAAAAAAAAAA == 0) {moverCobra()   houveAlteracao = verdadeiro   AAAAAAAAAAAA = 1}

se(houveAlteracao) {AAAAAAAAAAAAAAAAAAAAAAAAA()}
AAAAAAAAAAAAAAAAAAAAAAA++
AAAAAAAAAAAA--
u.aguarde(10)
}

enquanto(nao falso) {}
}

funcao AAAAAAAAAAAAAAAAAAAAAAAAA()
{
g.limpar()
g.desenhar_imagem(0,0, AAAAAAAAA)
g.definir_cor(g.COR_PRETO)

// Pontuação
cadeia AAAAAAAAAAAAAAAAAAAAAAAAAA = (AAAAAAAAAAAAAAAAAAA-AAAAAAAAAAAAAAAAAAAA)+""
g.desenhar_texto((AAAAAAAA*AAAAAAA/2 - g.largura_texto(AAAAAAAAAAAAAAAAAAAAAAAAAA))/2,
  (AA            -  g.altura_texto(AAAAAAAAAAAAAAAAAAAAAAAAAA))/2, 
  AAAAAAAAAAAAAAAAAAAAAAAAAA)
// Tempo
inteiro AAAAAAAAAAAAAAAAAAAAAAAAAAA = (u.tempo_decorrido() - AAAAAAAAAAAAAAAAAAAAAA),
   minutos  = AAAAAAAAAAAAAAAAAAAAAAAAAAA / (60*1000),
   segundos = (AAAAAAAAAAAAAAAAAAAAAAAAAAA - minutos*60*1000) / 1000
AAAAAAAAAAAAAAAAAAAAAAAAAA = minutos+":"+segundos
g.desenhar_texto((AAAAAAAA*AAAAAAA/2 - g.largura_texto(AAAAAAAAAAAAAAAAAAAAAAAAAA))/2 + AAAAAAAA*AAAAAAA/2,
  (AA            -  g.altura_texto(AAAAAAAAAAAAAAAAAAAAAAAAAA))/2, 
  AAAAAAAAAAAAAAAAAAAAAAAAAA)


// Fruta
g.definir_cor(g.COR_VERMELHO)
g.desenhar_retangulo(AAAAAAAAAAAAAAAAAA[0]*AAAAAAAA, 
 AAAAAAAAAAAAAAAAAA[1]*AAAAAAAA + AA, 
 AAAAAAAA, AAAAAAAA, 
 falso, verdadeiro)

// Cobra
para(inteiro i=0, x=AAAAAAAAAAAAAAAAA[0], y=AAAAAAAAAAAAAAAAA[1]; i<AAAAAAAAAAAAAAAAAAA; i++) 
{
se (i<32) {g.definir_cor(g.criar_cor(i*8, i*8, i*8))}

g.desenhar_retangulo(x*AAAAAAAA, 
 y*AAAAAAAA + AA, 
 AAAAAAAA, AAAAAAAA, 
 falso, verdadeiro)
inteiro antigoX = x
x += direcaoX(AAAAAAAAAAA[y][x])
y += direcaoY(AAAAAAAAAAA[y][antigoX])
}

// Cabeça
g.desenhar_imagem(AAAAAAAAAAAAAAAAA[0]*AAAAAAAA, 
   AAAAAAAAAAAAAAAAA[1]*AAAAAAAA + AA,
   AAAAAAAAAA[AAAAAAAAAAAAA+2])

g.renderizar()
}

funcao inteiro direcaoX(inteiro direcao) {retorne direcao%2} // -1 = esquerda   1 = direita
funcao inteiro direcaoY(inteiro direcao) {retorne direcao/2} // -2 = cima       2 = baixo

funcao AAAAAAAAAAAAAAAAAAAAAAAA(inteiro AAAAAAAAAAAAAAAAAAAAAAAAB, inteiro AAAAAAAAAAAAAAAAAAAAAAAAAA, inteiro AAAAAAAAAAAAAAAAAAAAAAAAAAA) {AAAAAAAAAAAAAAAAAAAAA[AAAAAAAAAAAAAAAAAAAAAAAAAA][AAAAAAAAAAAAAAAAAAAAAAAAB]=verdadeiro   AAAAAAAAAAA[AAAAAAAAAAAAAAAAAAAAAAAAAA][AAAAAAAAAAAAAAAAAAAAAAAAB]=AAAAAAAAAAAAAAAAAAAAAAAAAAA}
funcao   moverCobra()
{
inteiro novaPos[2] = {AAAAAAAAAAAAAAAAA[0] + direcaoX(AAAAAAAAAAAAA), 
  AAAAAAAAAAAAAAAAA[1] + direcaoY(AAAAAAAAAAAAA)}

// Acaba o jogo se bater em um segmentou ou tentar sair do mapa
se (nao entreZero(novaPos[0], AAAAAAA-1) ou 
    nao entreZero(novaPos[1],  A-1) ou
        AAAAAAAAAAAAAAAAAAAAA[novaPos[1]][novaPos[0]])
{
AAAAAAAAAAAAAAA = verdadeiro
retorne
}

// Adiciona novo segmento
AAAAAAAAAAAAAAAAAAAAAAAA(novaPos[0], novaPos[1], AAAAAAAAAAAAA*-1) 

// Come fruta se tiver em cima de uma
se (AAAAAAAAAAAAAAAAAAAAA[AAAAAAAAAAAAAAAAAA[1]][AAAAAAAAAAAAAAAAAA[0]]) 
{
enquanto(AAAAAAAAAAAAAAAAAAAAA[AAAAAAAAAAAAAAAAAA[1]][novaPos[0]]) {AAAAAAAAAAAAAAAAAA[0] = u.sorteia(0, AAAAAAA-1) 
     AAAAAAAAAAAAAAAAAA[1] = u.sorteia(0,  A-1)}

se (AAAAAAAAAAAAAA>1) {AAAAAAAAAAAAAA--}
AAAAAAAAAAAAAAAAAAA++
}

// Apaga o segmento excedente
senao 
{
para(inteiro i=0, x=AAAAAAAAAAAAAAAAA[0], y=AAAAAAAAAAAAAAAAA[1]; i<=AAAAAAAAAAAAAAAAAAA; i++) 
{
se (i == AAAAAAAAAAAAAAAAAAA) {AAAAAAAAAAAAAAAAAAAAA[y][x] = falso}

inteiro antigoX = x
x += direcaoX(AAAAAAAAAAA[y][x])
y += direcaoY(AAAAAAAAAAA[y][antigoX])
}
}

// Seta a novaPos como posição atual
AAAAAAAAAAAAAAAAA[0] = novaPos[0]
AAAAAAAAAAAAAAAAA[1] = novaPos[1]
}

funcao logico entre(inteiro num, inteiro min, inteiro max) {retorne ((num >= min) e (num <= max))}
funcao logico entreZero(inteiro num, inteiro max){retorne entre(num, 0, max)}
funcao inteiro modI(inteiro num) {se(num<0) {retorne -num} retorne num}
funcao inteiro pitagoras(inteiro a, inteiro b) {retorne tp.real_para_inteiro(mat.raiz((1.0* a*a+b*b), 2.0))}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 202; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */