import 'dart:convert';

// Esta función ayuda a convertir una lista de JSON en una lista de objetos CarsModel
List<CarsModel> carsModelFromJson(String str) => 
    List<CarsModel>.from(json.decode(str).map((x) => CarsModel.fromMapToCarObject(x)));

// Esta funcion para obtener un string json a partir de una lista de objetos tipo CarsModel
String carsModelToJson(List<CarsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.fromObjectToMap())));

class CarsModel {
  // 1. Atributos (deben coincidir con los del JSON de la API)
  final int id;
  final int year;
  final String make;
  final String model;
  final String type;

  // 2. Constructor
  CarsModel({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });

  // 3. Método Factory: Recibe un Mapa (JSON) y crea una instancia de la clase
  // Es el "fromMapToCarObject" que pide tu práctica
  factory CarsModel.fromMapToCarObject(Map<String, dynamic> json) => CarsModel(
        id: json["id"],
        year: json["year"],
        make: json["make"],
        model: json["model"],
        type: json["type"],
      );

  // 4. Método: Convierte el objeto de nuevo a un Mapa (JSON)
  // Es el "fromObjectToMap" que pide tu práctica
  Map<String, dynamic> fromObjectToMap() => {
        "id": id,
        "year": year,
        "make": make,
        "model": model,
        "type": type,
      };
}