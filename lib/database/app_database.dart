import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void criarBanco(){
  getDatabasesPath().then((dbPath){
    final String path = join(dbPath,'bytebank.db');
    openDatabase(path, onCreate: (db, versao){
      db.execute('CREATE TABLE contatos('
          ' id INTEGER PRIMARY KEY, '
          ' nome TEXT,'
          ' numero_conta INTEGER)');
    }, version: 1);
  });
}