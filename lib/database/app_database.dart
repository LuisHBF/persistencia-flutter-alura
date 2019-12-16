import 'package:bytebank/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criarBanco(String sql) async {
  return openDatabase(join(await getDatabasesPath(), 'bytebank.db'),
      onCreate: (db, versao) {
    db.execute(sql);
  }, version: 1);
}


