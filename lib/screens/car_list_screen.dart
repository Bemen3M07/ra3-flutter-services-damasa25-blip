// ============================================================
// IMPORTS - Librerías necesarias para la pantalla
import 'package:flutter/material.dart';       // Widgets de Material Design
import '../services/car_http_service.dart';   // Nuestro servicio HTTP para la API
import '../models/carsmodel.dart';            // Modelo de datos CarsModel


// ============================================================
// STATEFUL WIDGET - Pantalla que puede cambiar de estado
// Usamos StatefulWidget porque los datos vienen de una API (asíncrono)
// y la UI necesita actualizarse cuando llegan los datos
class CarListScreen extends StatefulWidget {
  @override
  _CarListScreenState createState() => _CarListScreenState();
}


// ============================================================
// STATE - Lógica y construcción de la UI
class _CarListScreenState extends State<CarListScreen> {
  // Instanciamos el servicio que del Ejercicio 1
  // Este objeto nos permite llamar a getCars() para obtener los coches
  final CarHttpService _carService = CarHttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ----------------------------------------------------
      // APPBAR - Barra superior con título
      appBar: AppBar(
        title: Text('Listado de Coches - Ejercicio 2'),
        backgroundColor: Colors.blueAccent,
      ),

      // ----------------------------------------------------
      // FUTUREBUILDER - Widget que maneja operaciones asíncronas
      // ConnectionState.done = petición finalizada (éxito o error)
      // Si no está done, mostramos spinner de carga
      body: FutureBuilder<List<CarsModel>>(
        future: _carService.getCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return ListCars(cars: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// ============================================================
// WIDGET LISTCARS - Widget reutilizable para mostrar la lista
class ListCars extends StatelessWidget {
  // Atributo: lista de coches que recibiremos del FutureBuilder
  final List<CarsModel> cars;

  // Constructor: recibe la lista de coches como parámetro obligatorio
  const ListCars({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    // ----------------------------------------------------
    // LISTVIEW.SEPARATED - Lista scrollable con divisores
    // - ListView.separated: construye items + separador entre cada uno
    return ListView.separated(
      // Número total de elementos a mostrar
      itemCount: cars.length,
      
      // separatorBuilder: Widget que se pone ENTRE cada item (no antes del primero ni después del último)
      // Recibe context e index por si quieres personalizar el separador según posición
      separatorBuilder: (context, index) => const Divider(),
      
      // itemBuilder: Construye cada elemento de la lista bajo demanda
      itemBuilder: (context, index) {
        // Obtenemos el coche de la posición actual
        final car = cars[index];
        
        return ListTile(
          // leading: Widget a la izquierda
          leading: CircleAvatar(
            child: Text(car.make[0]),  // car.make[0] = primera letra de la marca
          ),
          
          // title: Texto principal
          title: Text('${car.make} ${car.model}'),
          
          // subtitle: Texto secundario
          subtitle: Text('Año: ${car.year} - Tipo: ${car.type}'),
          
          // trailing: Widget a la derecha
          trailing: const Icon(Icons.directions_car),
        );
      },
    );
  }
}