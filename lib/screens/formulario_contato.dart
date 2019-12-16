import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/database/dao/contato_dao.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatefulWidget {
  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {

  final ContatoDAO _dao = ContatoDAO();
  final TextEditingController _nomeController = TextEditingController();

  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome Completo'),
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _numeroController,
                decoration: InputDecoration(labelText: 'Número da Conta'),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    final String nome = _nomeController.text;
                    final int numero = int.tryParse(_numeroController.text);
                    Contato contato = Contato(0,nome,numero);
                    _dao.salvar(contato).then((id) =>Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
