import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

class Lobo extends Personagem {

  static final int MOVER_BAIXO = 0;
  static final int MOVER_CIMA = 1;
  static final int MOVER_DIREITA = 2;
  static final int MOVER_ESQUERDA = 3;
  static final int POSICAO_X = 0;
  static final int POSICAO_Y = 1;
  static final int QUANTIDADE_MOVIMENTOS = 1;
  static final String SIMBOLO_LOBO = "L";

  Lobo(Ponto2D posicao, String simbolo) : super(posicao, simbolo);

  @override
  void atualizar(Mundo mundo) {
    var direcao = seguir(mundo);

    if (direcao == MOVER_BAIXO) {
      mover(mundo, 0, 1);
    } else if (direcao == MOVER_CIMA) {
      mover(mundo, 0, -1);
    } else if (direcao == MOVER_DIREITA) {
      mover(mundo, 1, 0);
    } else if (direcao == MOVER_ESQUERDA) mover(mundo, -1, 0);
  }

  int seguir(Mundo mundo) {
    if (verificarMaiorDistanciaEntreEixos(mundo.jogador.posicao, posicao) == POSICAO_X) {
      return mundo.jogador.posicao.x < posicao.x ? MOVER_ESQUERDA : MOVER_DIREITA;
    } 
    return mundo.jogador.posicao.y < posicao.y ? MOVER_CIMA : MOVER_BAIXO;
  }

  int verificarMaiorDistanciaEntreEixos(Ponto2D posicaoJogador, Ponto2D posicaoCarneiro) {
    int distanciaEixoX = converterNumeroNegativo(converterNumeroNegativo(posicaoJogador.x) - converterNumeroNegativo(posicaoCarneiro.x));
    int distanciaEixoY = converterNumeroNegativo(converterNumeroNegativo(posicaoJogador.y) - converterNumeroNegativo(posicaoCarneiro.y));
    return distanciaEixoX > distanciaEixoY ? POSICAO_X : POSICAO_Y;
  }

  int converterNumeroNegativo(int valor) {
    if (valorNegativo(valor)) {
      return valor * (-1);
    } 
    return valor;
  }

  bool valorNegativo(int valor) {
    return valor < 0;
  }

}