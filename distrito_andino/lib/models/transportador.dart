import 'package:distrito_andino/models/salvoConducto.dart';
import 'package:flutter/foundation.dart';

class Transportador {
  /*
   * Modela la placa del vehiculo
   */
  String placaVehiculo;

  /*
   * Modela la lista de salvoconductos que ha expedido
   */
  List<SalvoConducto> salvoConductosExpedidos = new List<SalvoConducto>();

  /*
   * Modela el salvoConducto unico que tiene disponible para ese momento del tiempo 
   */
  SalvoConducto vigente;

  /*
   * Modela las coordenadas actuales del transportador
   */
  List<double> coordenadasActuales;

  Transportador({
    @required this.placaVehiculo,
    this.coordenadasActuales,
  });
}
