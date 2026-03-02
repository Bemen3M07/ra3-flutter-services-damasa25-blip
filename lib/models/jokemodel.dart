import 'dart:convert';

// Función para convertir el JSON en una lista de chistes
List<JokeModel> jokeModelFromJson(String str) => 
    List<JokeModel>.from(json.decode(str).map((x) => JokeModel.fromJson(x)));

// Atributos
class JokeModel {
  final String setup;
  final String punchline;
  final int id;

// Constructor
  JokeModel({required this.setup, required this.punchline, required this.id});

// Método Factory: Recibe un Mapa (JSON) y crea una instancia de la clase
  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
        setup: json["setup"],
        punchline: json["punchline"],
        id: json["id"],
      );
}