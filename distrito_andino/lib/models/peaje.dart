import 'package:flutter/foundation.dart';

class Peaje {
  /*
   * Modela el codigo identificador unico del peaje
   */
  int codigo;

  /*
   * Modela el nombre del peaje
   */
  String nombre;

  /*
   * Modela constructor de la clase peaje
   */
  Peaje({
    @required this.codigo,
    @required this.nombre,
  });
}
