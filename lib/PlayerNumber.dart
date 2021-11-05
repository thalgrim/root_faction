import 'package:flutter/material.dart';

import 'Players.dart';
import 'main.dart';

class PlayerNumber extends StatelessWidget {
  PlayerNumber({this.title, this.extensionList});

  final String title;
  final Map<String, bool> extensionList;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DisplayPlayerNumber(
          title: title,
        ));
  }
}

class DisplayPlayerNumber extends StatefulWidget {
  DisplayPlayerNumber({this.title, this.extensionList});

  final String title;
  final Map<String, bool> extensionList;

  @override
  _DisplayPlayerNumberState createState() => _DisplayPlayerNumberState();
}

class _DisplayPlayerNumberState extends State<DisplayPlayerNumber> {
  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      if (_counter < 6) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Nombre de joueurs :",
                  style: TextStyle(height: -1, fontSize: 35),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _counter.toString(),
                  style: TextStyle(height: 0, fontSize: 40),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      onPressed: () {
                        _decrementCounter();
                      },
                      child: const Icon(Icons.arrow_downward, size: 40.0),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                      ),
                      onPressed: () {
                        _incrementCounter();
                      },
                      child: const Icon(Icons.arrow_upward, size: 40.0),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Players(
                      title: 'Root : Définir les joueurs',
                      extensionList: extensionList,
                      numberOfPlayers: _counter)),
            );
          },
          child: Text('OK')),
    );
  }
}
