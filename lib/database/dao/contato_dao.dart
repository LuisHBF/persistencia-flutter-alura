import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDAO{

  static const String sqlTabela = 'CREATE TABLE $_nomeTabela('
      ' $_id INTEGER PRIMARY KEY, '
      ' $_nome TEXT,'
      ' $_numeroConta INTEGER)';

  static const String _nomeTabela = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_conta';

  Future<int> salvar(Contato contato) async {
    final Database bd = await criarBanco(ContatoDAO.sqlTabela);
    Map<String, dynamic> mapContato = _toMap(contato);
    return bd.insert(_nomeTabela, mapContato);
  }

  Future<List<Contato>> todos() async{
    final Database bd = await criarBanco(ContatoDAO.sqlTabela);
    final List<Map<String,dynamic>> resultado = await bd.query(_nomeTabela);
    List<Contato> contatos = _toList(resultado);
    return contatos;
  }

  List<Contato> _toList(List<Map<String, dynamic>> resultado) {
    final List<Contato> contatos = List();
    resultado.forEach((map) {
      contatos.add(Contato(map[_id], map[_nome], map[_numeroConta]));
    });
    return contatos;
  }

  Map<String, dynamic> _toMap(Contato contato) {
    Map<String, dynamic> mapContato = Map();
    mapContato[_nome] = contato.nome;
    mapContato[_numeroConta] = contato.numero;
    return mapContato;
  }


}