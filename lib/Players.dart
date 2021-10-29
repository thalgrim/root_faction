import 'package:flutter/material.dart';

import 'Bots.dart';
import 'Factions.dart';

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
    "Joueur 1",
    "Joueur 2",
    "Joueur 3",
    "Joueur 4",
    "Joueur 5",
    "Joueur 6"
  ];

  Widget floatingActionButton() {
    if (numberOfPlayers == 6) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Factions(
                      title: 'Root : Assignation des factions',
                      numberOfPlayers: numberOfPlayers,
                      nameOfPlayers: playerList,
                      numberOfBots: 0,
                    )),
          );
        },
        child: Text('OK'),
      );
    } else {
      return FloatingActionButton(
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
        child: Text('OK'),
      );
    }
  }

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
      floatingActionButton: floatingActionButton(),
    );
  }
}
