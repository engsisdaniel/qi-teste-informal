import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String _resposta;
  final Color _bgColor;
  final void Function() _quandoSelecionado;

  Resposta(this._resposta, this._quandoSelecionado, {bgColor: Colors.blueAccent}) : _bgColor = bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: RaisedButton(
        child: Text(this._resposta),
        onPressed: this._quandoSelecionado,
        color: this._bgColor,
        textColor: Colors.white,
      ),
    );
  }

  get bgColor {
    return this._bgColor;
  }

  get resposta {
    return this._resposta;
  }

  get quandoSelecionado {
    return this._quandoSelecionado;
  }
}
