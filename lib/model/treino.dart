import 'package:fitness/services/db_service.dart';
import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class Treino extends ChangeNotifier {
  String id;
  String nome;
  String imagem;

  Treino({required this.nome, required this.imagem}) : id = Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'imagem': imagem,
    };
  }

  factory Treino.fromMap(Map<String, dynamic> map){
    return Treino(
    nome : map['nome'],
    imagem : map['imagem'],
    )..id = map['id'];
  }

  Future<int> insert() async{
    final db = await DbService.instance.database;
    return await db.insert('treino', toMap());
  }
}
