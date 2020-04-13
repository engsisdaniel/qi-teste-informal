import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final String _pergunta;
  final void Function(int) _responder;
  final List<Map> _respostas;

  Questionario(this._pergunta, this._respostas, this._responder);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questao(this._pergunta),
        ...this._respostas.map((res) {
          return Resposta(
              res['resposta'], () => this._responder(res['pontuacao']));
        }).toList()
      ],
    );
  }
}
