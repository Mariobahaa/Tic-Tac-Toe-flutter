import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Screens/gameScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 100.0,
                      width: 100.0,
                      child: Image.asset('assets/Tic-Tac-Toe-Game.ico')),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Tic Tac Toe',
                    style: TextStyle(
                        color: Color(0xFF27AAE1),
                        fontSize: 42.0,
                        fontFamily: 'PermanentMarker'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                Navigator.pushNamed(context, '/side');
              },
              color: Color(0xFF27AAE1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Text(
                      '1 Player',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'PermanentMarker',
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GameScreen('Y')));
                },
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 18.0,
                      ),
                      Text(
                        '2 Players',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'PermanentMarker',
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
