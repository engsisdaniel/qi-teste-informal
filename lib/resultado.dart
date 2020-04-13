import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int _pontuacao;
  final void Function() _reiniciarQuestionario;

  Resultado(this._pontuacao, this._reiniciarQuestionario);

  String get resultadoQi {
    int valorMaximo = 28;
    int qiMaximo = 180;
    double perc = this._pontuacao / valorMaximo;
    int qi = (perc * qiMaximo).floor();
    return qi.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'QI',
            style: TextStyle(fontSize: 32),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              resultadoQi,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Parabéns!',
            style: TextStyle(fontSize: 32, color: Colors.green),
          ),
          
          Container(
            margin: EdgeInsets.only(top: 30),
            child: RaisedButton(
              child: Text('Sinto-me mais inteligente!'),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: this._reiniciarQuestionario,
            ),
          ),
        ],
      ),
    );
  }
}
