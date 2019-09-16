import 'package:flutter/material.dart';

class Space extends StatefulWidget {
  int i;
  int j;
  Function onTap;
  var board;
  var colorBoard;
  Space(
      {@required this.i,
      @required this.j,
      @required this.onTap,
      @required this.board,
      @required this.colorBoard});
  @override
  _SpaceState createState() => _SpaceState(
      i: this.i,
      j: this.j,
      onTap: this.onTap,
      board: this.board,
      colorBoard: this.colorBoard);
}

class _SpaceState extends State<Space> {
  Function onTap;
  int i;
  int j;
  var board;
  var colorBoard;

  _SpaceState(
      {@required this.i,
      @required this.j,
      @required this.onTap,
      @required this.board,
      @required this.colorBoard});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: FlatButton(
        onPressed: onTap,
        child: Center(
          child: Text(
            board[i][j],
            style: TextStyle(
              fontSize: 60.0,
              fontFamily: 'PermanentMarker',
              color: colorBoard[i][j],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
