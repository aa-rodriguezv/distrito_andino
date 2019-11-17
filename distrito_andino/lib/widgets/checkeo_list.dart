import 'package:distrito_andino/models/checkeo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckeoList extends StatelessWidget {
  final List<Checkeo> checks;

  CheckeoList(this.checks);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: checks.map((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey[900],
                    width: 5,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  '${tx.peajeAcheckear.codigo}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.amberAccent[700],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.peajeAcheckear.nombre,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.fechaPeaje),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
