import 'package:flutter/material.dart';

class GameCore {
  void initializeBoard(List<List<String>> board) {
    board[0] = List(3);
    board[1] = List(3);
    board[2] = List(3);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j] = ' ';
      }
    }
  }

  void color(List<List<Color>> board) {
    board[0] = List(3);
    board[1] = List(3);
    board[2] = List(3);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j] = Color(0xFF27AAE1);
      }
    }
  }

  bool validate(List<List<String>> board, String user) {
    for (int i = 0; i < 3; i++) //rows and columns
    {
      int r = 0;
      int c = 0;
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == user) r++;
        if (board[j][i] == user) c++;
      }
      if (c == 3 || r == 3) return true;
    }

    int d1 = 0;
    int d2 = 0;
    for (int i = 0; i < 3; i++) // diagonals
    {
      if (board[i][i] == user) d1++;
      if (board[2 - i][i] == user) d2++;
    }
    if (d1 == 3 || d2 == 3) return true;

    return false;
  }

  bool tie(board) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == ' ') return false;
      }
    }
    return true;
  }

  void playAI() {}
}
