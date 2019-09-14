import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'Screens/chooseSide.dart';
import 'Screens/gameScreen.dart';
import 'Screens/homeScreen.dart';
import 'Screens/winnerScreen.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  // This widget is the root of your application.

  TicTacToe() {
    final player = AudioCache();
    player.play('SOU.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF27AAE1),
        ),
        scaffoldBackgroundColor: Colors.lightBlueAccent[50],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/game': (context) => GameScreen(),
        '/side': (context) => ChooseSide(),
        '/winner': (context) => WinnerScreen(),
      },
    );
  }
}
