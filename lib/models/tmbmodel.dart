import 'dart:convert';

// AQUI VIENE END-POINT DE BUSES DE TMB
// Función para mapear la lista que viene dentro de data -> ibus
List<TmbModel> tmbModelFromJson(String str) {
  final jsonData = json.decode(str);
  return List<TmbModel>.from(jsonData["data"]["ibus"].map((x) => TmbModel.fromJson(x)));
}

class TmbModel {
  final String line;
  final String destination;
  final String tInMin; // Tiempo en minutos

  TmbModel({required this.line, required this.destination, required this.tInMin});

  factory TmbModel.fromJson(Map<String, dynamic> json) => TmbModel(
        line: json["line"],
        destination: json["destination"],
        tInMin: json["t-in-min"].toString(),
      );
}

// AQUI VIENE EL END-POINT DE METRO DE TMB

List<MetroModel> metroModelFromJson(String str) {
  final jsonData = json.decode(str);
  // En este endpoint, los datos vienen en una lista llamada 'features'
  if (jsonData["features"] != null) {
    return List<MetroModel>.from(
        jsonData["features"].map((x) => MetroModel.fromJson(x)));
  }
  return [];
}

class MetroModel {
  final String name;
  final String localizedName;

  MetroModel({required this.name, required this.localizedName});

  factory MetroModel.fromJson(Map<String, dynamic> json) {
    // Los nombres de las estaciones están dentro de 'properties'
    return MetroModel(
      name: json["properties"]["NOM_ESTACIO"] ?? "Sin nombre",
      localizedName: json["properties"]["DESC_ESTACIO"] ?? "",
    );
  }
}