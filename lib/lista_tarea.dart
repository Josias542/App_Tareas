import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'proveedor_tareas.dart';

class PantallaListaTareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proveedorTareas = Provider.of<ProveedorTareas>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicación de Lista de Tareas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tareas Totales: ${proveedorTareas.totalTareas}'),
                Text('Tareas Completadas: ${proveedorTareas.tareasCompletadas}'),
                Text('Progreso: ${proveedorTareas.porcentajeProgreso.toStringAsFixed(2)}%'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: proveedorTareas.tareas.length,
              itemBuilder: (context, indice) {
                final tarea = proveedorTareas.tareas[indice];
                return ListTile(
                  title: Text(tarea.titulo),
                  trailing: Checkbox(
                    value: tarea.estaCompletada,
                    onChanged: (valor) {
                      proveedorTareas.alternarCompletacionTarea(tarea.id);
                    },
                  ),
                  onLongPress: () {
                    proveedorTareas.eliminarTarea(tarea.id);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogoAgregarTarea(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _mostrarDialogoAgregarTarea(BuildContext context) {
    final proveedorTareas = Provider.of<ProveedorTareas>(context, listen: false);
    final controladorTexto = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Agregar Tarea'),
          content: TextField(
            controller: controladorTexto,
            decoration: InputDecoration(hintText: 'Ingrese el título de la tarea'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controladorTexto.text.isNotEmpty) {
                  proveedorTareas.agregarTarea(controladorTexto.text);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}