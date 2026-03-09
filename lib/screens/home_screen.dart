import 'package:flutter/material.dart';
import 'car_list_screen.dart'; // Importa tu pantalla de coches
import 'joke_screen.dart'; // Importa tu pantalla de chistes
import 'tmb_screen.dart'; // Importa la pantalla de búsqueda de paradas TMB

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inicio - Práctica 5d")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: Text("Ver Listado de Coches"),
              onPressed: () {
                // Navegación a la segunda página
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarListScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Ver chistes aleatorios"),
              onPressed: () {
                // Navegacion a la ventana de chistes
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JokeScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Buscar paradas TMB"),
              onPressed: () {
                // Navegacion a la ventana de paradas TMB
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TmbScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}