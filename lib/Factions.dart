import 'package:flutter/material.dart';
import 'dart:math';

class Factions extends StatelessWidget {
  Factions({this.title,
    this.numberOfPlayers,
    this.nameOfPlayers,
    this.numberOfBots,
    this.extensionList});

  final String title;
  final int numberOfPlayers;
  final int numberOfBots;
  final List<String> nameOfPlayers;
  final Map<String, bool> extensionList;

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
          nameOfPlayers: nameOfPlayers,
          numberOfBots: numberOfBots,
          extensionList: extensionList),
    );
  }
}

class DisplayFactions extends StatefulWidget {
  DisplayFactions({this.title,
    this.numberOfPlayers,
    this.nameOfPlayers,
    this.numberOfBots,
    this.extensionList});

  final String title;
  final int numberOfPlayers;
  final int numberOfBots;
  final List<String> nameOfPlayers;
  final Map<String, bool> extensionList;

  @override
  _DisplayFactionsState createState() =>
      _DisplayFactionsState(
          numberOfPlayers: numberOfPlayers,
          nameOfPlayers: nameOfPlayers,
          numberOfBots: numberOfBots,
          extensionList: extensionList
      );
}

class _DisplayFactionsState extends State<DisplayFactions> {
  _DisplayFactionsState(
      {this.numberOfPlayers, this.nameOfPlayers, this.numberOfBots, this.extensionList});

  final int numberOfPlayers;
  final int numberOfBots;
  final List<String> nameOfPlayers;
  final Map<String, bool> extensionList;

  final List<String> nameOfBots = [
    'Premier bot',
    'Second bot',
    'Troisième bot',
    'Quatrième bot',
  ];

  final List<String> factionBotsBase = [
    'Marquise Mécanique',
  ];

  final List<String> factionBotsUnderworld = [
    'Marquise Mécanique 2.0',
    'Canopée Électrique',
    'Alliance Automatisée',
    'Vagabot',
  ];

  List<String> factionBots = [];

  final List<String> factionBase = [
    'Marquise de Chat',
    'Dynastie de la Canopée',
    'Vagabond (premier)',
    'Compagnie de la Rivière',
    'Alliance de la Forêt',
    'Culte des Lézards',
  ];

  final List<String> factionUnderworld = [
    'Duché Souterrain',
    'Conspiration des Corvidés',
  ];

  final List<String> factionMarauder = [
    'Seigneur des nuées',
    'Les gardiens d\'airain',
  ];

  final List<String> factionFanMade1 = [
    'Société des Colombes Unies',
    'Royaume des Neiges',
    'Cercle Arachnéen',
    'Cabale des Nécropossums',
  ];

  final List<String> faction = [];

  List<String> unselectedFaction = [];

  List<String> unselectedFactionBots = [];

  final Map<String, int> factionBotValue = {
    'Marquise Mécanique': 10,
    'Marquise Mécanique 2.0': 10,
    'Canopée Électrique': 7,
    'Vagabot': 5,
    'Alliance Automatisée': 3,
  };

  final Map<String, int> factionValue = {
    'Marquise de Chat': 10,
    'Seigneur des nuées' : 9,
    'Duché Souterrain': 8,
    'Les gardiens d\'airain' : 8,
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

  Map<String, String> resultBots = {};

  int total = 0;

  int i = 0;

  int j = 0;

  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    faction.addAll(factionBase);
    factionBots.addAll(factionBotsBase);
    if(extensionList['Monde souterrain']){
     faction.addAll(factionUnderworld);
     factionBots.clear();
     factionBots.addAll(factionBotsUnderworld);
    }
    if(extensionList['Maraudeur']){
      faction.addAll(factionMarauder);
    }
    if(extensionList['Fan faction saison 1']){
      faction.addAll(factionFanMade1);
    }
    while (total <= weight[numberOfPlayers + numberOfBots]) {
      unselectedFaction.clear();
      unselectedFaction.addAll(faction);
      unselectedFactionBots.clear();
      unselectedFactionBots.addAll(factionBots);

      i = 0;
      j = 0;
      total = 0;

      if (numberOfBots >= 1) {
        while (j < numberOfBots) {
          int selection = random.nextInt(unselectedFactionBots.length);
          String selectedFactionBots = unselectedFactionBots[selection];
          unselectedFactionBots.remove(selectedFactionBots);
          total = total + factionBotValue[selectedFactionBots];
          resultBots[nameOfBots[j]] = selectedFactionBots;
          if (selectedFactionBots == 'Vagabot') {
            unselectedFaction.remove('Vagabond (premier)');
            unselectedFaction.add('Vagabond (second)');
          }
          if (selectedFactionBots == 'Marquise Mécanique 2.0') {
            unselectedFaction.remove('Marquise de Chat');
          }
          if (selectedFactionBots == 'Marquise Mécanique') {
            unselectedFaction.remove('Marquise de Chat');
          }
          if (selectedFactionBots == 'Canopée Électrique') {
            unselectedFaction.remove('Dynastie de la Canopée');
          }
          if (selectedFactionBots == 'Alliance Automatisée') {
            unselectedFaction.remove('Alliance de la Forêt');
          }
          j++;
        }
      }

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

      if (numberOfBots >= 1) {
        for (int i = 0; i < numberOfBots; i++) {
          list.add(
            Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: Text(
                      nameOfBots[i] + ' : ',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          );
          list.add(
            Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: Text(
                      resultBots[nameOfBots[i]],
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }

      for (int i = 0; i < numberOfPlayers; i++) {
        list.add(
          Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Text(
                    nameOfPlayers[i] + ' : ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        );
        list.add(
          Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: Text(
                    result[nameOfPlayers[i]],
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return list;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Image(image: AssetImage('assets/images/root_background.png')),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: resultDisplay(),
        ),
      ),
    );
  }
}
