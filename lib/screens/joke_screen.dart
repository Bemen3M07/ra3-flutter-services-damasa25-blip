import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math'; // Para generar el número aleatorio
import '../models/jokemodel.dart';
import '../services/joke_http_service.dart';


// StatefulWidget porque el contenido de la pantalla cambia cuando se obtiene un chiste nuevo
class JokeScreen extends StatefulWidget {
  @override
  _JokeScreenState createState() => _JokeScreenState();
}

// Clase de estado de JokeScreen; contiene los datos asíncronos del chiste
// y gestiona las actualizaciones
class _JokeScreenState extends State<JokeScreen> {
  // Instancia del servicio que recupera chistes desde la API remota
  final JokeHttpService _jokeService = JokeHttpService();

  // Future que se completará con un JokeModel; lo utiliza el FutureBuilder
  late Future<JokeModel> _jokeFuture;

  @override
  void initState() {
    super.initState();
    // Obtener el primer chiste en cuanto el widget se inserta en el árbol
    _jokeFuture = _jokeService.getRandomJoke();
  }

  // Se invoca al pulsar el botón de refrescar; provoca la reconstrucción con
  // un nuevo future
  void _refreshJoke() {
    setState(() {
      _jokeFuture = _jokeService.getRandomJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chistes Malos - Ejercicio 3")),
      body: Center(
        child: FutureBuilder<JokeModel>(
          future: _jokeFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              final joke = snapshot.data!; // El chiste obtenido de la API
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(joke.setup, // Añade texto del setup del chiste
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Text(joke.punchline, // Añade texto del punchline del chiste 
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                      textAlign: TextAlign.center),
                    SizedBox(height: 40),
                    ElevatedButton.icon(
                      onPressed: _refreshJoke, // Llamada a la funcion de refrescar
                      icon: Icon(Icons.refresh), // Icono de refrescar
                      label: Text("¡Dame otro!"), // Texto del botón
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}