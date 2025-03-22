class Tarea {
  final String id;
  final String titulo;
  bool estaCompletada;

  Tarea({
    required this.id,
    required this.titulo,
    this.estaCompletada = false,
  });
}