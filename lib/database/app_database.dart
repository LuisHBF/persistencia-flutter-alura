import 'package:bytebank/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criarBanco() async {
  return openDatabase(join(await getDatabasesPath(), 'bytebank.db'),
      onCreate: (db, versao) {
    db.execute('CREATE TABLE contatos('
        ' id INTEGER PRIMARY KEY, '
        ' nome TEXT,'
        ' numero_conta INTEGER)');
  }, version: 1);
}

Future<int> salvar(Contato contato) async {
  final Database bd = await criarBanco();
  Map<String, dynamic> mapContato = Map();
  mapContato['nome'] = contato.nome;
  mapContato['numero_conta'] = contato.numero;
  return bd.insert('contatos', mapContato);
}

Future<List<Contato>> todos() async{
  final Database bd = await criarBanco();
  final List<Map<String,dynamic>> resultado = await bd.query('contatos');
  final List<Contato> contatos = List();
  resultado.forEach((map) {
    contatos.add(Contato(map['id'], map['nome'], map['numero_conta']));
  });
  return contatos;
}
