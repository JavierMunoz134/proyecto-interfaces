import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'home_page.dart';
import 'pilotos_screen.dart';
import 'circuitos_screen.dart';

class EscuderiasScreen extends StatefulWidget {
  @override
  _EscuderiasScreenState createState() => _EscuderiasScreenState();
}

class _EscuderiasScreenState extends State<EscuderiasScreen> {
  List escuderias = [];

  @override
  void initState() {
    super.initState();
    loadEscuderias();
  }

  Future<void> loadEscuderias() async {
    String jsonString = await rootBundle.loadString('assets/escuderias.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      escuderias = jsonResponse['escuderias'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/f1.png'),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Inicio', style: TextStyle(color: Colors.red, fontFamily: 'Russo One')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          TextButton(
            child: Text('Pilotos', style: TextStyle(color: Colors.red, fontFamily: 'Russo One')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PilotosScreen()),
              );
            },
          ),
          TextButton(
            child: Text('Circuitos', style: TextStyle(color: Colors.red, fontFamily: 'Russo One')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CircuitosScreen()),
              );
            },
          ),
          TextButton(
            child: Text('Escuderías', style: TextStyle(color: Colors.red, fontFamily: 'Russo One')),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EscuderiasScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: escuderias.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[850],
            shadowColor: Colors.red,
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            // Stroked text as border.
                            Text(
                              escuderias[index]['nombre'],
                              style: TextStyle(
                                fontSize: 20,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Colors.red[700]!,
                                fontFamily: 'Russo One',
                              ),
                            ),
                            // Solid text as fill.
                            Text(
                              escuderias[index]['nombre'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Russo One',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(escuderias[index]['bandera'], width: 30, height: 20),
                    ],
                  ),
                ),
                Image.network(escuderias[index]['foto']),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Base: ' + escuderias[index]['base'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Russo One')),
                      Text('Jefe: ' + escuderias[index]['jefe'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Russo One')),
                      Text('Motor: ' + escuderias[index]['motor'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Russo One')),
                      Text('Campeonatos: ' + escuderias[index]['campeonatos'].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Russo One')),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}