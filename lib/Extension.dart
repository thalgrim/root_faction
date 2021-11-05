import 'package:flutter/material.dart';
import 'package:root_faction_aleatoire/PlayerNumber.dart';

class Extension extends StatelessWidget {
  Extension({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DisplayExtension(
          title: title,
        ));
  }
}

class DisplayExtension extends StatefulWidget {
  DisplayExtension({
    this.title,
  });

  final String title;

  @override
  _DisplayExtensionState createState() => _DisplayExtensionState();
}

Map<String, bool> extensionList = {
  'Monde souterrain': false,
  'Maraudeur': false,
  'Fan faction saison 1': false,
};

class _DisplayExtensionState extends State<DisplayExtension> {
  Widget switchExtension1() {
    return Row(
      children: [
        Switch(
          value: extensionList['Monde souterrain'],
          onChanged: (value) {
            setState(() {
              extensionList['Monde souterrain'] = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
        Text('Monde souterrain'),
      ],
    );
  }

  Widget switchExtension2() {
    return Row(
      children: [
        Switch(
          value: extensionList['Maraudeur'],
          onChanged: (value) {
            setState(() {
              extensionList['Maraudeur'] = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
        Text('Maraudeur'),
      ],
    );
  }

  Widget switchExtension3() {
    return Row(
      children: [
        Switch(
          value: extensionList['Fan faction saison 1'],
          onChanged: (value) {
            setState(() {
              extensionList['Fan faction saison 1'] = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
        Text('Fan faction saison 1'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(children: [
            switchExtension1(),
            switchExtension2(),
            switchExtension3()
          ])),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayerNumber(
                      title: 'Root : Nombre de joueurs',
                      extensionList: extensionList)),
            );
          },
          child: Text('OK')),
    );
  }
}
