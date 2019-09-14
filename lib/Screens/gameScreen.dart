import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final String user;
  String currentPlayer;
  GameScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Container(),
    );
  }
}
