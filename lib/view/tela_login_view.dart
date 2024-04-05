// ignore: prefer_typing_uninitialized_variables
// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtTitulo = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Login',
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF6495ED),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: txtTitulo,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtSenha,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Senha',
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
                    setState(() {
                      if(txtTitulo.text.isEmpty || txtEmail.text.isEmpty || txtSenha.text.isEmpty){
                        ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                          backgroundColor: const Color.fromARGB(255, 175, 46, 37),
                          content: Center(
                            child: Text(
                              'Preencha todos os campos',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                          ),
                            duration: Duration(seconds: 3),
                        )
                      );
                      }
                      else{
                        Navigator.pushNamed(context, 'lista');
                      }
                    });
                  },
                  child: Text(
                    'Entrar',
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
                  txtTitulo.clear();
                  txtEmail.clear();
                  txtSenha.clear();
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6495ED),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
              onPressed: () {
                Navigator.pushNamed(context, 'cadastrar');
              },
              child: Text(
                'Novo aqui? Fazer cadastro',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    color: Colors.white),
              ),
            ),
            SizedBox(height:15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6495ED),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
              onPressed: () {
                Navigator.pushNamed(context, 'sobre');
              },
              child: Text(
                'Sobre',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
