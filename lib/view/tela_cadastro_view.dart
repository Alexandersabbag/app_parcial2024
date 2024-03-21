// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/cadastro.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  List <Cadastro> usuario = []; 
  
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro',
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6495ED),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: txtNome,
            decoration: InputDecoration(
                labelText: 'Insira seu Nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 15),
          TextField(
            controller: txtEmail,
            decoration: InputDecoration(
                labelText: 'Insira seu E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 15),
          TextField(
            controller: txtSenha,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Crie uma Senha',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6495ED),
                    fixedSize: Size(110, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13))),
                onPressed: () {
                  usuario.add(Cadastro(txtNome.text ,txtEmail.text ,txtSenha.text));
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6495ED),
                  fixedSize: Size(110, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13))),
              onPressed: () {
                txtNome.clear();
                txtEmail.clear();
                txtSenha.clear();
              },
              child: Text(
                'Limpar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
