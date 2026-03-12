import 'dart:convert';

List<PlannerModel> plannerModelFromJson(String str) {
  final jsonData = json.decode(str);
  return List<PlannerModel>.from(jsonData["features"].map((x) => PlannerModel.fromJson(x)));
}

class PlannerModel {
  final String nombreLinea;
  final String descripcion;
  final String color;

  PlannerModel({required this.nombreLinea, required this.descripcion, required this.color});

  factory PlannerModel.fromJson(Map<String, dynamic> json) => PlannerModel(
        nombreLinea: json["properties"]["NOM_LINIA"] ?? "N/A",
        descripcion: json["properties"]["DESC_LINIA"] ?? "",
        color: json["properties"]["COLOR_LINIA"] ?? "FF0000",
      );
}