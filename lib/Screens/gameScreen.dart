import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/winnerScreen.dart';
import 'package:tic_tac_toe/game_core.dart';

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
    AI = true;
    currentPlayer = 'X';
    //if AI play
  }
  //bug
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
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[0][0] == ' ') {
                          changeColor();
                          board[0][0] = currentPlayer;
                          colorBoard[0][0] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }

                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();
                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[0][0],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[0][0],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[0][1] == ' ') {
                          changeColor();
                          board[0][1] = currentPlayer;
                          colorBoard[0][1] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }

                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();

                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[0][1],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[0][1],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[0][2] == ' ') {
                          changeColor();
                          board[0][2] = currentPlayer;
                          colorBoard[0][2] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }

                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();
                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[0][2],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[0][2],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[1][0] == ' ') {
                          changeColor();
                          board[1][0] = currentPlayer;
                          colorBoard[1][0] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }

                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();
                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[1][0],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[1][0],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[1][1] == ' ') {
                          changeColor();
                          board[1][1] = currentPlayer;
                          colorBoard[1][1] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }

                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();
                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[1][1],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[1][1],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[1][2] == ' ') {
                          changeColor();
                          board[1][2] = currentPlayer;
                          colorBoard[1][2] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }

                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();
                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[1][2],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[1][2],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[2][0] == ' ') {
                          changeColor();
                          board[2][0] = currentPlayer;
                          colorBoard[2][0] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }

                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();
                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[2][0],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[2][0],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[2][1] == ' ') {
                          changeColor();
                          board[2][1] = currentPlayer;
                          colorBoard[2][1] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }

                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();
                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[2][1],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[2][1],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[900],
                  height: double.maxFinite,
                  width: 10.0,
                ),
                Expanded(
                  flex: 5,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (board[2][2] == ' ') {
                          changeColor();
                          board[2][2] = currentPlayer;
                          colorBoard[2][2] = playerColor;

                          //validate
                          if (gameCore.validate(board, currentPlayer)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WinnerScreen(currentPlayer)));
                            gameCore.initializeBoard(board);
                            gameCore.color(colorBoard);
                          } else {
                            if (gameCore.tie(board)) {
                              gameCore.initializeBoard(board);
                              gameCore.color(colorBoard);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WinnerScreen('Noone')));
                            }
                            changePlayer();
                          }
                          if (user != 'Y') {
                            Timer(Duration(seconds: 1), () {
                              gameCore.playAI();
                              if (gameCore.validate(board, currentPlayer)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WinnerScreen(currentPlayer)));
                                gameCore.initializeBoard(board);
                                gameCore.color(colorBoard);
                              } else {
                                if (gameCore.tie(board)) {
                                  gameCore.initializeBoard(board);
                                  gameCore.color(colorBoard);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WinnerScreen('Noone')));
                                }
                                changePlayer();
                              }
                            });
                          }
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        board[2][2],
                        style: TextStyle(
                          fontSize: 60.0,
                          fontFamily: 'PermanentMarker',
                          color: colorBoard[2][2],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
