

import 'package:distrito_andino/models/checkeo.dart';
import 'package:distrito_andino/models/salvoConducto.dart';
import 'package:distrito_andino/models/transportador.dart';

class Vigilancia {
  /*
   * Modela la lista de salvo conductos registrados
   */
  List<SalvoConducto> expedidosTotal = new List<SalvoConducto>();

  /*
   * Modela la lista de transportadores registrados
   */
  List<Transportador> transportadoresRegistrados = new List<Transportador>();

  /*
   * Modela el salvoConducto de la aplicacion actual que se esta analizando 
   */
  SalvoConducto actualSC;


  /*
   *
   */
  SalvoConducto getVigente(String placa) {
    for (int i = 0;i<transportadoresRegistrados.length; i++) {
      if (transportadoresRegistrados[i].placaVehiculo == placa) {
        setSalvoConductoVigente(transportadoresRegistrados[i]);
        actualSC = transportadoresRegistrados[i].vigente;
        actualSC.estaVigente = true;
        return transportadoresRegistrados[i].vigente;
      }
      else
      {
        throw new Exception("ALERTA! No hay ningun salvo conducto registrado para el vehiculo buscado");
      }
    }
  }

  addCheckeado(Checkeo checkeoDePeaje)
  {
    checkSalvoConductoPorPeaje(checkeoDePeaje.peajeAcheckear.codigo);
    checkEstadoDeVigencia();
    checkRutaPermitidas(checkeoDePeaje.peajeAcheckear.codigo);
    actualSC.checkeados.add(checkeoDePeaje);
  }


// ----------------- AUXILIARES -------------------------

  checkSalvoConductoPorPeaje(int codigoPeaje)
  {
    for(int i = 0; i<actualSC.checkeados.length; i++)
    {
      if(actualSC.checkeados[i].peajeAcheckear.codigo == codigoPeaje)
      {
        throw new Exception("ALERTA! Ya se ha registrado el salvo conducto por este peaje");
      }
    }
  }

  checkEstadoDeVigencia()
  {
    if(!actualSC.estaVigente)
    {
      throw new Exception("ALERTA! Este salvo conducto ya se encuentra vigente");
    }
  }

  /*
   *
   */
  checkRutaPermitidas(int codigoPeaje)
  {

    bool clear = false;

      for(int i = 0; i<actualSC.posiblesRutas.length; i++)
      {
          for(int j = 0; j< actualSC.posiblesRutas[i].peajesNecesarios.length; j++)
          {
              if(actualSC.posiblesRutas[i].peajesNecesarios[j].codigo == codigoPeaje){
                clear = true;
              }
          }

      }
      if(!clear)
      {
        throw new Exception("ALERTA! Este salvo conducto esta siendo utilizado por rutas no identificadas");
      }
  }


  /*
  *
  */
  setSalvoConductoVigente(Transportador buscado) {
    for (int i = 0; i < buscado.salvoConductosExpedidos.length; i++) {
      if (buscado.salvoConductosExpedidos[i].fechaVigenteDeste
              .isBefore(DateTime.now()) ||
          buscado.salvoConductosExpedidos[i].fechaVigenteHasta
              .isBefore(DateTime.now())) {
        buscado.vigente = buscado.salvoConductosExpedidos[i];
      }
    }
  }

}
