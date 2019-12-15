import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/formulario_contato.dart';
import 'package:bytebank/screens/lista_contatos.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF1B5E20),
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: ListaContatos()
    );
  }
}


