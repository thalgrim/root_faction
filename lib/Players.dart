import 'package:flutter/material.dart';

import 'Bots.dart';

class Players extends StatelessWidget {
  Players({this.title, this.numberOfPlayers});

  final String title;
  final int numberOfPlayers;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisplayPlayers(title: title, numberOfPlayers: numberOfPlayers),
    );
  }
}

class DisplayPlayers extends StatefulWidget {
  DisplayPlayers({this.title, this.numberOfPlayers});

  final String title;
  final int numberOfPlayers;

  @override
  _DisplayPlayersState createState() =>
      _DisplayPlayersState(numberOfPlayers: numberOfPlayers);
}

class _DisplayPlayersState extends State<DisplayPlayers> {
  _DisplayPlayersState({this.numberOfPlayers});

  final int numberOfPlayers;
  List<String> playerList = [
    "joueur 1",
    "joueur 2",
    "joueur 3",
    "joueur 4",
    "joueur 5",
    "joueur 6"
  ];

  List<Widget> playerListDisplay() {
    List<Widget> list = [];
    for (int i = 0; i < numberOfPlayers; i++) {
      list.add(
        TextField(
          decoration: InputDecoration(
            hintText: playerList[i],
          ),
          onChanged: (value) {
            setState(() {
              playerList[i] = value;
            });
          },
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: playerListDisplay(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Bots(
                      title: 'Root : Nombre de bots',
                      numberOfPlayers: numberOfPlayers,
                      nameOfPlayers: playerList,
                    )),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
