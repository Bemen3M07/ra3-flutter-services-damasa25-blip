import 'dart:convert';

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