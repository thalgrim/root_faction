import 'package:flutter/material.dart';

import 'Factions.dart';

class Bots extends StatelessWidget {
  const Bots(
      {this.title,
      this.numberOfPlayers,
      this.nameOfPlayers,
      this.extensionList});

  final String title;
  final int numberOfPlayers;
  final List<String> nameOfPlayers;
  final Map<String, bool> extensionList;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisplayBots(
        title: title,
        numberOfPlayers: numberOfPlayers,
        nameOfPlayers: nameOfPlayers,
        extensionList: extensionList,
      ),
    );
  }
}

class DisplayBots extends StatefulWidget {
  const DisplayBots(
      {this.title,
      this.numberOfPlayers,
      this.nameOfPlayers,
      this.extensionList});

  final String title;
  final int numberOfPlayers;
  final List<String> nameOfPlayers;
  final Map<String, bool> extensionList;

  @override
  _DisplayBotsState createState() => _DisplayBotsState(
      numberOfPlayers: numberOfPlayers, nameOfPlayers: nameOfPlayers, extensionList: extensionList);
}

class _DisplayBotsState extends State<DisplayBots> {
  _DisplayBotsState(
      {this.numberOfPlayers, this.nameOfPlayers, this.extensionList});

  final int numberOfPlayers;
  final List<String> nameOfPlayers;
  final Map<String, bool> extensionList;

  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      if (extensionList['Monde souterrain']) {
        if (_counter < 6 - numberOfPlayers && _counter < 4) {
          _counter++;
        }
      } else {
        if (_counter < 6 - numberOfPlayers && _counter < 1) {
          _counter++;
        }
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (numberOfPlayers == 1) {
        if (_counter > 1) {
          _counter--;
        }
      } else {
        if (_counter > 0) {
          _counter--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Image(image: AssetImage('assets/images/root_background.png')),
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
                  "Nombre de bots :",
                  style: TextStyle(height: -1, fontSize: 40),
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
                builder: (context) => Factions(
                      title: 'Root : Assignation des factions',
                      numberOfPlayers: numberOfPlayers,
                      nameOfPlayers: nameOfPlayers,
                      numberOfBots: _counter,
                      extensionList: extensionList,
                    )),
          );
        },
        child: Text('OK'),
      ),
    );
  }
}
