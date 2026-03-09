import 'package:flutter/material.dart';
import '../services/tmb_http_service.dart';
import '../models/tmbmodel.dart';

class TmbScreen extends StatefulWidget {
  @override
  _TmbScreenState createState() => _TmbScreenState();
}

class _TmbScreenState extends State<TmbScreen> {
  final TextEditingController _controller = TextEditingController();
  final TmbHttpService _service = TmbHttpService();
  Future<List<TmbModel>>? _busFuture;

  void _search() {
    setState(() {
      // Disparamos la búsqueda con el texto del controlador
      _busFuture = _service.getIbus(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buscador de Paradas TMB")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Introduce código de parada",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: _search),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<TmbModel>>(
              future: _busFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
                if (snapshot.hasError) return Center(child: Text("Parada no encontrada"));
                if (!snapshot.hasData) return Center(child: Text("Introduce una parada para empezar"));

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final bus = snapshot.data![index];
                    return ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.red, child: Text(bus.line, style: TextStyle(color: Colors.white))),
                      title: Text(bus.destination),
                      trailing: Text("${bus.tInMin} min", style: TextStyle(fontWeight: FontWeight.bold)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}