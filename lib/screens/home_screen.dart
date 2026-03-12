import 'package:flutter/material.dart';
import 'car_list_screen.dart'; // Importa tu pantalla de coches
import 'joke_screen.dart'; // Importa tu pantalla de chistes
import 'tmb_screen.dart'; // Importa la pantalla de búsqueda de paradas TMB
import 'tmbmetro_screen.dart'; // Importa la pantalla de estaciones de metro TMB
import 'planner_screen.dart'; // Importa la pantalla del planner de buses TMB

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
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Ver Estaciones de Metro TMB"),
              onPressed: () {
                // Navegacion a la ventana de estaciones de metro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MetroScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Ver Planner de buses TMB"),
              onPressed: () {
                // Navegacion a la ventana de estaciones de metro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlannerScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}