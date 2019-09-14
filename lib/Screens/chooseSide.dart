import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gameScreen.dart';

class ChooseSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Text(
            'Choose your side',
            style: TextStyle(
              fontSize: 42.0,
              fontFamily: 'PermanentMarker',
              color: Color(0xFF27AAE1),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.white,
                      child: Text(
                        'X',
                        style: TextStyle(
                          fontSize: 100.0,
                          fontFamily: 'PermanentMarker',
                          color: Color(0xFF27AAE1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/game',
                            arguments: GameScreen('X'));
                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.white,
                      child: Text(
                        'O',
                        style: TextStyle(
                          fontSize: 100.0,
                          fontFamily: 'PermanentMarker',
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/game',
                            arguments: GameScreen('O'));
                      }),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
