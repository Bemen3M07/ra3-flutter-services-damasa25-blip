import 'package:flutter/material.dart';
import 'screens/car_list_screen.dart'; // Importamos la pantalla de la lista de coches
import 'screens/home_screen.dart'; // Importamos la pantalla de inicio

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Página principal con el botón
    );
  }
}