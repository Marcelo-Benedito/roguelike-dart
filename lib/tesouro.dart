import 'dart:math';
import 'package:roguelike/mundo.dart';
import 'package:roguelike/personagem.dart';
import 'package:roguelike/ponto_2d.dart';

class Tesouro extends Personagem {

  static final int POSICAO_X = 0;
  static final int POSICAO_Y = 1;
  static final int MIN_MOEDAS = 50;
  static final int MAX_MOEDAS = 100;
  static final String SIMBOLO_TESOURO = "G";

  Random _aleatorio;
  int _moedas;
  bool _aberto;

  int get moedas => _moedas;
  bool get isAberto => _aberto;

  Tesouro(Ponto2D posicao, String simbolo) : super(posicao, simbolo) {
    _aleatorio = Random(null);
    _moedas = 0;
    _aberto = false;
  }

  @override
  void atualizar(Mundo mundo) {
    if (_moedas > 0 && !_aberto) {      
      this._aberto = true;
    }
  }

  void abrirTesouro() {
    this._moedas = MIN_MOEDAS + _aleatorio.nextInt(MAX_MOEDAS - MIN_MOEDAS);    
    print("[BAÚ ENCONTRADO]: Você ganhou ${_moedas} moedas!");
  }

}