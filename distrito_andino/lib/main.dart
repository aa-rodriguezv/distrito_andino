import 'package:distrito_andino/models/salvoConducto.dart';
import 'package:distrito_andino/models/transportador.dart';
import 'package:distrito_andino/models/vigilancia.dart';
import 'package:distrito_andino/models/checkeo.dart';
import 'package:distrito_andino/models/peaje.dart';
import 'package:distrito_andino/widgets/user_peajecheck.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaveWood App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SAVE WOOD'),
        ),
        body: SingleChildScrollView(
                  child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,

            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Image.asset('assets/ruta.png'),
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue[900],
                  child: Text(
                    "RECORRIDOS, PLACA: 'YYY-777'",
                    style: TextStyle(color: Colors.grey[300]), textAlign: TextAlign.center,
                  ),
                  elevation: 5,
                ),
              ),
              UserTransactions(),
            ],
          ),
        ),
    );
  }
}
