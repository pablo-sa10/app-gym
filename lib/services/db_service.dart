import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  // Construtor com acesso privado
  DbService._();

  //Criar uma instancia de DbService
  static final DbService instance = DbService._();

  //Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'fitness.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_treino);
    await db.execute(_exercicio);
  }

  String get _treino => '''
    CREATE TABLE treino (
      id INTERGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      imagem TEXT
    );
  ''';

  String get _exercicio => '''
    CREATE TABLE exercicio (
      id INTERGER PRIMARY KEY AUTOINCREMENT,
      treino_id INTERGER,
      nome TEXT,
      series TEXT,
      repeticoes TEXT
    );
  ''';
}
