import 'package:distrito_andino/models/salvoConducto.dart';
import 'package:distrito_andino/models/transportador.dart';
import 'package:distrito_andino/models/vigilancia.dart';
import 'package:distrito_andino/widgets/checkeo_list.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './new_peaje_check.dart';
import '../models/checkeo.dart';
import '../models/peaje.dart';
import '../models/ruta.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  List<Checkeo> _userCheckeos = new List <Checkeo>();

  SalvoConducto s1 = new SalvoConducto(coordenadasOrigen: [-77, 45], fechaVigenteDeste: DateTime.parse("2019-10-30 13:27:00"), fechaVigenteHasta: DateTime.parse("2019-11-30 13:27:00"), id: 55, coordenadasDestino: [-78, 46]);

  Transportador tTT = new Transportador(placaVehiculo: "YYY-777");

  Peaje p1 = new Peaje(codigo: 3938, nombre: "Mata de Caña");

  Peaje p2 = new Peaje(codigo: 3934, nombre: "Caimanera");

  Peaje p3 = new Peaje(codigo: 3820, nombre: "San Onofre");

  Peaje p4 = new Peaje(codigo: 3917, nombre: "Gambote");

  Peaje p5 = new Peaje(codigo: 4000, nombre: "PasaCaballos");


  Vigilancia vig = new Vigilancia();

  void _addNewTransaction(int txCodigo, String txNombre) {

    tTT.salvoConductosExpedidos.add(s1);

    List<Peaje> peajes = [p1, p2, p3, p4, p5];

    Ruta rut = new Ruta(peajesNecesarios: peajes, coordenadasFinales: [-77, 55], coordenadasInicio: [-75, 48]);

    s1.posiblesRutas.add(rut);

    vig.transportadoresRegistrados.add(tTT);

    vig.expedidosTotal.add(s1);

    vig.getVigente(tTT.placaVehiculo);

    _userCheckeos = tTT.vigente.checkeados;

    final newTx = Checkeo(
      fechaPeaje: DateTime.now(),
      peajeAcheckear: new Peaje(codigo: txCodigo, nombre: txNombre));

    setState(() {
      try{
        vig.addCheckeado(newTx);
      }
      on Exception catch(e)
      {
        Alert(
      context: context,
      type: AlertType.warning,
      title: "ALERTA DE INCONSISTENCIA",
      desc: e.toString(),
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
        print(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        CheckeoList(_userCheckeos),
      ],
    );
  }
}
