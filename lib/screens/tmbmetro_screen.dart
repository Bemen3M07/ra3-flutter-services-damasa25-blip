import 'package:flutter/material.dart';
import '../services/tmb_http_service.dart';
import '../models/tmbmodel.dart';


class MetroScreen extends StatelessWidget {
  final TmbHttpService _service = TmbHttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estaciones de Metro TMB"),
      ),
      body: FutureBuilder<List<MetroModel>>(
        future: _service.getMetroStations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final estacion = snapshot.data![index];
                return ListTile(
                  leading: Icon(Icons.subway, color: Colors.orange),
                  title: Text(estacion.name),
                  subtitle: Text(estacion.localizedName),
                );
              },
            );
          }
        },
      ),
    );
  }
}