import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'proveedor_tareas.dart';
import 'lista_tarea.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProveedorTareas(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Lista de Tareas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaListaTareas(),
    );
  }
}