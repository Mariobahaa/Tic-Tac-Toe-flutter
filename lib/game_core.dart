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

  int grade(int lk, int nlk, int b) {
    if (lk == 2)
      return 30;
    else if (nlk == 2)
      return 25;
    else if (lk == 1 && nlk == 1)
      return 1;
    else if (lk == 1 && b == 1)
      return 8;
    else if (nlk == 1 && b == 1)
      return 1;
    else if (b == 2) return 4;
  }

  int points(int r, int c, List<List<String>> board, String symbol) {
    //check columns
    int like = 0, notLike = 0, blank = 0;
    for (int i = r + 1; i <= 2 + r; i++) {
      if (board[i % 3][c] == symbol)
        like++;
      else if (board[i % 3][c] == ' ') blank++;
      notLike = 2 - (blank + like);
    }
    int cg = grade(like, notLike, blank); //column grade

    //check rows
    like = 0;
    notLike = 0;
    blank = 0;
    for (int i = c + 1; i <= 2 + c; i++) {
      if (board[r][i % 3] == symbol)
        like++;
      else if (board[r][i % 3] == ' ') blank++;
      notLike = 2 - (blank + like);
    }
    int rg = grade(like, notLike, blank); //row grade

    // diagonals
    int d1g = 0, d2g = 0;

    like = 0;
    notLike = 0;
    blank = 0;
    if (r == c) {
      for (int i = r + 1; i <= r + 2; i++) {
        if (board[i % 3][i % 3] == symbol)
          like++;
        else if (board[i % 3][i % 3] == ' ') blank++;
        notLike = 2 - (blank + like);
      }
      d1g = grade(like, notLike, blank); //row grade
    } else if (r == 2 - c) {
      like = 0;
      notLike = 0;
      blank = 0;
      for (int i = r + 1; i <= r + 2; i++) {
        if (board[i % 3][2 - (i % 3)] == symbol)
          like++;
        else if (board[i % 3][2 - (i % 3)] == ' ') blank++;
        notLike = 2 - (blank + like);
      }
      d2g = grade(like, notLike, blank); //row grade
    }

    return rg + cg + d1g + d2g;
  }

  void playAI(List<List<String>> board, String symbol,
      List<List<Color>> colorBoard, Color playerColor) {
    List<List<int>> grid = List(3);
    for (int i = 0; i < 3; i++) grid[i] = List(3);

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] != ' ')
          grid[i][j] = 0;
        else
          grid[i][j] = points(i, j, board, symbol);
      }
    }

    int max = 0;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        //log(grid[i][j]);
        if (grid[i][j] > max) max = grid[i][j];
      }
    }

    bool fnd = false;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == max) {
          board[i][j] = symbol;
          colorBoard[i][j] = playerColor;
          fnd = true;
          break;
        }
      }
      if (fnd) break;
    }
  }
}
