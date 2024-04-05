// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/lista.dart';


class ListaView extends StatefulWidget {
  const ListaView({super.key});
  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  
  @override
  void initState() {
    index = -1;
    super.initState();
  }

  
  List<Tarefas> lista = [];
  var index;
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lista de Tarefas',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF6495ED),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: adicionarTarefa(),
          ),
          Expanded(
            flex: 2,
            child: listarTarefa(),
          ),
        ],
      ),

      );
  }

  //função add tarefa
  adicionarTarefa() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: txtTitulo,
            style: TextStyle(fontSize: 28),
            decoration: InputDecoration(
              labelText: 'Título',
              labelStyle: TextStyle(fontSize: 18),
              icon: Icon(Icons.title),
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
              icon: Icon(Icons.description),
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
                      mensagem('Preencha todos os campos');
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

  //função listar tarefa
  listarTarefa() {
    return 
    Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(lista[index].titulo),
              subtitle: Text(lista[index].descricao),
              leading: Checkbox(
                value: lista[index].isChecked, 
                onChanged: (value) {
                  setState(() {
                    lista[index].isChecked = value;
                  });
                },),
              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
                onPressed: () {
                  setState(() {
                    lista.removeAt(index);
                  });
                },
              ),
              onTap: () {
                setState(() {
                  this.index = index;
                  txtTitulo.text = lista[index].titulo;
                  txtDescricao.text = lista[index].descricao;
                });
              },
            ),
          );
        },
      ),
    );
  }

  //mensagem para o rodapé 
  mensagem(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: TextStyle(fontSize: 20),),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}