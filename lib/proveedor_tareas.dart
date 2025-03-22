import 'package:flutter/material.dart';
import 'tarea.dart';

class ProveedorTareas with ChangeNotifier {
  List<Tarea> _tareas = [];

  List<Tarea> get tareas => _tareas;

  int get totalTareas => _tareas.length;

  int get tareasCompletadas => _tareas.where((tarea) => tarea.estaCompletada).length;

  double get porcentajeProgreso {
    if (_tareas.isEmpty) return 0.0;
    return (tareasCompletadas / totalTareas) * 100;
  }

  void agregarTarea(String titulo) {
    _tareas.add(Tarea(
      id: DateTime.now().toString(),
      titulo: titulo,
    ));
    notifyListeners();
  }

  void alternarCompletacionTarea(String id) {
    final indiceTarea = _tareas.indexWhere((tarea) => tarea.id == id);
    if (indiceTarea >= 0) {
      _tareas[indiceTarea].estaCompletada = !_tareas[indiceTarea].estaCompletada;
      notifyListeners();
    }
  }

  void eliminarTarea(String id) {
    _tareas.removeWhere((tarea) => tarea.id == id);
    notifyListeners();
  }
}