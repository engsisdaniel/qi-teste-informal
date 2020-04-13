import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String _questao;

  Questao(this._questao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        this._questao,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
