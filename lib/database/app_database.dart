import 'package:bytebank/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criarBanco() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, versao) {
      db.execute('CREATE TABLE contatos('
          ' id INTEGER PRIMARY KEY, '
          ' nome TEXT,'
          ' numero_conta INTEGER)');
    }, version: 1);
  });
}

Future<int> salvar(Contato contato) {
  return criarBanco().then((db) {
    Map<String, dynamic> mapContato = Map();
    mapContato['nome'] = contato.nome;
    mapContato['numero_conta'] = contato.numero;
    return db.insert('contatos', mapContato);
  });
}

Future<List<Contato>> todos() {
  return criarBanco().then((db) {
    return db.query('contatos').then((maps) {
      final List<Contato> contatos = List();
      maps.forEach((map) {
        contatos.add(Contato(map['id'],map['nome'],map['numero_conta']));
      });
      return contatos;
    });
  });
}
