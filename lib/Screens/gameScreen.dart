import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/winnerScreen.dart';
import 'package:tic_tac_toe/game_core.dart';
import 'package:tic_tac_toe/space.dart';

class GameScreen extends StatelessWidget {
  final String user;
  GameScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: GameBoard(user),
    );
  }
}

class GameBoard extends StatefulWidget {
  final String user;
  GameBoard(this.user);
  @override
  _GameBoardState createState() => _GameBoardState(this.user);
}

class _GameBoardState extends State<GameBoard> {
  var currentPlayer;
  String user;
  List<List<String>> board = List(3);
  List<List<Color>> colorBoard = List(3);
  Color playerColor = Color(0xFF27AAE1);
  var gameCore = GameCore();
  bool AI = false;

  _GameBoardState(this.user) {
    gameCore.initializeBoard(board);
    gameCore.color(colorBoard);

    if (user == 'X' || user == 'O') AI = true;
    currentPlayer = 'X';
    //if AI play
    if (AI && user == 'O') {
      gameCore.playAI(board, currentPlayer, colorBoard, playerColor);
      changeColor();
      changePlayer();
    }
  }

  void changeColor() {
    if (this.playerColor == Color(0xFF27AAE1)) {
      playerColor = Colors.red;
    } else {
      playerColor = Color(0xFF27AAE1);
    }
  }

  void changePlayer() {
    if (this.currentPlayer == 'X') {
      this.currentPlayer = 'O';
    } else if (this.currentPlayer == 'O') {
      this.currentPlayer = 'X';
    }
  }

  //change board
  //change color

  //validate
  //check for tie
  //change player

  //AI Play
  //change Color
  //validate
  //check for tie
  //change player
  void tick(int i, int j) {
    board[i][j] = currentPlayer;
    colorBoard[i][j] = playerColor;
    changeColor();
    endGame();
    if (AI) {
      gameCore.playAI(board, currentPlayer, colorBoard, playerColor);
      changeColor();
      endGame();
    }
  }

  void endGame() {
    bool done = gameCore.validate(board, currentPlayer);
    bool tie = gameCore.tie(board);
    if (done) {
      gameCore.initializeBoard(board);
      gameCore.color(colorBoard);
      AI = false;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WinnerScreen(currentPlayer)));
    } else if (tie) {
      gameCore.initializeBoard(board);
      gameCore.color(colorBoard);
      AI = false;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WinnerScreen('Noone')));
    } else {
      changePlayer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                currentPlayer + '\'s turn',
                style: TextStyle(
                    color: Color(0xFF27AAE1),
                    fontSize: 42.0,
                    fontFamily: 'PermanentMarker'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Space(
                  i: 0,
                  j: 0,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(0, 0);
                    });
                  },
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Space(
                  i: 0,
                  j: 1,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(0, 1);
                    });
                  },
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Space(
                  i: 0,
                  j: 2,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(0, 2);
                    });
                  },
                ),
              ],
            ),
          ),
          //end of row one
          Container(
            height: 10.0,
            width: double.maxFinite,
            color: Colors.blue[900],
          ),
          //start of row two
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Space(
                  i: 1,
                  j: 0,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(1, 0);
                    });
                  },
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Space(
                  i: 1,
                  j: 1,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(1, 1);
                    });
                  },
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Space(
                  i: 1,
                  j: 2,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(1, 2);
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 10.0,
            width: double.maxFinite,
            color: Colors.blue[900],
          ),
          //start of row three
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Space(
                  i: 2,
                  j: 0,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(2, 0);
                    });
                  },
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Space(
                  i: 2,
                  j: 1,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(2, 1);
                    });
                  },
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Space(
                  i: 2,
                  j: 2,
                  board: board,
                  colorBoard: colorBoard,
                  onTap: () {
                    setState(() {
                      tick(2, 2);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
