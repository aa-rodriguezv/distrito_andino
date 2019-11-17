
import 'package:distrito_andino/models/checkeo.dart';
import 'package:distrito_andino/models/ruta.dart';
import 'package:flutter/foundation.dart';

class SalvoConducto {
  /*
   * Modela el numero de registro unico para el id
   */
  double id;

  /*
   * Modela la fecha desde la cual el salvoconducto entra en vigencia
   */
  DateTime fechaVigenteDeste;

  /*
   * Modela la fecha hasta la cual el salvoconducto cuenta con vigencia
   */
  DateTime fechaVigenteHasta;

  /*
  * Modela el origen del destino
  */
  List<double> coordenadasOrigen;

  /*
   * Modela las coordenadas del destino
   */
  List<double> coordenadasDestino;

  /*
   * Modela la lista de peajes checkeados, por las cuales el salvoconducto deja de ser vigente
   */
  List<Checkeo> checkeados = new List<Checkeo>();

  /*
   * Modela las posibles rutas referentes a ese destino y origen
   */
  List<Ruta> posiblesRutas = new List<Ruta>();

  /*
   * Modela el estado de vigencia del salvoconducto
   */
  bool estaVigente = false;

  /*
   * Constructor de la clase del salvo conducto
   */
  SalvoConducto({
    @required this.id,
    @required this.fechaVigenteDeste,
    @required this.fechaVigenteHasta,
    @required this.coordenadasOrigen,
    @required this.coordenadasDestino,
  });
}
