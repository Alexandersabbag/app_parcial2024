// ignore_for_file: use_function_type_syntax_for_parameters, non_constant_identifier_names, prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parcial/view/tela_lista_view.dart';
import 'package:flutter_parcial/view/tela_view_sobre.dart';
import 'view/tela_cadastro_view.dart';
import 'view/tela_login_view.dart';


void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const PrincipalView(),
    ),
  );
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'lista',
      routes: {
        'cadastrar': (context) => CadastroView(),
        'login': (context) => LoginView(),
        'lista': (context) => ListaView(),
        'sobre':(context) => SobreView()
      },
    );
  }
}
