
import 'package:distrito_andino/models/peaje.dart';
import 'package:flutter/foundation.dart';

class Ruta {
  /*
   * Modela la lista de peajes que pasan por esa ruta
   */
  List<Peaje> peajesNecesarios;

  /*
  *Modela las coordenadas de inicio de la ruta
  */
  List<double> coordenadasInicio;

  /*
  *Modela las coordenadas finales de la ruta
  */
  List<double> coordenadasFinales;

  Ruta({
    @required this.peajesNecesarios,
    @required this.coordenadasInicio,
    @required this.coordenadasFinales,
  });
}
