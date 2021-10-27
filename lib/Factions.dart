import 'package:flutter/material.dart';
import 'dart:math';

class Factions extends StatelessWidget {
  Factions({this.title, this.numberOfPlayers, this.nameOfPlayers});

  final String title;
  final int numberOfPlayers;
  final List<String> nameOfPlayers;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DisplayFactions(
          title: title,
          numberOfPlayers: numberOfPlayers,
          nameOfPlayers: nameOfPlayers),
    );
  }
}

class DisplayFactions extends StatefulWidget {
  DisplayFactions({this.title, this.numberOfPlayers, this.nameOfPlayers});

  final String title;
  final int numberOfPlayers;
  final List<String> nameOfPlayers;

  @override
  _DisplayFactionsState createState() => _DisplayFactionsState(
      numberOfPlayers: numberOfPlayers, nameOfPlayers: nameOfPlayers);
}

class _DisplayFactionsState extends State<DisplayFactions> {
  _DisplayFactionsState({this.numberOfPlayers, this.nameOfPlayers});

  final int numberOfPlayers;
  final List<String> nameOfPlayers;

  final List<String> faction2j = [
    'Marquise de Chat',
    'Duché Souterrain',
    'Dynastie de la Canopée',
  ];

  final List<String> faction = [
    'Marquise de Chat',
    'Duché Souterrain',
    'Dynastie de la Canopée',
    'Société des Colombes Unies',
    'Vagabond (premier)',
    'Compagnie de la Rivière',
    'Royaume des Neiges',
    'Cercle Arachnéen',
    'Cabale des Nécropossums',
    'Alliance de la Forêt',
    'Conspiration des Corvidés',
    'Culte des Lézards',
  ];

  List<String> unselectedFaction = [
    'Marquise de Chat',
    'Duché Souterrain',
    'Dynastie de la Canopée',
    'Société des Colombes Unies',
    'Vagabond (premier)',
    'Compagnie de la Rivière',
    'Royaume des Neiges',
    'Cercle Arachnéen',
    'Cabale des Nécropossums',
    'Alliance de la Forêt',
    'Conspiration des Corvidés',
    'Culte des Lézards',
  ];

  final Map<String, int> factionValue = {
    'Marquise de Chat': 10,
    'Duché Souterrain': 8,
    'Dynastie de la Canopée': 7,
    'Société des Colombes Unies': 6,
    'Vagabond (premier)': 5,
    'Compagnie de la Rivière': 5,
    'Royaume des Neiges': 5,
    'Cercle Arachnéen': 4,
    'Cabale des Nécropossums': 4,
    'Alliance de la Forêt': 3,
    'Conspiration des Corvidés': 3,
    'Vagabond (second)': 2,
    'Culte des Lézards': 2,
  };

  final Map<int, int> weight = {
    2: 17,
    3: 18,
    4: 21,
    5: 25,
    6: 28,
  };

  Map<String, String> result = {};

  int total = 0;

  int i = 0;

  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    while (total <= weight[numberOfPlayers]) {
      unselectedFaction.clear();
      if (numberOfPlayers == 2) {
        unselectedFaction.addAll(faction2j);
      } else {
        unselectedFaction.addAll(faction);
      }
      i = 0;
      total = 0;

      while (i < numberOfPlayers) {
        int selection = random.nextInt(unselectedFaction.length);
        String selectedFaction = unselectedFaction[selection];
        unselectedFaction.remove(selectedFaction);
        total = total + factionValue[selectedFaction];
        result[nameOfPlayers[i]] = selectedFaction;
        if (selectedFaction == 'Vagabond (premier)') {
          unselectedFaction.add('Vagabond (second)');
        }
        i++;
      }
    }

    List<Widget> resultDisplay() {
      List<Widget> list = [];
      for (int i = 0; i < numberOfPlayers; i++) {
        list.add(
          Text(
            nameOfPlayers[i] + ' : ' + result[nameOfPlayers[i]],
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      return list;
    }

    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 40.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: resultDisplay(),
        ),
      ),
    );
  }
}


