import 'package:flutter/material.dart';
import '../services/tmb_http_service.dart';
import '../models/plannermodel.dart';

class PlannerScreen extends StatelessWidget {
  final TmbHttpService _service = TmbHttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Líneas de Bus (Planner)")),
      body: FutureBuilder<List<PlannerModel>>(
        future: _service.getLines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return Center(child: Text("Error al cargar líneas"));

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final linea = snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(int.parse("0xFF${linea.color}")),
                  child: Text(linea.nombreLinea, style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
                title: Text("Línea ${linea.nombreLinea}"),
                subtitle: Text(linea.descripcion),
              );
            },
          );
        },
      ),
    );
  }
}