// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'view/tela_listaopen.dart';
import 'view/tela_login.dart';
import 'view/tela_principal.dart';
import 'view/tela_recsenha.dart';

/*void main() {
  runApp(const MainApp());
}*/

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',

      //Rotas de navegação

      initialRoute: 'login',
      routes: {
        'login': (context) => TelaLogin(),
        'principal': (context) => TelaPrincipal(),
        'rec': (context) => TelaRecSenha(),
        'lista': (context) => TelaListaOpen(),
      },
    );
  }
}
