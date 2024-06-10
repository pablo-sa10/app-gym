class Exercicio {
  int id;
  int treinoId;
  String nome;
  int series;
  int repeticoes;

  Exercicio({
    required this.id,
    required this.treinoId,
    required this.nome,
    required this.series,
    required this.repeticoes,
  });

  factory Exercicio.fromMap(Map<String, dynamic> map) {
    return Exercicio(
      id: map['id'],
      treinoId: map['treinoId'],
      nome: map['nome'],
      series: map['serie'],
      repeticoes: map['repeticoes'],
    );
  }

  Map<String, dynamic> toMap(){
    return{

    };
  }

}
