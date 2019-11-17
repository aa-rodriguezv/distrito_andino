import 'package:distrito_andino/models/peaje.dart';
import 'package:flutter/foundation.dart';

class Checkeo {
  /*
  * Modela el peaje a ser checkeado
  */
  Peaje peajeAcheckear;

  /*
   * Modela la fecha de registro del pasaje
   */
  DateTime fechaPeaje;

  Checkeo({
    @required this.peajeAcheckear,
    @required this.fechaPeaje,
  });
}
