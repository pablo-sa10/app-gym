import 'package:fitness/model/treino.dart';

class Treinocontroller{
  Future<int>addTreino(String nome, String imagem) async{
    final treino = Treino(nome: nome, imagem: imagem);
    return await treino.insert();
  }
}