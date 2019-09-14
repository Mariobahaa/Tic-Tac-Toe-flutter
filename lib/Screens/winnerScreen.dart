import 'package:flutter/material.dart';

class WinnerScreen extends StatelessWidget {
  final String winner;
  WinnerScreen(this.winner);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            winner + ' Wins!',
            style: TextStyle(
              fontSize: 100.0,
              fontFamily: 'PermanentMarker',
              color: Color(0xFF27AAE1),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Color(0xFF27AAE1),
                      child: Icon(
                        Icons.home,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/',
                        );
                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Color(0xFF27AAE1),
                      child: Icon(
                        Icons.refresh,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/side',
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
