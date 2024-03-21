// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_parcial/model/lista.dart';

class ListaView extends StatefulWidget {
  const ListaView({super.key});

  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  List<Tarefas> lista = [];
  var index;
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.all(1),
          child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6495ED),
                    fixedSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13))),
                onPressed: () {
                  showDialog(context: context, builder: (context) => Dialog(
                    child: adicionarContato(),
                    
                  ));
                },
                child: Text(
                  'Adicionar Tarefa',
                  style: TextStyle(color: Colors.white),
                )),
        ),
        appBar: AppBar(
          title: Text(
            'Lista de Tarefas',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF6495ED),
        ),
        body: null
      );
  }
  adicionarContato() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: txtTitulo,
            style: TextStyle(fontSize: 28),
            decoration: InputDecoration(
              labelText: 'Título',
              labelStyle: TextStyle(fontSize: 18),
              icon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: txtDescricao,
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
              labelText: 'Descreva a tarefa',
              labelStyle: TextStyle(fontSize: 18),
              icon: Icon(Icons.smartphone),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  foregroundColor: Color.fromRGBO(91, 97, 106, 1),
                  backgroundColor: Color.fromRGBO(206, 211, 220, 1),
                ),
                onPressed: () {
                  setState(() {
                    if (txtTitulo.text.isNotEmpty &&
                        txtDescricao.text.isNotEmpty) {
                      if (index == -1) {
                        lista.add(Tarefas(txtTitulo.text,txtDescricao.text),);
                      } else {
                        lista[index] = Tarefas(txtTitulo.text, txtDescricao.text);
                      }
                      txtTitulo.clear();
                      txtDescricao.clear();
                      index = -1;
                    } else {
                      //'Os campos nome e telefone precisam ser preenchidos.'
                    }
                  });
                },
                child: Text('salvar'),
              ),
            ],
          ),
        ],
      ),
    );
  }

}