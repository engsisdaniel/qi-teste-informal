import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Teste de QI'),
            centerTitle: true,
          ),
          body: PerguntaApp(),
        ),
      ),
    );

class _PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
    {
      'pergunta': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'resposta': 'Richard Feynman', 'pontuacao': 1},
        {'resposta': 'Walter White', 'pontuacao': 2},
        {'resposta': 'Nego Ney', 'pontuacao': 3},
        {'resposta': 'Bozo', 'pontuacao': 4},
      ],
    },
    {
      'pergunta': 'Qual curso você faz?',
      'respostas': [
        {'resposta': 'Ciências Sexuais', 'pontuacao': 1 * 2},
        {'resposta': 'Engenharia', 'pontuacao': 2 * 2},
        {'resposta': 'Eletricista', 'pontuacao': 3 * 2},
        {'resposta': 'Cabelereiro', 'pontuacao': 4 * 2},
      ],
    },
    {
      'pergunta': 'Qual é o seu político de estimação?',
      'respostas': [
        {'resposta': 'Dilma Rousseff', 'pontuacao': 1 * 4},
        {'resposta': 'Jair Bolsonaro', 'pontuacao': 2 * 4},
        {'resposta': 'Cabo Daciolo', 'pontuacao': 3 * 4},
        {'resposta': 'Levy Fidelix', 'pontuacao': 4 * 4},
      ],
    },
  ];

  int _perguntaSelected = 0;
  int _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (this.temPerguntaSelecionada) {
      setState(() {
        this._perguntaSelected++;
        this._pontuacaoTotal += pontuacao;
      });
    }
    print(this._pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      this._perguntaSelected = 0;
      this._pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada =>
      this._perguntaSelected < this._perguntas.length;

  @override
  Widget build(BuildContext context) {
    List<Map> respostas = (this.temPerguntaSelecionada)
        ? this._perguntas[this._perguntaSelected]['respostas']
        : null;

    return (this.temPerguntaSelecionada)
        ? Questionario(
            this._perguntas[this._perguntaSelected]['pergunta'],
            respostas,
            this._responder,
          )
        : Resultado(this._pontuacaoTotal, this._reiniciarQuestionario);
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return new _PerguntaAppState();
  }
}
