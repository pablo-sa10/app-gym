import 'package:fitness/services/db_service.dart';

class Exercicio {
  String id;
  String treinoId;
  String nome;
  int series;
  String repeticoes;

  Exercicio({
    required this.id,
    required this.treinoId,
    required this.nome,
    required this.series,
    required this.repeticoes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'treinoId': treinoId,
      'nome': nome,
      'series': series,
      'repeticoes': repeticoes
    };
  }

  factory Exercicio.fromMap(Map<String, dynamic> map) {
    return Exercicio(
      id: map['id'],
      treinoId: map['treinoId'],
      nome: map['nome'],
      series: map['serie'],
      repeticoes: map['repeticoes'],
    );
  }

  Future<int> insert() async{
    final db = await DbService.instance.database;
    return await db.insert('exercicio', toMap());
  }
}
