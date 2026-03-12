import 'package:http/http.dart' as http;
import '../models/tmbmodel.dart';
import '../models/plannermodel.dart';

class TmbHttpService {
  final String _appId = "63142c2b"; //
  final String _appKey = "4517aece8a3911b5072d93c4e13cdcde"; //

  Future<List<TmbModel>> getIbus(String stopCode) async {
    // Usamos el endpoint de iBus que es el que contiene el campo "ibus"
    final url = "https://api.tmb.cat/v1/ibus/stops/$stopCode?app_id=$_appId&app_key=$_appKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return tmbModelFromJson(response.body);
    } else {
      throw Exception("Error al consultar la parada");
    }
  }

  // AQUI VIENE EL END-POINT DE METRO DE TMB
  Future<List<MetroModel>> getMetroStations() async {
    // URL para el listado de estaciones de metro
    final url = "https://api.tmb.cat/v1/transit/estacions?app_id=$_appId&app_key=$_appKey";
    
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return metroModelFromJson(response.body);
    } else {
      throw Exception("Error al obtener las estaciones de metro");
    }
  }

  // AQUI VIENE EL END-POINT DE PLANNER DE TMB
  Future<List<PlannerModel>> getLines() async {
  // Endpoint de líneas de bus dentro del sistema de tránsito
  final url = "https://api.tmb.cat/v1/transit/linies/bus?app_id=$_appId&app_key=$_appKey";
  
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return plannerModelFromJson(response.body);
  } else {
    throw Exception("Error al conectar con el Planner de TMB");
  }
}

}



