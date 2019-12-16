import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/database/dao/contato_dao.dart';
import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/formulario_contato.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {

  final ContatoDAO _dao = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder(
          future: _dao.todos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Carregando...')
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                List<Contato> contatos = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contato contato = contatos[index];
                    return _itemContato(contato);
                  },
                  itemCount: contatos.length,
                );
                break;
            }

            return Text('Erro desconhecido!');
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(
                  MaterialPageRoute(builder: (context) => FormularioContato()))
              .then((contato) => debugPrint(contato.toString())),
          child: Icon(Icons.add)),
    );
  }
}

class _itemContato extends StatelessWidget {
  final Contato contato;

  _itemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contato.numero.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
