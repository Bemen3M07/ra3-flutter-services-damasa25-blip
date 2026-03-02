import 'package:http/http.dart' as http;
import 'dart:math'; // Para generar el número aleatorio
import '../models/jokemodel.dart';

// Servicio HTTP encargado de consultar la API de chistes
class JokeHttpService {
  // URL base de la colección de chistes
  final String _url = "https://api.sampleapis.com/jokes/goodJokes";

  // Obtiene un chiste aleatorio de la API
  Future<JokeModel> getRandomJoke() async {
    // Ejecuta la petición GET a la URL definida arriba
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      // Decodifica el JSON en una lista de modelos
      List<JokeModel> allJokes = jokeModelFromJson(response.body);
      // Seleccionamos uno al azar de la lista
      return allJokes[Random().nextInt(allJokes.length)];
    } else {
      // Si la respuesta no es correcta, lanzamos una excepción
      throw Exception("Error al conectar con la API de chistes");
    }
  }
}