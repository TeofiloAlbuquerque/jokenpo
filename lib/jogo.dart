import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  // imagemApp, a imagem que será escolhida pelo App
  var _imagemApp = AssetImage("lib/images/padrao.png");
  // mensagem inicial
  var _mensagem = "Escolha uma opção abaixo";
  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    // informar a escolha do usuario e do App no debug console
    print("Escolha do App: " + escolhaApp);
    print("Opção selecionada: " + escolhaUsuario);

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("lib/images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("lib/images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("lib/images/tesoura.png");
        });
        break;
    }
    // Validação do ganhador
    // Usuario ganhador
    if (
        // ||, ou
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
            (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
            (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns, você ganhou! :)";
      });
    } else if (
        // App ganhador
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
            (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
            (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Você perdeu :(";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jo-ken-po!"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // text
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // instanciando a variavel _imagemApp
          // imagem dinamica
          Image(
            image: this._imagemApp,
          ),
          // text
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // linha 3 images
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /* Detector de gestos
              onTap, Um clique
              onDoubleTap, Dois cliques
              onLongPress, Clique longo*/
              GestureDetector(
                // função anonima
                onTap: () => _opcaoSelecionada("Pedra"),
                child: Image.asset("lib/images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Papel"),
                child: Image.asset("lib/images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("Tesoura"),
                child: Image.asset("lib/images/tesoura.png", height: 100),
              )
            ],
          )
        ],
      ),
    );
  }
}
