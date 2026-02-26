import 'package:flutter/material.dart';
import 'car_list_screen.dart'; // Importa tu pantalla de coches

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inicio - Práctica 5d")),
      body: Center(
        child: ElevatedButton(
          child: Text("Ver Listado de Coches"),
          onPressed: () {
            // Navegación a la segunda página
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CarListScreen()),
            );
          },
        ),
      ),
    );
  }
}