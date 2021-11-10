import 'package:flutter/material.dart';
import 'PlayerNumber.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Root : Sélection aléatoire de faction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Root : Choix des extensions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Map<String, bool> extensionList = {
  'Monde souterrain': false,
  'Maraudeur': false,
  'Fan faction saison 1': false,
};

class _MyHomePageState extends State<MyHomePage> {
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Image(image: AssetImage('assets/images/root_background.png')),
      ),


      body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(children: [
            Text("Choix des extensions :",style: TextStyle(fontSize: 20),),
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
