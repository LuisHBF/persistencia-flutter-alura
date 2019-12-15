import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/formulario_contato.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {

  final List<Contato> contatos = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return _itemContato(contatos[index]);
        },
        itemCount: contatos.length,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(
                  MaterialPageRoute(builder: (context) => FormularioContato()))
              .then((contato) => debugPrint(contato.toString())),
          child: Icon(Icons.add)),
    );
  }
}

class _itemContato extends StatelessWidget{

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