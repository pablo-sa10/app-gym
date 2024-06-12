import 'package:fitness/model/exercicio.dart';

class ExercicioController {
  Future<int>addExercicio(String id, String treinoId, String nome,
      int series, String repeticoes) async {
    final exercicio = Exercicio(
      id: id,
      treinoId: treinoId,
      nome: nome,
      series: series,
      repeticoes: repeticoes
    );
    return await exercicio.insert();
  }
}