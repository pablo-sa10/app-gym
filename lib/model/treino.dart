import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'exercicio.dart';

class Treino extends ChangeNotifier{
   late Database db;
   late String nome;
   late String imagem;
   List<Exercicio> _exercicio = [];

}